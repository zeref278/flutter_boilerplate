</div>

# Flutter Flavor Configuration
## How to Use 
**Step 1:**

Fork, download or clone this repo by using the link below:

```
https://github.com/TmtSeminar/flavor_config.git
```

**Step 2:**
Go to root project and execute the following command in terminal to get the required dependencies and generate languages, freezed, flutter gen: 

```cmd
flutter pub get
flutter pub run intl_utils:generate
flutter pub run build_runner build --delete-conflicting-outputs
```

**Step 3:**
Go to `/packages/rest_client` and execute the following command in terminal to generate model and api client: 

```cmd
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```





