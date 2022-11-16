part of auth;

extension _ParseOAuthProvider on fire.OAuthProvider {
  Future<fire.UserCredential> _toUserCredential({
    required AuthLoginCategory category,
    required AuthLoginMethod loginMethod,
    required List<String>? scopes,
    required Map<dynamic, dynamic>? parameters,
  }) async {
    final i = fire.FirebaseAuth.instance;

    // TODO: understand scopes, parameters
    if (kIsWeb && loginMethod != AuthLoginMethod.credential) {
      setScopes(scopes ?? []);
      setCustomParameters(parameters ?? {});

      log('\n'
          '${scopes.toString()}\n'
          '${parameters.toString()}');
    }

    switch (category) {
      case AuthLoginCategory.login:
        switch (loginMethod) {
          case AuthLoginMethod.anonymously:
          case AuthLoginMethod.credential:
            throw UnReachedError();

          case AuthLoginMethod.provider:
            return i.signInWithProvider(this);

          case AuthLoginMethod.providerPopup:
            return i.signInWithPopup(this);

          case AuthLoginMethod.providerRedirect:
            return i
                .signInWithRedirect(this)
                .then((_) => i.getRedirectResult());
        }
      case AuthLoginCategory.reAuth:
        switch (loginMethod) {
          case AuthLoginMethod.anonymously:
          case AuthLoginMethod.credential:
            throw UnReachedError();

          case AuthLoginMethod.provider:
            return i.currentUser!.reauthenticateWithProvider(this);

          case AuthLoginMethod.providerPopup:
            return i.currentUser!.reauthenticateWithPopup(this);

          case AuthLoginMethod.providerRedirect:
            return i.currentUser!
                .reauthenticateWithRedirect(this)
                .then((_) => i.getRedirectResult());
        }
      case AuthLoginCategory.linkIn:
        switch (loginMethod) {
          case AuthLoginMethod.anonymously:
          case AuthLoginMethod.credential:
            throw UnReachedError();

          case AuthLoginMethod.provider:
            return i.currentUser!.linkWithProvider(this);

          case AuthLoginMethod.providerPopup:
            return i.currentUser!.linkWithPopup(this);

          case AuthLoginMethod.providerRedirect:
            return i.currentUser!
                .linkWithRedirect(this)
                .then((_) => i.getRedirectResult());
        }
    }
  }
}
