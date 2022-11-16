part of auth;

mixin _ImplFireAuthStream on _ImplFireAuth {
  /// TODO: listened in bloc
  Stream<AuthUserState> get authUserState {
    late final StreamController<AuthUserState> controller;
    late final StreamSubscription<fire.User?> subscription;

    void listen() {
      subscription = fire.FirebaseAuth.instance.userChanges().listen(null)
        ..onData((user) {
          if (user == null) {
            controller.add(AuthUserState.none);
          } else {
            controller.add(AuthUserState.login);
            // controller.add(AuthUserState.profileUpdate);
            // controller.add(AuthUserState.authStateChanged);
            throw UnimplementedError();
          }
        })
        ..onError((error) => throw error);
    }

    controller = StreamController(
      onListen: listen,
      onPause: () => subscription.pause(),
      onResume: () => subscription.resume(),
      onCancel: () => subscription.cancel(),
    );
    return controller.stream;
  }
}

extension _FireAuthUserChangesUtil on Stream<fire.User?> {
  Stream<bool> get _toEmailVerifiedChanges =>
      map((user) => user?.emailVerified ?? false)
          .whereDiff
          .takeWhile((beenVerified) => beenVerified);
}
