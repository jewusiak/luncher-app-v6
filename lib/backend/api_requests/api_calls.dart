import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Luncher Core API (GET___content-management_arrangements_primary) Group Code

class LuncherCoreAPIGETContentManagementArrangementsPrimaryGroup {
  static String getBaseUrl({
    String? apibaseurl,
  }) {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    return '${apibaseurl}';
  }

  static Map<String, String> headers = {};
  static GetPrimaryArrangementContentsCall getPrimaryArrangementContentsCall =
      GetPrimaryArrangementContentsCall();
}

class GetPrimaryArrangementContentsCall {
  Future<ApiCallResponse> call({
    String? apibaseurl,
  }) async {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    final baseUrl =
        LuncherCoreAPIGETContentManagementArrangementsPrimaryGroup.getBaseUrl(
      apibaseurl: apibaseurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getPrimaryArrangementContents',
      apiUrl: '${baseUrl}/content-management/arrangements/primary',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___content-management_arrangements_primary) Group Code

/// Start Luncher Core API (GET___place_uuid) Group Code

class LuncherCoreAPIGETPlaceUuidGroup {
  static String getBaseUrl({
    String? apibaseurl,
  }) {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    return '${apibaseurl}';
  }

  static Map<String, String> headers = {};
  static GetByIdCall getByIdCall = GetByIdCall();
}

class GetByIdCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? authorization = '',
    String? apibaseurl,
  }) async {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    final baseUrl = LuncherCoreAPIGETPlaceUuidGroup.getBaseUrl(
      apibaseurl: apibaseurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getById',
      apiUrl: '${baseUrl}/place/${uuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authorization}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___place_uuid) Group Code

/// Start Luncher Core API (POST___place_search) Group Code

class LuncherCoreAPIPOSTPlaceSearchGroup {
  static String getBaseUrl({
    String? apibaseurl,
  }) {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    return '${apibaseurl}';
  }

  static Map<String, String> headers = {};
  static SearchQueryCall searchQueryCall = SearchQueryCall();
}

class SearchQueryCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? textQuery,
    String? placeTypeIdentifier,
    String? openAtTime,
    String? openAtDay,
    double? locationLatitude,
    double? locationLongitude,
    double? locationRadius,
    String? hasLunchServedAt,
    int? page = 0,
    int? size = 10,
    String? apibaseurl,
  }) async {
    textQuery ??= FFAppConstants.nullvalue;
    placeTypeIdentifier ??= FFAppConstants.nullvalue;
    openAtTime ??= FFAppConstants.nullvalue;
    openAtDay ??= FFAppConstants.nullvalue;
    locationLatitude ??= FFAppConstants.nullvalueDOUBLE;
    locationLongitude ??= FFAppConstants.nullvalueDOUBLE;
    locationRadius ??= FFAppConstants.nullvalueDOUBLE;
    hasLunchServedAt ??= FFAppConstants.nullvalue;
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    final baseUrl = LuncherCoreAPIPOSTPlaceSearchGroup.getBaseUrl(
      apibaseurl: apibaseurl,
    );

    final ffApiRequestBody = '''
{
  "textQuery": "${escapeStringForJson(textQuery)}",
  "placeTypeIdentifier": "${escapeStringForJson(placeTypeIdentifier)}",
  "openAt": {
    "time": "${escapeStringForJson(openAtTime)}",
    "day": "${escapeStringForJson(openAtDay)}"
  },
  "location": {
    "latitude": ${locationLatitude},
    "longitude": ${locationLongitude},
    "radius": ${locationRadius}
  },
  "hasLunchServedAt": "${escapeStringForJson(hasLunchServedAt)}",
  "page": ${page},
  "size": ${size}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'searchQuery',
        apiUrl: '${baseUrl}/place/search',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authorization}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: true,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RemoveNullOrEmptyValues(),
  ];
}

/// End Luncher Core API (POST___place_search) Group Code

/// Start Luncher Core API (GET___placetype) Group Code

class LuncherCoreAPIGETPlacetypeGroup {
  static String getBaseUrl({
    String? apibaseurl,
  }) {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    return '${apibaseurl}';
  }

  static Map<String, String> headers = {};
  static GetAllPlaceTypesCall getAllPlaceTypesCall = GetAllPlaceTypesCall();
}

class GetAllPlaceTypesCall {
  Future<ApiCallResponse> call({
    String? apibaseurl,
  }) async {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    final baseUrl = LuncherCoreAPIGETPlacetypeGroup.getBaseUrl(
      apibaseurl: apibaseurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllPlaceTypes',
      apiUrl: '${baseUrl}/placetype',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___placetype) Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
