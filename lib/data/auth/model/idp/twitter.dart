part of auth;

// TODO: implement more
class _IdpTwitter {
  const _IdpTwitter._();

  factory _IdpTwitter() => const _IdpTwitter._();

  // Future<LoginResult> get _account => throw UnimplementedError();

  Future<C> getCredential<C>(
    C Function({
      required String accessToken,
      required String secret,
    })
        credentialGetter,
  ) async {
    throw UnimplementedError();
  }
}
