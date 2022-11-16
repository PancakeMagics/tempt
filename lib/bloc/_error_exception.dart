

/// errors
class UnReachedError extends Error {}
class ParseStringError extends Error {
  final String s;
  ParseStringError(this.s);
  @override
  String toString() {
    return '$s not a valid string';
  }
}


class AuthServiceLoginError extends Error {}
class AuthServiceLoginFailException implements Exception {
  const AuthServiceLoginFailException();
}


class StoreServiceProviderNotProvideError extends Error {}
class StoreServiceNoImplementationException extends Error {}


/// exceptions
class AuthServiceNoImplementationException implements Exception {
  const AuthServiceNoImplementationException();
}

class AuthServiceIdpNotSignedException implements Exception {
  const AuthServiceIdpNotSignedException();
}

class AuthServiceUserNotExistException implements Exception {
  const AuthServiceUserNotExistException();
}


class StoreModelNoIdException {
  const StoreModelNoIdException();
}

class StoreServiceDataNotFoundException implements Exception {
  const StoreServiceDataNotFoundException();
}