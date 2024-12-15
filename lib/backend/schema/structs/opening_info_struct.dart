// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OpeningInfoStruct extends BaseStruct {
  OpeningInfoStruct({
    OpeningState? openState,
    WeekDayTimeRangeDtoStruct? selectedOpeningWindow,
  })  : _openState = openState,
        _selectedOpeningWindow = selectedOpeningWindow;

  // "openState" field.
  OpeningState? _openState;
  OpeningState? get openState => _openState;
  set openState(OpeningState? val) => _openState = val;

  bool hasOpenState() => _openState != null;

  // "selectedOpeningWindow" field.
  WeekDayTimeRangeDtoStruct? _selectedOpeningWindow;
  WeekDayTimeRangeDtoStruct get selectedOpeningWindow =>
      _selectedOpeningWindow ?? WeekDayTimeRangeDtoStruct();
  set selectedOpeningWindow(WeekDayTimeRangeDtoStruct? val) =>
      _selectedOpeningWindow = val;

  void updateSelectedOpeningWindow(
      Function(WeekDayTimeRangeDtoStruct) updateFn) {
    updateFn(_selectedOpeningWindow ??= WeekDayTimeRangeDtoStruct());
  }

  bool hasSelectedOpeningWindow() => _selectedOpeningWindow != null;

  static OpeningInfoStruct fromMap(Map<String, dynamic> data) =>
      OpeningInfoStruct(
        openState: data['openState'] is OpeningState
            ? data['openState']
            : deserializeEnum<OpeningState>(data['openState']),
        selectedOpeningWindow:
            data['selectedOpeningWindow'] is WeekDayTimeRangeDtoStruct
                ? data['selectedOpeningWindow']
                : WeekDayTimeRangeDtoStruct.maybeFromMap(
                    data['selectedOpeningWindow']),
      );

  static OpeningInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? OpeningInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'openState': _openState?.serialize(),
        'selectedOpeningWindow': _selectedOpeningWindow?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'openState': serializeParam(
          _openState,
          ParamType.Enum,
        ),
        'selectedOpeningWindow': serializeParam(
          _selectedOpeningWindow,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static OpeningInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      OpeningInfoStruct(
        openState: deserializeParam<OpeningState>(
          data['openState'],
          ParamType.Enum,
          false,
        ),
        selectedOpeningWindow: deserializeStructParam(
          data['selectedOpeningWindow'],
          ParamType.DataStruct,
          false,
          structBuilder: WeekDayTimeRangeDtoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OpeningInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OpeningInfoStruct &&
        openState == other.openState &&
        selectedOpeningWindow == other.selectedOpeningWindow;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([openState, selectedOpeningWindow]);
}

OpeningInfoStruct createOpeningInfoStruct({
  OpeningState? openState,
  WeekDayTimeRangeDtoStruct? selectedOpeningWindow,
}) =>
    OpeningInfoStruct(
      openState: openState,
      selectedOpeningWindow:
          selectedOpeningWindow ?? WeekDayTimeRangeDtoStruct(),
    );
