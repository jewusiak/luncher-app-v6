// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuOfferDtoStruct extends BaseStruct {
  MenuOfferDtoStruct({
    String? id,
    String? name,
    List<PartDtoStruct>? parts,
    List<DateTimeRangeDtoStruct>? oneTimeServingRanges,
    List<WeekDayTimeRangeDtoStruct>? recurringServingRanges,
    MonetaryAmountStruct? basePrice,
  })  : _id = id,
        _name = name,
        _parts = parts,
        _oneTimeServingRanges = oneTimeServingRanges,
        _recurringServingRanges = recurringServingRanges,
        _basePrice = basePrice;

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

  // "parts" field.
  List<PartDtoStruct>? _parts;
  List<PartDtoStruct> get parts => _parts ?? const [];
  set parts(List<PartDtoStruct>? val) => _parts = val;

  void updateParts(Function(List<PartDtoStruct>) updateFn) {
    updateFn(_parts ??= []);
  }

  bool hasParts() => _parts != null;

  // "oneTimeServingRanges" field.
  List<DateTimeRangeDtoStruct>? _oneTimeServingRanges;
  List<DateTimeRangeDtoStruct> get oneTimeServingRanges =>
      _oneTimeServingRanges ?? const [];
  set oneTimeServingRanges(List<DateTimeRangeDtoStruct>? val) =>
      _oneTimeServingRanges = val;

  void updateOneTimeServingRanges(
      Function(List<DateTimeRangeDtoStruct>) updateFn) {
    updateFn(_oneTimeServingRanges ??= []);
  }

  bool hasOneTimeServingRanges() => _oneTimeServingRanges != null;

  // "recurringServingRanges" field.
  List<WeekDayTimeRangeDtoStruct>? _recurringServingRanges;
  List<WeekDayTimeRangeDtoStruct> get recurringServingRanges =>
      _recurringServingRanges ?? const [];
  set recurringServingRanges(List<WeekDayTimeRangeDtoStruct>? val) =>
      _recurringServingRanges = val;

  void updateRecurringServingRanges(
      Function(List<WeekDayTimeRangeDtoStruct>) updateFn) {
    updateFn(_recurringServingRanges ??= []);
  }

  bool hasRecurringServingRanges() => _recurringServingRanges != null;

  // "basePrice" field.
  MonetaryAmountStruct? _basePrice;
  MonetaryAmountStruct get basePrice => _basePrice ?? MonetaryAmountStruct();
  set basePrice(MonetaryAmountStruct? val) => _basePrice = val;

  void updateBasePrice(Function(MonetaryAmountStruct) updateFn) {
    updateFn(_basePrice ??= MonetaryAmountStruct());
  }

  bool hasBasePrice() => _basePrice != null;

  static MenuOfferDtoStruct fromMap(Map<String, dynamic> data) =>
      MenuOfferDtoStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        parts: getStructList(
          data['parts'],
          PartDtoStruct.fromMap,
        ),
        oneTimeServingRanges: getStructList(
          data['oneTimeServingRanges'],
          DateTimeRangeDtoStruct.fromMap,
        ),
        recurringServingRanges: getStructList(
          data['recurringServingRanges'],
          WeekDayTimeRangeDtoStruct.fromMap,
        ),
        basePrice: data['basePrice'] is MonetaryAmountStruct
            ? data['basePrice']
            : MonetaryAmountStruct.maybeFromMap(data['basePrice']),
      );

  static MenuOfferDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? MenuOfferDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'parts': _parts?.map((e) => e.toMap()).toList(),
        'oneTimeServingRanges':
            _oneTimeServingRanges?.map((e) => e.toMap()).toList(),
        'recurringServingRanges':
            _recurringServingRanges?.map((e) => e.toMap()).toList(),
        'basePrice': _basePrice?.toMap(),
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
        'parts': serializeParam(
          _parts,
          ParamType.DataStruct,
          isList: true,
        ),
        'oneTimeServingRanges': serializeParam(
          _oneTimeServingRanges,
          ParamType.DataStruct,
          isList: true,
        ),
        'recurringServingRanges': serializeParam(
          _recurringServingRanges,
          ParamType.DataStruct,
          isList: true,
        ),
        'basePrice': serializeParam(
          _basePrice,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MenuOfferDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MenuOfferDtoStruct(
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
        parts: deserializeStructParam<PartDtoStruct>(
          data['parts'],
          ParamType.DataStruct,
          true,
          structBuilder: PartDtoStruct.fromSerializableMap,
        ),
        oneTimeServingRanges: deserializeStructParam<DateTimeRangeDtoStruct>(
          data['oneTimeServingRanges'],
          ParamType.DataStruct,
          true,
          structBuilder: DateTimeRangeDtoStruct.fromSerializableMap,
        ),
        recurringServingRanges:
            deserializeStructParam<WeekDayTimeRangeDtoStruct>(
          data['recurringServingRanges'],
          ParamType.DataStruct,
          true,
          structBuilder: WeekDayTimeRangeDtoStruct.fromSerializableMap,
        ),
        basePrice: deserializeStructParam(
          data['basePrice'],
          ParamType.DataStruct,
          false,
          structBuilder: MonetaryAmountStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MenuOfferDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MenuOfferDtoStruct &&
        id == other.id &&
        name == other.name &&
        listEquality.equals(parts, other.parts) &&
        listEquality.equals(oneTimeServingRanges, other.oneTimeServingRanges) &&
        listEquality.equals(
            recurringServingRanges, other.recurringServingRanges) &&
        basePrice == other.basePrice;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        parts,
        oneTimeServingRanges,
        recurringServingRanges,
        basePrice
      ]);
}

MenuOfferDtoStruct createMenuOfferDtoStruct({
  String? id,
  String? name,
  MonetaryAmountStruct? basePrice,
}) =>
    MenuOfferDtoStruct(
      id: id,
      name: name,
      basePrice: basePrice ?? MonetaryAmountStruct(),
    );
