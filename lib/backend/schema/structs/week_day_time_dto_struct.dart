// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeekDayTimeDtoStruct extends BaseStruct {
  WeekDayTimeDtoStruct({
    String? time,
    String? day,
  })  : _time = time,
        _day = day;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  set day(String? val) => _day = val;

  bool hasDay() => _day != null;

  static WeekDayTimeDtoStruct fromMap(Map<String, dynamic> data) =>
      WeekDayTimeDtoStruct(
        time: data['time'] as String?,
        day: data['day'] as String?,
      );

  static WeekDayTimeDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? WeekDayTimeDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'day': _day,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'day': serializeParam(
          _day,
          ParamType.String,
        ),
      }.withoutNulls;

  static WeekDayTimeDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeekDayTimeDtoStruct(
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WeekDayTimeDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeekDayTimeDtoStruct &&
        time == other.time &&
        day == other.day;
  }

  @override
  int get hashCode => const ListEquality().hash([time, day]);
}

WeekDayTimeDtoStruct createWeekDayTimeDtoStruct({
  String? time,
  String? day,
}) =>
    WeekDayTimeDtoStruct(
      time: time,
      day: day,
    );
