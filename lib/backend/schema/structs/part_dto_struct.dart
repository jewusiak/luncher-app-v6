// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartDtoStruct extends BaseStruct {
  PartDtoStruct({
    String? id,
    String? name,
    bool? required,
    MonetaryAmountStruct? supplement,
    List<PartOptionDtoStruct>? options,
  })  : _id = id,
        _name = name,
        _required = required,
        _supplement = supplement,
        _options = options;

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

  // "required" field.
  bool? _required;
  bool get required => _required ?? false;
  set required(bool? val) => _required = val;

  bool hasRequired() => _required != null;

  // "supplement" field.
  MonetaryAmountStruct? _supplement;
  MonetaryAmountStruct get supplement => _supplement ?? MonetaryAmountStruct();
  set supplement(MonetaryAmountStruct? val) => _supplement = val;

  void updateSupplement(Function(MonetaryAmountStruct) updateFn) {
    updateFn(_supplement ??= MonetaryAmountStruct());
  }

  bool hasSupplement() => _supplement != null;

  // "options" field.
  List<PartOptionDtoStruct>? _options;
  List<PartOptionDtoStruct> get options => _options ?? const [];
  set options(List<PartOptionDtoStruct>? val) => _options = val;

  void updateOptions(Function(List<PartOptionDtoStruct>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  static PartDtoStruct fromMap(Map<String, dynamic> data) => PartDtoStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        required: data['required'] as bool?,
        supplement: data['supplement'] is MonetaryAmountStruct
            ? data['supplement']
            : MonetaryAmountStruct.maybeFromMap(data['supplement']),
        options: getStructList(
          data['options'],
          PartOptionDtoStruct.fromMap,
        ),
      );

  static PartDtoStruct? maybeFromMap(dynamic data) =>
      data is Map ? PartDtoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'required': _required,
        'supplement': _supplement?.toMap(),
        'options': _options?.map((e) => e.toMap()).toList(),
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
        'required': serializeParam(
          _required,
          ParamType.bool,
        ),
        'supplement': serializeParam(
          _supplement,
          ParamType.DataStruct,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PartDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PartDtoStruct(
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
        required: deserializeParam(
          data['required'],
          ParamType.bool,
          false,
        ),
        supplement: deserializeStructParam(
          data['supplement'],
          ParamType.DataStruct,
          false,
          structBuilder: MonetaryAmountStruct.fromSerializableMap,
        ),
        options: deserializeStructParam<PartOptionDtoStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: PartOptionDtoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PartDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PartDtoStruct &&
        id == other.id &&
        name == other.name &&
        required == other.required &&
        supplement == other.supplement &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, required, supplement, options]);
}

PartDtoStruct createPartDtoStruct({
  String? id,
  String? name,
  bool? required,
  MonetaryAmountStruct? supplement,
}) =>
    PartDtoStruct(
      id: id,
      name: name,
      required: required,
      supplement: supplement ?? MonetaryAmountStruct(),
    );
