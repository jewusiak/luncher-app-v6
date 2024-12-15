// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartOptionDtoStruct extends BaseStruct {
  PartOptionDtoStruct({
    String? id,
    String? name,
    String? description,
    MonetaryAmountStruct? supplement,
  })  : _id = id,
        _name = name,
        _description = description,
        _supplement = supplement;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "supplement" field.
  MonetaryAmountStruct? _supplement;
  MonetaryAmountStruct get supplement => _supplement ?? MonetaryAmountStruct();
  set supplement(MonetaryAmountStruct? val) => _supplement = val;

  void updateSupplement(Function(MonetaryAmountStruct) updateFn) {
    updateFn(_supplement ??= MonetaryAmountStruct());
  }

  bool hasSupplement() => _supplement != null;

  static PartOptionDtoStruct fromMap(Map<String, dynamic> data) =>
      PartOptionDtoStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        supplement: data['supplement'] is MonetaryAmountStruct
            ? data['supplement']
            : MonetaryAmountStruct.maybeFromMap(data['supplement']),
      );

  static PartOptionDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? PartOptionDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'supplement': _supplement?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'supplement': serializeParam(
          _supplement,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PartOptionDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PartOptionDtoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        supplement: deserializeStructParam(
          data['supplement'],
          ParamType.DataStruct,
          false,
          structBuilder: MonetaryAmountStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PartOptionDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PartOptionDtoStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        supplement == other.supplement;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, description, supplement]);
}

PartOptionDtoStruct createPartOptionDtoStruct({
  String? id,
  String? name,
  String? description,
  MonetaryAmountStruct? supplement,
}) =>
    PartOptionDtoStruct(
      id: id,
      name: name,
      description: description,
      supplement: supplement ?? MonetaryAmountStruct(),
    );
