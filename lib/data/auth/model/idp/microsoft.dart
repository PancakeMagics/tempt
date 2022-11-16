part of auth;

// TODO: implement more
class _IdpMicrosoft {
  const _IdpMicrosoft._();

  factory _IdpMicrosoft() => const _IdpMicrosoft._();

  // Future<LoginResult> get _account => throw UnimplementedError();

  Future<C> getCredential<C>(
      C Function(String accessToken) credentialGetter,
      ) async {
    // final accessToken = (await _account).accessToken;
    // if (accessToken == null) {
      throw const AuthServiceIdpNotSignedException();
    // } else {
    //   return credentialGetter(accessToken.token);
    // }
  }
}
