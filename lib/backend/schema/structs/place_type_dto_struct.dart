// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceTypeDtoStruct extends BaseStruct {
  PlaceTypeDtoStruct({
    String? identifier,
    String? iconName,
    String? name,
  })  : _identifier = identifier,
        _iconName = iconName,
        _name = name;

  // "identifier" field.
  String? _identifier;
  String get identifier => _identifier ?? '';
  set identifier(String? val) => _identifier = val;

  bool hasIdentifier() => _identifier != null;

  // "iconName" field.
  String? _iconName;
  String get iconName => _iconName ?? '';
  set iconName(String? val) => _iconName = val;

  bool hasIconName() => _iconName != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static PlaceTypeDtoStruct fromMap(Map<String, dynamic> data) =>
      PlaceTypeDtoStruct(
        identifier: data['identifier'] as String?,
        iconName: data['iconName'] as String?,
        name: data['name'] as String?,
      );

  static PlaceTypeDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceTypeDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'identifier': _identifier,
        'iconName': _iconName,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'identifier': serializeParam(
          _identifier,
          ParamType.String,
        ),
        'iconName': serializeParam(
          _iconName,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlaceTypeDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceTypeDtoStruct(
        identifier: deserializeParam(
          data['identifier'],
          ParamType.String,
          false,
        ),
        iconName: deserializeParam(
          data['iconName'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlaceTypeDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaceTypeDtoStruct &&
        identifier == other.identifier &&
        iconName == other.iconName &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([identifier, iconName, name]);
}

PlaceTypeDtoStruct createPlaceTypeDtoStruct({
  String? identifier,
  String? iconName,
  String? name,
}) =>
    PlaceTypeDtoStruct(
      identifier: identifier,
      iconName: iconName,
      name: name,
    );
