part of auth;

enum AuthUserState {
  none,
  login,
  profileUpdate, // email, password, phoneNumber...
  authStateChanged, // tokenChanged, providerUnlink
}

class AuthUser {
  /// reference [fire.AuthCredential]
  final AuthCredential signedCredential;
  final Object? signedServiceCredential;
  final String? signInMethod;
  final int? token;
  final String? accessToken;

  /// reference [fire.AdditionalUserInfo]
  final bool? isNewUser;
  final Json? profile;
  final String? username;

  /// reference [fire.User.toString]
  final String? displayName;
  final String? email;
  final bool? emailVerified;
  final DateTime? creationTime;
  final DateTime? latSignInTime;
  final String? phoneNumber;
  final String? photoURL;
  final Iterable<AuthProviderData>? providerData;
  final String? refreshToken;
  final String? tenantId;
  final String? uid;

  AuthUser._({
    required this.signedCredential,
    required this.signedServiceCredential,
    required this.signInMethod,
    required this.token,
    required this.accessToken,

    //
    required this.isNewUser,
    required this.profile,
    required this.username,

    //
    required this.displayName,
    required this.email,
    required this.emailVerified,
    required this.creationTime,
    required this.latSignInTime,
    required this.phoneNumber,
    required this.photoURL,
    required this.providerData,
    required this.refreshToken,
    required this.tenantId,
    required this.uid,
  });

  Future<AuthUser> update({
    required Future<AuthCredential> Function(
      AuthSetup credentialSetup,
    )
        getReAuthCredential,
    AuthService service = AuthService.fireAuth,
    String? email,
    String? password,
    String? phoneNumber,
    PhoneVerification? phoneVerification,
    String? photoURL,
    String? displayName,
  }) async {
    if (phoneNumber != null) {
      assert(phoneVerification != null);
    }

    await service.updateAuthUser(
      getReAuthCredential: getReAuthCredential,
      email: email,
      phoneNumber: phoneNumber,
      phoneVerification: phoneVerification,
      photoURL: photoURL,
      password: password,
      displayName: displayName,
    );

    return _copyWith(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoURL: photoURL ?? this.photoURL,
      displayName: displayName ?? this.displayName,
    );
  }

  AuthUser _copyWith({
    String? signInMethod,
    int? token,
    String? accessToken,

    //
    bool? isNewUser,
    Json? profile,
    String? username,

    //
    String? displayName,
    String? email,
    bool? emailVerified,
    DateTime? creationTime,
    DateTime? latSignInTime,
    String? phoneNumber,
    String? photoURL,
    Iterable<AuthProviderData>? providerData,
    String? refreshToken,
    String? tenantId,
    String? uid,
  }) =>
      AuthUser._(
        signedCredential: signedCredential,
        signedServiceCredential: signedServiceCredential,
        signInMethod: signInMethod ?? this.signInMethod,
        token: token ?? this.token,
        accessToken: accessToken ?? this.accessToken,
        isNewUser: isNewUser ?? this.isNewUser,
        profile: profile ?? this.profile,
        username: username ?? this.username,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        emailVerified: emailVerified ?? this.emailVerified,
        creationTime: creationTime ?? this.creationTime,
        latSignInTime: latSignInTime ?? this.latSignInTime,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoURL: photoURL ?? this.photoURL,
        providerData: providerData ?? this.providerData,
        refreshToken: refreshToken ?? this.refreshToken,
        tenantId: tenantId ?? this.tenantId,
        uid: uid ?? this.uid,
      );

  @override
  String toString() => '''AuthUser(
    signedCredential: $signedCredential,
    signedServiceCredential: $signedServiceCredential,
    signInMethod: $signInMethod,
    token: $token,
    accessToken: $accessToken,
    isNewUser: $isNewUser,
    profile: $profile,
    username: $username,
    displayName: $displayName,
    email: $email,
    emailVerified: $emailVerified,
    creationTime: $creationTime,
    latSignInTime: $latSignInTime,
    phoneNumber: $phoneNumber,
    photoURL: $photoURL,
    providerData: $providerData,
    refreshToken: $refreshToken,
    tenantId: $tenantId,
    uid: $uid,
    ''';
}
