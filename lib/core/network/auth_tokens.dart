/// A credential pair issued by the backend.
class AuthTokens {
  const AuthTokens({required this.accessToken, required this.refreshToken});

  final String accessToken;

  /// Empty when the backend issues no refresh token, in which case a 401 ends
  /// the session rather than triggering a renewal.
  final String refreshToken;

  bool get canRefresh => refreshToken.isNotEmpty;
}

/// Exchanges an expired session for a fresh one.
///
/// This is the one piece of authentication a boilerplate cannot supply: the
/// endpoint, its payload, and its response shape are specific to a backend.
/// Implement it in the feature that owns authentication and register it, and
/// the retry machinery in `AuthInterceptor` starts working.
abstract class TokenRefresher {
  /// Returns fresh tokens, or null when the session cannot be renewed.
  ///
  /// Must not go through the authenticated client, or a failing refresh would
  /// trigger another refresh.
  Future<AuthTokens?> refresh(String refreshToken);
}

/// The default: no session can be renewed, so a 401 logs the user out.
///
/// Correct for an app with no auth yet, and correct as a fallback for one
/// whose backend issues no refresh tokens. Replace it in DI when you have an
/// endpoint to call.
class UnsupportedTokenRefresher implements TokenRefresher {
  const UnsupportedTokenRefresher();

  @override
  Future<AuthTokens?> refresh(String refreshToken) async => null;
}
