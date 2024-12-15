// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationDtoStruct extends BaseStruct {
  LocationDtoStruct({
    double? latitude,
    double? longitude,
  })  : _latitude = latitude,
        _longitude = longitude;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;

  void incrementLatitude(double amount) => latitude = latitude + amount;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;

  void incrementLongitude(double amount) => longitude = longitude + amount;

  bool hasLongitude() => _longitude != null;

  static LocationDtoStruct fromMap(Map<String, dynamic> data) =>
      LocationDtoStruct(
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
      );

  static LocationDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static LocationDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationDtoStruct(
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'LocationDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationDtoStruct &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([latitude, longitude]);
}

LocationDtoStruct createLocationDtoStruct({
  double? latitude,
  double? longitude,
}) =>
    LocationDtoStruct(
      latitude: latitude,
      longitude: longitude,
    );
