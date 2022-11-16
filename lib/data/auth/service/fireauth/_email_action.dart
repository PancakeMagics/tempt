part of auth;

extension _FireAuthActionCodeSetting on AuthCredential {
  /// custom email tempt, see https://support.google.com/firebase/answer/7000714
  /// passing state in email actions, see https://firebase.google.com/docs/auth/flutter/passing-state-in-email-actions
  static fire.ActionCodeSettings getDefault(String email) {


    // // TODO; locale
    // fire.FirebaseAuth.instance.setLanguageCode('zh');
    //
    // // TODO: know what is a correct continue uri
    // return fire.ActionCodeSettings(
    //   handleCodeInApp: true,
    //   url: 'http://tempt-fa247.web.app/verify?email=$email',
    //   androidPackageName: androidPackageName,
    //   androidInstallApp: true,
    //   androidMinimumVersion: '12',
    //   iOSBundleId: iOSBundleId,
    // );

    throw UnimplementedError();
  }
}
