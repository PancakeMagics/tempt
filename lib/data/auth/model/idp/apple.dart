part of auth;

// TODO: see https://pub.dev/packages/sign_in_with_apple for implement more
class _IdpApple {
  const _IdpApple._();

  factory _IdpApple() => const _IdpApple._();

  Future<AuthorizationCredentialAppleID> get _credential =>
      SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.fullName,
        AppleIDAuthorizationScopes.email,
      ]);

  Future<C> getCredential<C>(
    C Function(String accessToken) credentialGetter,
  ) async {
    final credential = (await _credential);


    /// see https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_rest_api/verifying_a_user#:~:text=with%20Apple.-,Verify%20the%20identity%20token,-Start%20by%20securely
    /// verify the identityToken
    final token = credential.identityToken;

    log(credential.toString());

    if (token == null) {
      throw const AuthServiceIdpNotSignedException();
    } else {
      return credentialGetter(token);
    }
  }
}
