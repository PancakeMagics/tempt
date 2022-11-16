part of auth;

/// TODO: enable all
/// credential
/// [apple] - ok with [SignInWithApple], but the implementation is much more complex than others.
/// [facebook] - ok with [FacebookAuth], but in my iphone 12, there are some development target conflicts. i tried to handle but failed, so i wouldn't implement for a while
/// [github] - !!! [Github] is an extremely huge package that i should be familiar github flow at first.
/// [google] - ok with [GoogleSignIn]
/// [microsoft]
/// [twitter] - TODO: waiting for Elon Musk comes up with some different authentication practice
/// [yahoo]
/// [otherProvider] - TODO: generate, provide, get customToken
///
/// provider
/// [apple] - ok
/// [facebook] - ? i don't know what actually is 'Lost connection to device', but fine. i don't wanna implement at all !!
/// [github] - ok
/// [google] - ok
/// [microsoft]
/// [twitter]
/// [yahoo]
/// [otherProvider]
///
/// web provider popup:
/// [apple] Error: [firebase_auth/operation-not-allowed] The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
/// [facebook] (Sorry, something went wrong.)
/// [github] - ok
/// [google] - ok
/// [microsoft] Error: [firebase_auth/operation-not-allowed] The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
/// [twitter] Error: [firebase_auth/invalid-credential] The supplied auth credential is malformed or has expired.
/// [yahoo] (Looks like something went wrong.)
/// [otherProvider]
///
/// web provider redirect.
/// [apple] TODO: generate Service ID to enable domain
/// [facebook] (無法載入網址)
/// [github] - ok
/// [google] - ok
/// [microsoft] (no login ui occur)
/// [twitter] (no login ui occur)
/// [yahoo] (Looks like something went wrong.)
/// [otherProvider]
///
///

/// auth provider
enum AuthProvider {
  email,
  phone,

  //
  apple,
  facebook,
  github,
  google,
  microsoft,
  twitter,
  yahoo,
  otherProvider,
}

/// auth provider data
class AuthProviderData {
  final AuthProvider provider;
  final String? displayName;
  final String? email;
  final String? phoneNumber;
  final String? photoUrl;
  final String? uid;

  const AuthProviderData._({
    required this.provider,
    this.displayName,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.uid,
  });

  factory AuthProviderData.fromFireAuth(fire.UserInfo info) =>
      AuthProviderData._(
        provider: info.providerId._parseAuthProviderId,
        displayName: info.displayName,
        email: info.email,
        phoneNumber: info.phoneNumber,
        photoUrl: info.photoURL,
        uid: info.uid,
      );

  @override
  String toString() => 'AuthProviderData('
      'provider: $provider, '
      'displayName: $displayName, '
      'email: $email, '
      'phoneNumber: $phoneNumber, '
      'photoUrl: $photoUrl, '
      'uid: $uid)';
}
