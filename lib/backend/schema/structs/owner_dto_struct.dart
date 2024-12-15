// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OwnerDtoStruct extends BaseStruct {
  OwnerDtoStruct({
    String? uuid,
    String? email,
  })  : _uuid = uuid,
        _email = email;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;

  bool hasUuid() => _uuid != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  static OwnerDtoStruct fromMap(Map<String, dynamic> data) => OwnerDtoStruct(
        uuid: data['uuid'] as String?,
        email: data['email'] as String?,
      );

  static OwnerDtoStruct? maybeFromMap(dynamic data) =>
      data is Map ? OwnerDtoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uuid': _uuid,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static OwnerDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      OwnerDtoStruct(
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OwnerDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OwnerDtoStruct &&
        uuid == other.uuid &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([uuid, email]);
}

OwnerDtoStruct createOwnerDtoStruct({
  String? uuid,
  String? email,
}) =>
    OwnerDtoStruct(
      uuid: uuid,
      email: email,
    );
