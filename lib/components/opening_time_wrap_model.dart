import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'opening_time_wrap_widget.dart' show OpeningTimeWrapWidget;
import 'package:flutter/material.dart';

class OpeningTimeWrapModel extends FlutterFlowModel<OpeningTimeWrapWidget> {
  ///  Local state fields for this component.

  OpeningInfoStruct? openingInfo;
  void updateOpeningInfoStruct(Function(OpeningInfoStruct) updateFn) {
    updateFn(openingInfo ??= OpeningInfoStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
