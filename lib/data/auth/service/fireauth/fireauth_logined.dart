part of auth;

mixin _ImplFireAuthLoginUser on _ImplFireAuth {
  Future<void> updateAuthUser({
    required Future<AuthCredential> Function(
      AuthSetup credentialSetup,
    )
        getReAuthCredential,
    required String? email,
    required String? password,
    required String? photoURL,
    required String? displayName,
    required String? phoneNumber,
    required PhoneVerification? phoneVerification,
  }) async {
    final currentUser = fire.FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      throw const AuthServiceUserNotExistException();
    } else {
      try {
        Future<void> update({
          required fire.User user,
          required String? email,
          required String? password,
          required String? photoURL,
          required String? displayName,
          required String? phoneNumber,
          required PhoneVerification? phoneVerification,
        }) async {
          email == null ? null : await user.verifyBeforeUpdateEmail(email);
          photoURL == null ? null : await user.updatePhotoURL(photoURL);
          password == null ? null : await user.updatePassword(password);
          displayName == null
              ? null
              : await user.updateDisplayName(displayName);

          if (phoneNumber != null && phoneVerification != null) {
            await user.updatePhoneNumber(
              await AuthCredential.ofPhone(
                phoneNumber: phoneNumber,
                verification: phoneVerification,
              )._toFireAuthCredential as fire.PhoneAuthCredential,
            );
          }
        }

        await update(
          user: currentUser,
          email: email,
          password: password,
          photoURL: photoURL,
          displayName: displayName,
          phoneNumber: phoneNumber,
          phoneVerification: phoneVerification,
        );
      } on fire.FirebaseAuthException catch (e) {
        if (e.message == 'requires-recent-login') {
          await (await getReAuthCredential(const AuthSetup(
            loginCategory: AuthLoginCategory.reAuth,
          )))
              ._submit;
          await updateAuthUser(
            getReAuthCredential: getReAuthCredential,
            email: email,
            password: password,
            photoURL: photoURL,
            displayName: displayName,
            phoneNumber: phoneNumber,
            phoneVerification: phoneVerification,
          );
        } else {
          rethrow;
        }
      }
    }
  }
}

extension _FireAuthConstants on String {
  static final Map<String, AuthProvider> _mapSignInMethodAndProvider = {
    fire.AppleAuthProvider.APPLE_SIGN_IN_METHOD: AuthProvider.apple,
    fire.FacebookAuthProvider.FACEBOOK_SIGN_IN_METHOD: AuthProvider.facebook,
    fire.GithubAuthProvider.GITHUB_SIGN_IN_METHOD: AuthProvider.github,
    fire.GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD: AuthProvider.google,
    fire.MicrosoftAuthProvider.MICROSOFT_SIGN_IN_METHOD: AuthProvider.microsoft,
    fire.TwitterAuthProvider.TWITTER_SIGN_IN_METHOD: AuthProvider.twitter,
    fire.YahooAuthProvider.YAHOO_SIGN_IN_METHOD: AuthProvider.yahoo,

    //
    fire.EmailAuthProvider.EMAIL_PASSWORD_SIGN_IN_METHOD: AuthProvider.email,
    fire.EmailAuthProvider.EMAIL_LINK_SIGN_IN_METHOD: AuthProvider.email,
    fire.PhoneAuthProvider.PHONE_SIGN_IN_METHOD: AuthProvider.phone,
  };

  static final Map<String, AuthProvider> _mapProviderIdAndProvider = {
    fire.AppleAuthProvider.PROVIDER_ID: AuthProvider.apple,
    fire.FacebookAuthProvider.PROVIDER_ID: AuthProvider.facebook,
    fire.GithubAuthProvider.PROVIDER_ID: AuthProvider.github,
    fire.GoogleAuthProvider.PROVIDER_ID: AuthProvider.google,
    fire.MicrosoftAuthProvider.PROVIDER_ID: AuthProvider.microsoft,
    fire.TwitterAuthProvider.PROVIDER_ID: AuthProvider.twitter,
    fire.YahooAuthProvider.PROVIDER_ID: AuthProvider.yahoo,

    //
    fire.EmailAuthProvider.PROVIDER_ID: AuthProvider.email,
    fire.PhoneAuthProvider.PROVIDER_ID: AuthProvider.phone,
  };

  AuthProvider get _parseAuthProviderId =>
      _mapProviderIdAndProvider[this] ?? (throw ParseStringError(this));

  AuthProvider get _parseSignInMethod =>
      _mapSignInMethodAndProvider[this] ?? (throw ParseStringError(this));
}
