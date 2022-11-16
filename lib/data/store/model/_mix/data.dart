part of '../model.dart';

/// for [_ImplFirestore], [_ImplHive] --------------------------------------------------------
abstract class DataModel<M extends DataModel<M>> extends _DataSetModel<M> {
  static const Map<StoreService, String> _emptyStoreId = {};
  static const Set<Service> _emptyRelatedService = {};
  final Map<StoreService, String> storeId;
  final Set<Service> relatedServices;
  const DataModel({
    this.storeId = DataModel._emptyStoreId,
    this.relatedServices = DataModel._emptyRelatedService,
  });


  @override
  Json get json;
  String get jsonString => jsonEncode(json);
  StoreService get _storeService {
    final services = relatedServices.whereType<StoreService>();
    if (services.length != 1) {
      throw ModelCanOnlyOnePreferStoreServiceException();
    } else {
      return services.first;
    }
  }
}