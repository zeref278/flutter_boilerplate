# Working in this repository

Conventions and invariants for anyone — human or agent — changing this code.
The README explains what the project *is*; this file is what you need to not
break it.

## Commands

```sh
make setup                              # deps + all code generation
make analyze                            # dart format --set-exit-if-changed + dart analyze
make test                               # unit and widget tests
make run_dev                            # bake .env.dev, then run
make build_apk_production               # bake .env.production, then build
make coverage COVERAGE_DEVICE=<ios-id>  # merged trace, 80% gate
make rename NAME= ORG= DISPLAY=         # rename the project
make flavorize                          # regenerate native flavor scaffolding
```

FVM is optional; targets use `fvm` when installed and plain `flutter` when
not. Override with `make test FLUTTER=... DART=...`.

Before saying work is done: `make analyze` and `make test` both clean.

## `dart analyze` must report nothing

Zero issues — not zero errors, zero *issues*. That is the contract. If your
change introduces one, fix it rather than raising a baseline, and do not
reach for `// ignore:`.

Two shapes recur, both already solved in the tree:

- **`prefer_initializing_formals`.** Dart has no private *named* initializing
  formal, so `({required X x}) : _x = x` cannot be written the way the lint
  asks. Use a positional `this._x`, or make the field public `final`.
- **`avoid_catching_errors`.** When a library signals a recoverable condition
  with an `Error` subtype, match it inside the block and rethrow the rest —
  see `_openOrRecreate` in `encrypted_store.dart` — rather than naming it in
  the `on` clause.

## Invariants

These are load-bearing. Breaking one is a bug even if it compiles.

### `core` names no feature

`grep -ri dog_image lib/core` must return nothing. Widget keys live with the
surface, feature tables live with the feature, and `Injector` is handed its
module list rather than importing one.

The two files allowed to know every feature are flat lists outside `core`:

| File | Names every | Adding a feature |
|---|---|---|
| `lib/di/app_modules.dart` | DI module | one line |
| `lib/database/app_database.dart` | Drift table | one entry, plus the table under the feature |

### Features import `core` through one barrel

`package:boilerplate/core/core.dart`. It is a **curated** export list, not
`export everything`. Storage backends (`EncryptedStore`, `Keychain`,
`AppStorageImpl`) and composition wiring (`CoreModule`, `createDio`, the log
and crash services) are absent on purpose — that is what keeps "application
code injects only `AppStorage`" enforced by imports rather than by convention.

Nothing inside `core` may import the barrel, or a cycle forms. Tests import by
path, because they deliberately reach the internals the barrel omits.

### Configuration is compiled in, never read at runtime

Values come from one `.env` file baked by `envied` at code-generation time.
`AppConfig` is the facade; **nothing outside `lib/config/env/` reads `Env`**,
and nothing reads a `.env` file at runtime.

Never edit `lib/config/env/env.g.dart`. To change a value, edit the `.env`
file and re-run `make env_<flavor>`. Editing a `.env` in place and rebuilding
the same flavor can reuse a cached result — run `make clean_gen` if a value
looks stale.

Adding a flavor means adding it in **five** places, or it half-exists:
`.env.<flavor>`, `flavorizr.yaml`, `AppFlavor`, `FLAVORS` in the `Makefile`,
and `ios/Runner/Assets.xcassets/AppIcon-<flavor>.appiconset`.

### Security vendor is named in two files only

`lib/core/security/rasp_secure_app_guard.dart` and
`rasp_network_security.dart`. Everything else sees `SecureAppGuard`,
`SecureAppThreat`, and `NetworkSecurity`. Same principle keeps Hive inside
`EncryptedStore`.

`security` is a **required** argument on `createDio`. Keep it required, so a
new caller is a decision about transport security rather than an omission.

### Never log a credential

A credential reaches a log through three doors, and all three are shut:

- **Headers** — redacted by name against `defaultRedactedHeaders`. Add any
  new secret-carrying header to that deny-list.
- **Query strings** — redacted by name against `defaultRedactedParams`.
  `?api_key=` reads as plainly in scrollback as any header.
- **Bodies** — not written unless `logBodies: true`. A login body's password
  and a token endpoint's response are the payload, under a key this class
  cannot guess, so the default is to write nothing. Turning it on is a
  deliberate debugging choice, not something to leave on.

Do not reintroduce `pretty_dio_logger` — it prints `options.headers`
verbatim, which is why it was removed.

### Transient messages go in the overlay, never on the Navigator

`AppToast.show` inserts an `OverlayEntry`. Do not reach for
`another_flushbar` — it was removed because it shows its bar by *pushing a
route*, so the back button dismissed it, `RouteObserver`s counted it as a
navigation, and a `pop` during its lifetime popped the bar instead of the
page. A notification is not a destination.

