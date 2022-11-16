part of auth;

extension _FireAuthLoginExceptionHandler on fire.FirebaseAuthException {
  Future<fire.UserCredential> _solveAndGetFuc({
    required AuthCredential credential,
    required AuthLoginExceptionHandler handler,
  }) async {
    final i = fire.FirebaseAuth.instance;

    switch (code) {
      case 'user-not-found':
        final needCreate = await handler.askToCreateUser!(credential.email!);
        if (needCreate) {
          return i.createUserWithEmailAndPassword(
            email: credential.email!,
            password: credential.password!,
          );
        }
        throw const AuthServiceLoginFailException();

      default:
        throw this;
    }
  }
}
