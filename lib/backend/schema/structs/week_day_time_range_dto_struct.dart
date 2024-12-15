// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeekDayTimeRangeDtoStruct extends BaseStruct {
  WeekDayTimeRangeDtoStruct({
    WeekDayTimeDtoStruct? startTime,
    WeekDayTimeDtoStruct? endTime,
  })  : _startTime = startTime,
        _endTime = endTime;

  // "startTime" field.
  WeekDayTimeDtoStruct? _startTime;
  WeekDayTimeDtoStruct get startTime => _startTime ?? WeekDayTimeDtoStruct();
  set startTime(WeekDayTimeDtoStruct? val) => _startTime = val;

  void updateStartTime(Function(WeekDayTimeDtoStruct) updateFn) {
    updateFn(_startTime ??= WeekDayTimeDtoStruct());
  }

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  WeekDayTimeDtoStruct? _endTime;
  WeekDayTimeDtoStruct get endTime => _endTime ?? WeekDayTimeDtoStruct();
  set endTime(WeekDayTimeDtoStruct? val) => _endTime = val;

  void updateEndTime(Function(WeekDayTimeDtoStruct) updateFn) {
    updateFn(_endTime ??= WeekDayTimeDtoStruct());
  }

  bool hasEndTime() => _endTime != null;

  static WeekDayTimeRangeDtoStruct fromMap(Map<String, dynamic> data) =>
      WeekDayTimeRangeDtoStruct(
        startTime: data['startTime'] is WeekDayTimeDtoStruct
            ? data['startTime']
            : WeekDayTimeDtoStruct.maybeFromMap(data['startTime']),
        endTime: data['endTime'] is WeekDayTimeDtoStruct
            ? data['endTime']
            : WeekDayTimeDtoStruct.maybeFromMap(data['endTime']),
      );

  static WeekDayTimeRangeDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? WeekDayTimeRangeDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'startTime': _startTime?.toMap(),
        'endTime': _endTime?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startTime': serializeParam(
          _startTime,
          ParamType.DataStruct,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WeekDayTimeRangeDtoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WeekDayTimeRangeDtoStruct(
        startTime: deserializeStructParam(
          data['startTime'],
          ParamType.DataStruct,
          false,
          structBuilder: WeekDayTimeDtoStruct.fromSerializableMap,
        ),
        endTime: deserializeStructParam(
          data['endTime'],
          ParamType.DataStruct,
          false,
          structBuilder: WeekDayTimeDtoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WeekDayTimeRangeDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeekDayTimeRangeDtoStruct &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode => const ListEquality().hash([startTime, endTime]);
}

WeekDayTimeRangeDtoStruct createWeekDayTimeRangeDtoStruct({
  WeekDayTimeDtoStruct? startTime,
  WeekDayTimeDtoStruct? endTime,
}) =>
    WeekDayTimeRangeDtoStruct(
      startTime: startTime ?? WeekDayTimeDtoStruct(),
      endTime: endTime ?? WeekDayTimeDtoStruct(),
    );