`ScaffoldMessenger` is not the answer either: it is per-`Scaffold`, so the
same failure looks different depending on which screen raised it, and a
screen with no `Scaffold` cannot show one at all.

The app mounts one `Overlay` above the router in `MaterialApp.builder`, and
`show` targets the root overlay, so every toast lands in the same layer and
outlives the route that raised it. That mount is also what gives the
app-level `BlocListener` an overlay to find — `MaterialApp.builder` runs
above the `Navigator`, so without it an app-level failure would be shown
nowhere.

The auto-dismiss timer belongs to the toast's `State`, not to `AppToast`.
A timer parked in a static outlives the widget, and every widget test that
raised a toast then fails teardown with *"A Timer is still pending even
after the widget tree was disposed"*.

### Interceptor order is the contract

```text
pinning  →  auth  →  logging
```

`createDio` installs security interceptors first. A rejected connection must
not reach anything that would log it, retry it, or attach a credential to it.

`AuthInterceptor` is a plain `Interceptor`, **not** a `QueuedInterceptor`. A
queued one holds the chain while handling an error, and the retry replays
through that same chain — it deadlocks. The single-flight future provides the
serialization instead.

### Storage role is chosen by the key, never by the caller

Credentials go to the platform keychain because their keys are in
`StorageKeys.secretKeys`. Everything else lands in the AES-256 box.
Application code injects `AppStorage` and nothing else. Adding a credential
key to `secretKeys` **is** the act of securing it.

### Notifications are one-shot and sealed per bloc

Every bloc owns its own sealed union as a `part` beside its event and state.
A shared union in `core` is impossible — Dart requires every subtype of a
`sealed` type to live in the same library.

Every union is `@Freezed(equal: false)`. That identity equality is
load-bearing: two failures carrying the same value must present as two
notifications, and under value equality `listenWhen` silently swallows the
second.

The page switches exhaustively, so a new outcome does not compile until
someone decides which widget shows it.

### Errors become typed failures at the repository

Data sources throw. Repositories convert through `guard` into
`Either<Failure, T>`. Use cases pass it through. BLoCs render it through
`failure.displayMessage(context)`. Internal exception text never reaches a
user.

## Generated code

Nothing generated is committed: `*.g.dart`, `*.freezed.dart`, `*.mocks.dart`,
`lib/generated/`. Run `make setup` after cloning and `make generate` after
changing a generator input. Never hand-edit a generated file.

## Tests

- `test/unit/`, `test/widget/` — run on the host by `flutter test`
- `integration_test/` — **root level, never inside `test/`**

That placement is not style. `flutter test` with no arguments runs everything
under `test/`; an integration test there hangs for over two minutes and then
fails, because there is no device binding. Measured, not assumed.

Device runs need a flavor, since no plain `Debug` configuration survives
product flavors:

```sh
flutter test integration_test/cases/app_flow_test.dart -d <device-id> --flavor dev
```

Coverage gates at 80% across authored `lib/`, merging the host and device
traces. Generated sources are excluded from the total.

Know what that denominator is. `flutter test --coverage` emits a record only
for a library the run actually loaded, so a `lib/` file no test imports is
invisible to the gate — it measures authored code *that something imported*,
not all authored code. Counting the rest would drag in the composition root
(the DI modules, `bootstrap`, `main`: about 260 lines) and cost roughly twelve
points, to be won back by tests asserting that registration code registers
things. The floor is on logic, not on wiring. The practical consequence: a new
`lib/` file with no test does not move this number, but a partly tested one
does.

Prefer hand-written fakes over mocks for anything with behaviour. Name tests
for the behaviour under test, not the method.

## Style

- `dart format` — 80 columns, trailing commas on multi-line arguments
- `package:` imports throughout, sorted: `dart:` → `package:` → relative
- Comments explain **why**, not what. If a line needs a comment to say what it
  does, rename something instead.
- Files under 400 lines, functions under 50
- Prefer early returns over nesting; exhaustive `switch` over `is` chains

## Changing native config

`make flavorize` is safe to repeat but not surgical: it rewrites
`AndroidManifest.xml`, `Info.plist`, and `project.pbxproj`, reflowing their
formatting and dropping trailing newlines. Read `git diff android ios` every
time.

## Before shipping

- `VALID_ANDROID_SIGNATURES` in `.env.production` — empty means the signature
  check passes for a resigned APK
- `SPKI_SHA256_HASHES` in `.env.production` — empty means nothing is pinned
- `android/key.properties` — absent means releases sign with the debug key
