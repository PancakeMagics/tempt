part of auth;

enum AuthService
    implements
        Service<AuthService>
// class AuthService implements Service<AuthService>
        ,
        _ImplFireAuthProvider {
  fireAuth;

  _ImplFireAuthProvider get _fireAuth => _ImplFireAuthProvider();

  @override
  Stream<AuthUserState> get authUserState {
    switch (this) {
      case AuthService.fireAuth:
        return _fireAuth.authUserState;
    }
  }

  @override
  Future<Map<String, AuthProvider>> fetchLoginMethods(String email) {
    switch (this) {
      case AuthService.fireAuth:
        return _fireAuth.fetchLoginMethods(email);
    }
  }

  @override
  Future<void> logout() {
    switch (this) {
      case AuthService.fireAuth:
        return _fireAuth.logout();
    }
  }

  @override
  Future<AuthUser> login({required AuthCredential credential}) {
    switch (this) {
      case AuthService.fireAuth:
        return _fireAuth.login(credential: credential);
    }
  }

  @override
  Future<void> resetPassword(String email) {
    switch (this) {
      case AuthService.fireAuth:
        return _fireAuth.resetPassword(email);
    }
  }

  @override
  Future<void> updateAuthUser({
    required Future<AuthCredential> Function(
      AuthSetup credentialSetup,
    )
        getReAuthCredential,
    required String? email,
    required String? password,
    required String? phoneNumber,
    required PhoneVerification? phoneVerification,
    required String? photoURL,
    required String? displayName,
  }) {
    switch (this) {
      case AuthService.fireAuth:
        return _fireAuth.updateAuthUser(
          getReAuthCredential: getReAuthCredential,
          email: email,
          phoneNumber: phoneNumber,
          phoneVerification: phoneVerification,
          photoURL: photoURL,
          password: password,
          displayName: displayName,
        );
    }
  }

  @override
  Future<void> sendEmailVerification() {
    switch (this) {
      case AuthService.fireAuth:
        return _fireAuth.sendEmailVerification();
    }
  }
}
