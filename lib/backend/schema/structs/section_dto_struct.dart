// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectionDtoStruct extends BaseStruct {
  SectionDtoStruct({
    String? sectionHeader,
    String? sectionSubheader,
    List<SectionElementDtoStruct>? sectionElements,
  })  : _sectionHeader = sectionHeader,
        _sectionSubheader = sectionSubheader,
        _sectionElements = sectionElements;

  // "sectionHeader" field.
  String? _sectionHeader;
  String get sectionHeader => _sectionHeader ?? '';
  set sectionHeader(String? val) => _sectionHeader = val;

  bool hasSectionHeader() => _sectionHeader != null;

  // "sectionSubheader" field.
  String? _sectionSubheader;
  String get sectionSubheader => _sectionSubheader ?? '';
  set sectionSubheader(String? val) => _sectionSubheader = val;

  bool hasSectionSubheader() => _sectionSubheader != null;

  // "sectionElements" field.
  List<SectionElementDtoStruct>? _sectionElements;
  List<SectionElementDtoStruct> get sectionElements =>
      _sectionElements ?? const [];
  set sectionElements(List<SectionElementDtoStruct>? val) =>
      _sectionElements = val;

  void updateSectionElements(Function(List<SectionElementDtoStruct>) updateFn) {
    updateFn(_sectionElements ??= []);
  }

  bool hasSectionElements() => _sectionElements != null;

  static SectionDtoStruct fromMap(Map<String, dynamic> data) =>
      SectionDtoStruct(
        sectionHeader: data['sectionHeader'] as String?,
        sectionSubheader: data['sectionSubheader'] as String?,
        sectionElements: getStructList(
          data['sectionElements'],
          SectionElementDtoStruct.fromMap,
        ),
      );

  static SectionDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? SectionDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sectionHeader': _sectionHeader,
        'sectionSubheader': _sectionSubheader,
        'sectionElements': _sectionElements?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sectionHeader': serializeParam(
          _sectionHeader,
          ParamType.String,
        ),
        'sectionSubheader': serializeParam(
          _sectionSubheader,
          ParamType.String,
        ),
        'sectionElements': serializeParam(
          _sectionElements,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SectionDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      SectionDtoStruct(
        sectionHeader: deserializeParam(
          data['sectionHeader'],
          ParamType.String,
          false,
        ),
        sectionSubheader: deserializeParam(
          data['sectionSubheader'],
          ParamType.String,
          false,
        ),
        sectionElements: deserializeStructParam<SectionElementDtoStruct>(
          data['sectionElements'],
          ParamType.DataStruct,
          true,
          structBuilder: SectionElementDtoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SectionDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SectionDtoStruct &&
        sectionHeader == other.sectionHeader &&
        sectionSubheader == other.sectionSubheader &&
        listEquality.equals(sectionElements, other.sectionElements);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([sectionHeader, sectionSubheader, sectionElements]);
}

SectionDtoStruct createSectionDtoStruct({
  String? sectionHeader,
  String? sectionSubheader,
}) =>
    SectionDtoStruct(
      sectionHeader: sectionHeader,
      sectionSubheader: sectionSubheader,
    );
