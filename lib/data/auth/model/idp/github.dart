part of auth;

// TODO: implement
class _IdpGithub {
  const _IdpGithub._();

  factory _IdpGithub() => const _IdpGithub._();


  /// TODO:
  /// 1. understand more github work flow
  /// 2. visualize some github tool or kit, design them as element of ui
  /// 3. integrate element in documention.
  Future<C> getCredential<C>(
      C Function(String accessToken) credentialGetter,
      ) async {

    // final github = GitHub(auth: Authentication.withToken('token'));
    throw UnimplementedError();
  }
}
