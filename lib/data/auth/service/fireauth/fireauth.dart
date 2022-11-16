part of auth;

/// firebase auth provider
class _ImplFireAuthProvider extends _ImplFireAuth
    with _ImplFireAuthLogin, _ImplFireAuthStream, _ImplFireAuthLoginUser {
  const _ImplFireAuthProvider._();

  static const _ImplFireAuthProvider _instance = _ImplFireAuthProvider._();

  factory _ImplFireAuthProvider() => _instance;
}

/// ancestor of all the firebase auth implementation
abstract class _ImplFireAuth {
  const _ImplFireAuth();
}
