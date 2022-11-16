part of auth;

// TODO: implement more
class _IdpYahoo {
  const _IdpYahoo._();

  factory _IdpYahoo() => const _IdpYahoo._();

  // Future<LoginResult> get _account => throw UnimplementedError();

  Future<C> getCredential<C>(
      C Function(String accessToken) credentialGetter,
      ) async {
    throw UnimplementedError();
  }
}
