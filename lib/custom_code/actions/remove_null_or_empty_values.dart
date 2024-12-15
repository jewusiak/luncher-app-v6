// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/api_requests/api_interceptor.dart';

class RemoveNullOrEmptyValues extends FFApiInterceptor {
  List<dynamic> _supportedNullValues = [
    FFAppConstants.nullvalue,
    FFAppConstants.nullvalueINT,
    FFAppConstants.nullvalueDOUBLE
  ];

  bool removeNulls(Map<String, dynamic> map) {
    map.removeWhere((k, v) {
      if (v is Map<String, dynamic>) {
        return removeNulls(v);
      } else if (v is List) {
        return removeNullsList(v);
      } else {
        return _supportedNullValues.any((e) => e == v);
      }
    });
    return map.isEmpty;
  }

  bool removeNullsList(List<dynamic> list) {
    list.removeWhere((v) {
      if (v is Map<String, dynamic>) {
        return removeNulls(v);
      } else if (v is List) {
        return removeNullsList(v);
      } else {
        return _supportedNullValues.any((e) => e == v);
      }
    });
    // will not remove empty lists
    return false; //list.isEmpty;
  }

  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Perform any necessary calls or modifications to the [options] before
    // the API call is made.
    //Map<String, dynamic> params = options.params;

    print("Options in");
    print(options);

    if (options.body == null || options.body == "") {
      print("Returning old options - before try (empty body)");
      return options;
    }
    try {
      Map<String, dynamic> bodyObject = jsonDecode(options.body ?? '');

      print("Remove nulls called");
      print(options.body ?? '--null--');

      removeNulls(bodyObject);
      String bodyString = jsonEncode(bodyObject);

      print(bodyString);

      final ApiCallOptions newOptions = ApiCallOptions(
        callName: options.callName,
        callType: options.callType,
        bodyType: options.bodyType,
        apiUrl: options.apiUrl,
        params: options.params,
        headers: options.headers,
        returnBody: options.returnBody,
        body: bodyString,
      );
      print("Returning new options");
      print(newOptions);
      return newOptions;
    } catch (e) {
      print("When called remove-nulls:");
      print(e);
    }
    print("Returning old options - after try");
    return options;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    // Perform any necessary calls or modifications to the [response] prior
    // to returning it.
    return response;
  }
}
