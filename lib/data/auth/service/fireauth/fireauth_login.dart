part of auth;

mixin _ImplFireAuthLogin on _ImplFireAuth {
  Future<AuthUser> login({required AuthCredential credential}) =>
      credential._submit;

  Future<void> logout() => fire.FirebaseAuth.instance.signOut();

  // TODO: email action
  Future<void> sendEmailVerification() {
    final user = fire.FirebaseAuth.instance.currentUser!;
    return user.email == null
        ? (throw const AuthServiceUserNotExistException())
        : user.sendEmailVerification(
            _FireAuthActionCodeSetting.getDefault(user.email!),
          );
  }

  Future<Map<String, AuthProvider>> fetchLoginMethods(String email) async =>
      (await fire.FirebaseAuth.instance.fetchSignInMethodsForEmail(email))
          .map((method) => MapEntry(method, method._parseSignInMethod))
          .toMap;

  // TODO: email action
  Future<void> resetPassword(String email) =>
      fire.FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: _FireAuthActionCodeSetting.getDefault(email),
      );
// await i.sendSignInLinkToEmail(email: email!, actionCodeSettings: actionCodeSettings)
// await i.confirmPasswordReset(code: code, newPassword: newPassword)
}
