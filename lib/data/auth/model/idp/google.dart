part of auth;

// TODO: implement more
class _IdpGoogle {
  const _IdpGoogle._();

  factory _IdpGoogle() => const _IdpGoogle._();

  Future<GoogleSignInAccount?> get _account {
    if (Platform.isIOS) {
      return GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
      ).signIn();
    } else {
      return GoogleSignIn().signIn();
    }
  }

  Future<GoogleSignInAccount?> get _googlePlayAccount => GoogleSignIn(
        signInOption: SignInOption.games,
      ).signIn();

  Future<C> getCredential<C>(
    C Function({String? accessToken, String? idToken}) credentialGetter, {
    bool signInGooglePlay = false,
  }) async {
    final user = await (signInGooglePlay ? _googlePlayAccount : _account);
    if (user == null) {
      throw const AuthServiceIdpNotSignedException();
    } else {
      final auth = await user.authentication;
      return credentialGetter(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );
    }
  }
}
