part of '../model.dart';

/// error, exception
class _ModelFunctionNotProvideError extends Error {
  _ModelFunctionNotProvideError();
}

class ModelCanOnlyOnePreferStoreServiceException implements Exception {
  const ModelCanOnlyOnePreferStoreServiceException._();
  factory ModelCanOnlyOnePreferStoreServiceException() => const ModelCanOnlyOnePreferStoreServiceException._();
}
