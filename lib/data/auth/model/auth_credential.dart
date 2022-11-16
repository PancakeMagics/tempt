part of auth;

typedef PhoneVerification = Future<String> Function();
typedef EmailVerification = Future<void> Function(Stream<bool> verifiedChanges);

/// auth credential
class AuthCredential {
  final AuthSetup setup;
  final AuthProvider? authProvider;
  final AuthLoginMethod loginMethod;
  final String? email;
  final String? emailLink;
  final String? password;
  final EmailVerification? emailVerification;
  final String? phoneNumber;
  final PhoneVerification? phoneVerification;

  /// the fields for web login
  final List<String>? scopes;
  final Map<dynamic, dynamic>? parameters;

  const AuthCredential._({
    required this.setup,
    required this.authProvider,
    required this.loginMethod,
    this.email,
    this.password,
    this.emailLink,
    this.emailVerification,
    this.phoneNumber,
    this.phoneVerification,
    this.scopes,
    this.parameters,
  });

  factory AuthCredential.empty({
    AuthSetup credentialSetup = const AuthSetup(),
  }) =>
      AuthCredential._(
        setup: credentialSetup,
        authProvider: null,
        loginMethod: AuthLoginMethod.anonymously,
      );

  factory AuthCredential.from({
    AuthSetup credentialSetup = const AuthSetup(),
    required AuthProvider authProvider,
    required AuthLoginMethod logInMethod,
    List<String>? scopes,
    Map<dynamic, dynamic>? parameters,
  }) {
    assert(
      logInMethod != AuthLoginMethod.anonymously,
      "use 'AuthCredential.empty()' method instead",
    );
    assert(
      (authProvider != AuthProvider.email) &&
          (authProvider != AuthProvider.phone),
      "use 'AuthCredential.ofEmail()' or 'ofPhone()' method instead",
    );

    return AuthCredential._(
      setup: credentialSetup,
      authProvider: authProvider,
      loginMethod: logInMethod,
      scopes: scopes,
      parameters: parameters,
    );
  }

  /// [emailVerification] return a future in the circumstance that email have been verified
  factory AuthCredential.ofEmail({
    AuthSetup credentialSetup = const AuthSetup(),
    required String email,
    required String passwordOrEmailLink,
    bool isPassword = true,
    required EmailVerification? verification,
  }) =>
      AuthCredential._(
        setup: credentialSetup,
        authProvider: AuthProvider.email,
        loginMethod: AuthLoginMethod.credential,
        email: email,
        password: isPassword ? passwordOrEmailLink : null,
        emailLink: isPassword ? null : passwordOrEmailLink,
        emailVerification: verification,
      );

  /// [phoneVerification] return a future verificationCode, trigger phone-sign-in-flow
  factory AuthCredential.ofPhone({
    AuthSetup credentialSetup = const AuthSetup(),
    required String phoneNumber,
    required PhoneVerification verification,
  }) =>
      AuthCredential._(
        setup: credentialSetup,
        authProvider: AuthProvider.phone,
        loginMethod: AuthLoginMethod.credential,
        phoneNumber: phoneNumber,
        phoneVerification: verification,
      );

  String? get formattedPhoneNumber => phoneNumber?.toFormattedPhoneNumber;
}

/// auth setup, see [AuthCredential]
class AuthSetup {
  final AuthService authService;
  final AuthLoginCategory loginCategory;
  final AuthLoginExceptionHandler exceptionHandler;
  final bool saveSignedServiceCredential;

  const AuthSetup({
    this.authService = AuthService.fireAuth,
    this.loginCategory = AuthLoginCategory.login,
    this.exceptionHandler = const AuthLoginExceptionHandler(),
    this.saveSignedServiceCredential = false,
  });
}

/// login category, see [AuthSetup]
enum AuthLoginCategory {
  login,
  reAuth,
  linkIn,
}

/// login exception handler, see [AuthSetup]
class AuthLoginExceptionHandler {
  ///
  /// - [fire.FirebaseException.code] - 'user-not-found' --- return true makes [fire.FirebaseAuth.createUserWithEmailAndPassword]
  final Future<bool> Function(String email)? askToCreateUser;

  /// - [fire.FirebaseException.code] - 'email-already-in-use'
  /// - [fire.FirebaseException.code] - 'invalid-email'
  /// - [fire.FirebaseException.code] - 'user-disabled'
  /// - [fire.FirebaseException.code] - 'wrong-password'
  ///
  /// - [fire.FirebaseException.code] - 'invalid-continue-uri'
  /// - [fire.FirebaseException.code] - 'unauthorized-continue-uri'
  ///
  /// - [fire.FirebaseException.code] - 'invalid-phone-number'
  /// - [fire.FirebaseException.code] - 'invalid-credential'
  /// - [fire.FirebaseException.code] - 'credential-already-in-use'
  /// - [fire.FirebaseException.code] - 'provider-already-linked'
  ///
  /// - [fire.FirebaseException.code] - 'popup-closed-by-user'
  /// - [fire.FirebaseException.code] - 'too-many-requests'
  ///
  /// - [fire.FirebaseException.code] - 'missing-android-pkg-name' (email) (An Android package name must be provided if the Android app is required to be installed.)
  /// - [fire.FirebaseException.code] - 'missing-ios-bundle-id' (email) (An iOS Bundle ID must be provided if an App Store ID is provided.)
  ///
  /// - [otherService.OtherException.code] - ...
  ///

  const AuthLoginExceptionHandler({
    this.askToCreateUser,
  });
}

/// login methods, see [AuthCredential]
enum AuthLoginMethod {
  anonymously,
  credential,
  provider, /// only provide natively
  providerPopup, /// only provide for web
  providerRedirect, /// only provide for web
}/// .record at 2022/11/14