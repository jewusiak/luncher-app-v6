import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/api_requests/api_manager.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  final _mainPageArrangementManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> mainPageArrangement({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _mainPageArrangementManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMainPageArrangementCache() => _mainPageArrangementManager.clear();
  void clearMainPageArrangementCacheKey(String? uniqueKey) =>
      _mainPageArrangementManager.clearRequest(uniqueKey);

  final _placeTypeCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> placeTypeCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _placeTypeCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPlaceTypeCacheCache() => _placeTypeCacheManager.clear();
  void clearPlaceTypeCacheCacheKey(String? uniqueKey) =>
      _placeTypeCacheManager.clearRequest(uniqueKey);
}
