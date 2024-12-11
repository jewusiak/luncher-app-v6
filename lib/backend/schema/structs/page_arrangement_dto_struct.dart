// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PageArrangementDtoStruct extends BaseStruct {
  PageArrangementDtoStruct({
    bool? primaryPage,
    List<SectionDtoStruct>? sections,
  })  : _primaryPage = primaryPage,
        _sections = sections;

  // "primaryPage" field.
  bool? _primaryPage;
  bool get primaryPage => _primaryPage ?? false;
  set primaryPage(bool? val) => _primaryPage = val;

  bool hasPrimaryPage() => _primaryPage != null;

  // "sections" field.
  List<SectionDtoStruct>? _sections;
  List<SectionDtoStruct> get sections => _sections ?? const [];
  set sections(List<SectionDtoStruct>? val) => _sections = val;

  void updateSections(Function(List<SectionDtoStruct>) updateFn) {
    updateFn(_sections ??= []);
  }

  bool hasSections() => _sections != null;

  static PageArrangementDtoStruct fromMap(Map<String, dynamic> data) =>
      PageArrangementDtoStruct(
        primaryPage: data['primaryPage'] as bool?,
        sections: getStructList(
          data['sections'],
          SectionDtoStruct.fromMap,
        ),
      );

  static PageArrangementDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? PageArrangementDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'primaryPage': _primaryPage,
        'sections': _sections?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'primaryPage': serializeParam(
          _primaryPage,
          ParamType.bool,
        ),
        'sections': serializeParam(
          _sections,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PageArrangementDtoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PageArrangementDtoStruct(
        primaryPage: deserializeParam(
          data['primaryPage'],
          ParamType.bool,
          false,
        ),
        sections: deserializeStructParam<SectionDtoStruct>(
          data['sections'],
          ParamType.DataStruct,
          true,
          structBuilder: SectionDtoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PageArrangementDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PageArrangementDtoStruct &&
        primaryPage == other.primaryPage &&
        listEquality.equals(sections, other.sections);
  }

  @override
  int get hashCode => const ListEquality().hash([primaryPage, sections]);
}

PageArrangementDtoStruct createPageArrangementDtoStruct({
  bool? primaryPage,
}) =>
    PageArrangementDtoStruct(
      primaryPage: primaryPage,
    );
