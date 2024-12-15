// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectionElementDtoStruct extends BaseStruct {
  SectionElementDtoStruct({
    String? sourceElementId,
    String? elementType,
    String? header,
    String? subheader,
    String? uri,
    AssetDtoStruct? thumbnail,
  })  : _sourceElementId = sourceElementId,
        _elementType = elementType,
        _header = header,
        _subheader = subheader,
        _uri = uri,
        _thumbnail = thumbnail;

  // "sourceElementId" field.
  String? _sourceElementId;
  String get sourceElementId => _sourceElementId ?? '';
  set sourceElementId(String? val) => _sourceElementId = val;

  bool hasSourceElementId() => _sourceElementId != null;

  // "elementType" field.
  String? _elementType;
  String get elementType => _elementType ?? '';
  set elementType(String? val) => _elementType = val;

  bool hasElementType() => _elementType != null;

  // "header" field.
  String? _header;
  String get header => _header ?? '';
  set header(String? val) => _header = val;

  bool hasHeader() => _header != null;

  // "subheader" field.
  String? _subheader;
  String get subheader => _subheader ?? '';
  set subheader(String? val) => _subheader = val;

  bool hasSubheader() => _subheader != null;

  // "uri" field.
  String? _uri;
  String get uri => _uri ?? '';
  set uri(String? val) => _uri = val;

  bool hasUri() => _uri != null;

  // "thumbnail" field.
  AssetDtoStruct? _thumbnail;
  AssetDtoStruct get thumbnail => _thumbnail ?? AssetDtoStruct();
  set thumbnail(AssetDtoStruct? val) => _thumbnail = val;

  void updateThumbnail(Function(AssetDtoStruct) updateFn) {
    updateFn(_thumbnail ??= AssetDtoStruct());
  }

  bool hasThumbnail() => _thumbnail != null;

  static SectionElementDtoStruct fromMap(Map<String, dynamic> data) =>
      SectionElementDtoStruct(
        sourceElementId: data['sourceElementId'] as String?,
        elementType: data['elementType'] as String?,
        header: data['header'] as String?,
        subheader: data['subheader'] as String?,
        uri: data['uri'] as String?,
        thumbnail: data['thumbnail'] is AssetDtoStruct
            ? data['thumbnail']
            : AssetDtoStruct.maybeFromMap(data['thumbnail']),
      );

  static SectionElementDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? SectionElementDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sourceElementId': _sourceElementId,
        'elementType': _elementType,
        'header': _header,
        'subheader': _subheader,
        'uri': _uri,
        'thumbnail': _thumbnail?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sourceElementId': serializeParam(
          _sourceElementId,
          ParamType.String,
        ),
        'elementType': serializeParam(
          _elementType,
          ParamType.String,
        ),
        'header': serializeParam(
          _header,
          ParamType.String,
        ),
        'subheader': serializeParam(
          _subheader,
          ParamType.String,
        ),
        'uri': serializeParam(
          _uri,
          ParamType.String,
        ),
        'thumbnail': serializeParam(
          _thumbnail,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SectionElementDtoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SectionElementDtoStruct(
        sourceElementId: deserializeParam(
          data['sourceElementId'],
          ParamType.String,
          false,
        ),
        elementType: deserializeParam(
          data['elementType'],
          ParamType.String,
          false,
        ),
        header: deserializeParam(
          data['header'],
          ParamType.String,
          false,
        ),
        subheader: deserializeParam(
          data['subheader'],
          ParamType.String,
          false,
        ),
        uri: deserializeParam(
          data['uri'],
          ParamType.String,
          false,
        ),
        thumbnail: deserializeStructParam(
          data['thumbnail'],
          ParamType.DataStruct,
          false,
          structBuilder: AssetDtoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SectionElementDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SectionElementDtoStruct &&
        sourceElementId == other.sourceElementId &&
        elementType == other.elementType &&
        header == other.header &&
        subheader == other.subheader &&
        uri == other.uri &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([sourceElementId, elementType, header, subheader, uri, thumbnail]);
}

SectionElementDtoStruct createSectionElementDtoStruct({
  String? sourceElementId,
  String? elementType,
  String? header,
  String? subheader,
  String? uri,
  AssetDtoStruct? thumbnail,
}) =>
    SectionElementDtoStruct(
      sourceElementId: sourceElementId,
      elementType: elementType,
      header: header,
      subheader: subheader,
      uri: uri,
      thumbnail: thumbnail ?? AssetDtoStruct(),
    );
