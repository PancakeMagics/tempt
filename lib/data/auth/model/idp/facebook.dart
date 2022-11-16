part of auth;

// TODO: implement more
class _IdpFacebook {
  const _IdpFacebook._();

  factory _IdpFacebook() => const _IdpFacebook._();

  // Future<LoginResult> get _account => FacebookAuth.i.login();

  Future<C> getCredential<C>(
    C Function(String accessToken) credentialGetter,
  ) async {
    // final accessToken = (await _account).accessToken;
    // if (accessToken == null) {
      throw const AuthServiceIdpNotSignedException();
    // } else {

      // return credentialGetter(accessToken.token);
    // }
  }
}
