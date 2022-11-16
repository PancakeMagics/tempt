part of auth;

extension _FireAuthCredential on fire.AuthCredential {
  Future<fire.UserCredential> _toUserCredential({
    required AuthProvider authProvider,
    required AuthLoginCategory category,
    required EmailVerification? emailVerification,
    required String? formattedPhoneNumber,
    required PhoneVerification? phoneVerification,
  }) async {
    final i = fire.FirebaseAuth.instance;

    switch (authProvider) {

      /// email
      case AuthProvider.email:
        late final fire.UserCredential fuc;

        switch (category) {
          case AuthLoginCategory.login:
            fuc = await i.signInWithCredential(this);
            break;
          case AuthLoginCategory.reAuth:
            fuc = await i.currentUser!.reauthenticateWithCredential(this);
            break;
          case AuthLoginCategory.linkIn:
            fuc = await i.currentUser!.linkWithCredential(this);
            break;
        }

        // ensure email verified
        if (!fuc.user!.emailVerified) {
          // TODO:
          // await AuthService.fireAuth.sendEmailVerification();
          await emailVerification!(
            fire.FirebaseAuth.instance.userChanges()._toEmailVerifiedChanges,
          );
        }
        return fuc;

      /// phone
      case AuthProvider.phone:

        // verify on web with custom reCAPTCHA verifier
        if (kIsWeb) {
          late final fire.ConfirmationResult result;

          // TODO: implement reCAPTCHA widget, see https://www.google.com/recaptcha/about/
          const fire.RecaptchaVerifier? recaptchaVerifier = null;

          switch (category) {
            case AuthLoginCategory.login:
            case AuthLoginCategory.reAuth:
              result = await i.signInWithPhoneNumber(
                formattedPhoneNumber!,
                recaptchaVerifier,
              );
              break;
            case AuthLoginCategory.linkIn:
              result = await i.currentUser!.linkWithPhoneNumber(
                formattedPhoneNumber!,
                recaptchaVerifier,
              );
              break;
          }

          return result.confirm(await phoneVerification!());

          // verify natively
        } else {
          switch (category) {
            case AuthLoginCategory.login:
              return i.signInWithCredential(this);

            case AuthLoginCategory.reAuth:
              return i.currentUser!.reauthenticateWithCredential(this);

            case AuthLoginCategory.linkIn:
              return i.currentUser!.linkWithCredential(this);
          }
        }

      /// other authProviders
      default:
        switch (category) {
          case AuthLoginCategory.login:
            return i.signInWithCredential(this);

          case AuthLoginCategory.reAuth:
            return i.currentUser!.reauthenticateWithCredential(this);

          case AuthLoginCategory.linkIn:
            return i.currentUser!.linkWithCredential(this);
        }
    }
  }
}
