import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Luncher Core API (GET___content-management_arrangements_primary) Group Code

class LuncherCoreAPIGETContentManagementArrangementsPrimaryGroup {
  static String getBaseUrl({
    String? apibaseurl,
  }) {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    return apibaseurl;
  }

  static Map<String, String> headers = {};
  static GetPrimaryArrangementContentsCall getPrimaryArrangementContentsCall =
      GetPrimaryArrangementContentsCall();
}

class GetPrimaryArrangementContentsCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
    String? apibaseurl,
  }) async {
    apibaseurl ??= FFDevEnvironmentValues().apibaseurl;
    final baseUrl =
        LuncherCoreAPIGETContentManagementArrangementsPrimaryGroup.getBaseUrl(
      apibaseurl: apibaseurl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getPrimaryArrangementContents',
      apiUrl: '$baseUrl/content-management/arrangements/primary',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Luncher Core API (GET___content-management_arrangements_primary) Group Code

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
