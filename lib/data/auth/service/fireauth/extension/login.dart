part of auth;

/// - try login anonymously
/// - try login with credential by [_FireAuthLoginCredential]
/// - try login with provider by [_FireAuthLoginProvider]
extension _FireAuthLogin on AuthCredential {
  ///
  /// the login flow except from 'login anonymously':
  /// 1. [AuthCredential]
  /// 2. [fire.AuthCredential] || [fire.OAuthProvider]
  /// 3. [fire.UserCredential]
  /// 4. [AuthUser]
  ///
  Future<AuthUser> get _submit async {
    late final fire.UserCredential fuc;
    fire.AuthCredential? fac;
    try {
      switch (loginMethod) {

        /// login anonymously
        case AuthLoginMethod.anonymously:
          fuc = await fire.FirebaseAuth.instance.signInAnonymously();
          break;

        /// login with credential
        case AuthLoginMethod.credential:
          fac = await _toFireAuthCredential;
          fuc = await fac._toUserCredential(
            authProvider: authProvider!,
            category: setup.loginCategory,
            emailVerification: emailVerification,
            formattedPhoneNumber: formattedPhoneNumber,
            phoneVerification: phoneVerification,
          );
          break;

        /// login with provider
        default:
          fuc = await authProvider!._toOAuthProvider._toUserCredential(
            category: setup.loginCategory,
            loginMethod: loginMethod,
            scopes: scopes,
            parameters: parameters,
          );
          break;
      }
    } on fire.FirebaseAuthException catch (exception) {
      fuc = await exception._solveAndGetFuc(
        credential: this,
        handler: setup.exceptionHandler,
      );
    }
    return fuc._toAuthUser(
      signedCredential: this,
      signedServiceCredential: setup.saveSignedServiceCredential ? fac : null,
    );
  }
}

/// parse [AuthCredential], used in [_FireAuthLogin]
extension _FireAuthLoginCredential on AuthCredential {
  Future<fire.AuthCredential> get _toFireAuthCredential async {
    switch (authProvider!) {

      /// email
      case AuthProvider.email:
        if (email != null) {
          if (password != null) {
            return fire.EmailAuthProvider.credential(
              email: email!,
              password: password!,
            );
          } else if (emailLink != null) {
            return fire.EmailAuthProvider.credentialWithLink(
              email: email!,
              emailLink: emailLink!,
            );
          }
        }
        throw AuthServiceLoginError();

      /// phone
      case AuthProvider.phone:
        late final fire.AuthCredential fac;
        late final String smsCode;
        String? verificationId;
        int? token;

        await fire.FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: formattedPhoneNumber,
          codeAutoRetrievalTimeout: (id) {},
          verificationCompleted: (credential) => fac = credential,
          verificationFailed: (e) => throw e,
          codeSent: (vId, resentToken) {
            verificationId = vId;
            token = resentToken;
          },
        );
        smsCode = await phoneVerification!();

        if (token != null) {
          fac = fire.PhoneAuthProvider.credentialFromToken(
            token!,
            smsCode: smsCode,
          );
        } else if (verificationId != null) {
          fac = fire.PhoneAuthProvider.credential(
            verificationId: verificationId!,
            smsCode: smsCode,
          );
        } else {
          throw AuthServiceLoginError();
        }

        return fac;

      /// apple
      case AuthProvider.apple:
        return _IdpApple().getCredential(
          fire.AppleAuthProvider.credential,
        );

      /// facebook
      case AuthProvider.facebook:
        return _IdpFacebook().getCredential(
          fire.FacebookAuthProvider.credential,
        );

      /// github
      case AuthProvider.github:
        return _IdpGithub().getCredential(
          fire.GithubAuthProvider.credential,
        );

      /// google
      case AuthProvider.google:
        return _IdpGoogle().getCredential(
          fire.GoogleAuthProvider.credential,
          signInGooglePlay: false,
        );

      /// microsoft
      case AuthProvider.microsoft:
        return _IdpMicrosoft().getCredential(
          fire.MicrosoftAuthProvider.credential,
        );

      /// twitter
      case AuthProvider.twitter:
        return _IdpTwitter().getCredential(
          fire.TwitterAuthProvider.credential,
        );

      /// yahoo
      case AuthProvider.yahoo:
        return _IdpYahoo().getCredential(
          fire.YahooAuthProvider.credential,
        );

      /// others
      // TODO: Create Custom Tokens ---see https://firebase.google.com/docs/auth/admin/create-custom-tokens
      case AuthProvider.otherProvider:
        throw UnimplementedError();
    }
  }
}

/// parse [AuthProvider], used in [_FireAuthLogin]
extension _FireAuthLoginProvider on AuthProvider {
  fire.OAuthProvider get _toOAuthProvider =>
      fire.OAuthProvider(_fireAuthProviderId);

  String get _fireAuthProviderId {
    switch (this) {

      /// apple
      case AuthProvider.apple:
        return fire.AppleAuthProvider.PROVIDER_ID;

      /// facebook
      case AuthProvider.facebook:
        return fire.FacebookAuthProvider.PROVIDER_ID;

      /// github
      case AuthProvider.github:
        return fire.GithubAuthProvider.PROVIDER_ID;

      /// google
      case AuthProvider.google:
        return fire.GoogleAuthProvider.PROVIDER_ID;

      /// microsoft
      case AuthProvider.microsoft:
        return fire.MicrosoftAuthProvider.PROVIDER_ID;

      /// twitter
      case AuthProvider.twitter:
        return fire.TwitterAuthProvider.PROVIDER_ID;

      /// yahoo
      case AuthProvider.yahoo:
        return fire.YahooAuthProvider.PROVIDER_ID;

      /// others
      case AuthProvider.otherProvider:
        throw UnimplementedError();

      /// email
      case AuthProvider.email:
        return fire.EmailAuthProvider.PROVIDER_ID;

      /// apple
      case AuthProvider.phone:
        return fire.PhoneAuthProvider.PROVIDER_ID;
    }
  }
}

/// parse firebase user credential, used in [_FireAuthTryLogin]
extension _FireAuthToAuthUser on fire.UserCredential {
  AuthUser _toAuthUser({
    required AuthCredential signedCredential,
    required fire.AuthCredential? signedServiceCredential,
  }) => AuthUser._(
    signedCredential: signedCredential,
    signedServiceCredential: signedServiceCredential,
    signInMethod: credential?.signInMethod,
    token: credential?.token,
    accessToken: credential?.accessToken,
    isNewUser: additionalUserInfo?.isNewUser,
    profile: additionalUserInfo?.profile,
    username: additionalUserInfo?.username,
    displayName: user?.displayName,
    email: user?.email,
    emailVerified: user?.emailVerified,
    creationTime: user?.metadata.creationTime,
    latSignInTime: user?.metadata.lastSignInTime,
    phoneNumber: user?.phoneNumber,
    photoURL: user?.photoURL,
    providerData: user?.providerData.map(AuthProviderData.fromFireAuth),
    refreshToken: user?.refreshToken,
    tenantId: user?.tenantId,
    uid: user?.uid,
  );
}
