// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssetDtoStruct extends BaseStruct {
  AssetDtoStruct({
    String? id,
    String? description,
    String? mimeType,
    String? uploadStatus,
    String? accessUrl,
    String? blurHash,
  })  : _id = id,
        _description = description,
        _mimeType = mimeType,
        _uploadStatus = uploadStatus,
        _accessUrl = accessUrl,
        _blurHash = blurHash;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "mimeType" field.
  String? _mimeType;
  String get mimeType => _mimeType ?? '';
  set mimeType(String? val) => _mimeType = val;

  bool hasMimeType() => _mimeType != null;

  // "uploadStatus" field.
  String? _uploadStatus;
  String get uploadStatus => _uploadStatus ?? '';
  set uploadStatus(String? val) => _uploadStatus = val;

  bool hasUploadStatus() => _uploadStatus != null;

  // "accessUrl" field.
  String? _accessUrl;
  String get accessUrl => _accessUrl ?? '';
  set accessUrl(String? val) => _accessUrl = val;

  bool hasAccessUrl() => _accessUrl != null;

  // "blurHash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;

  bool hasBlurHash() => _blurHash != null;

  static AssetDtoStruct fromMap(Map<String, dynamic> data) => AssetDtoStruct(
        id: data['id'] as String?,
        description: data['description'] as String?,
        mimeType: data['mimeType'] as String?,
        uploadStatus: data['uploadStatus'] as String?,
        accessUrl: data['accessUrl'] as String?,
        blurHash: data['blurHash'] as String?,
      );

  static AssetDtoStruct? maybeFromMap(dynamic data) =>
      data is Map ? AssetDtoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'description': _description,
        'mimeType': _mimeType,
        'uploadStatus': _uploadStatus,
        'accessUrl': _accessUrl,
        'blurHash': _blurHash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'mimeType': serializeParam(
          _mimeType,
          ParamType.String,
        ),
        'uploadStatus': serializeParam(
          _uploadStatus,
          ParamType.String,
        ),
        'accessUrl': serializeParam(
          _accessUrl,
          ParamType.String,
        ),
        'blurHash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
      }.withoutNulls;

  static AssetDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssetDtoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        mimeType: deserializeParam(
          data['mimeType'],
          ParamType.String,
          false,
        ),
        uploadStatus: deserializeParam(
          data['uploadStatus'],
          ParamType.String,
          false,
        ),
        accessUrl: deserializeParam(
          data['accessUrl'],
          ParamType.String,
          false,
        ),
        blurHash: deserializeParam(
          data['blurHash'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AssetDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssetDtoStruct &&
        id == other.id &&
        description == other.description &&
        mimeType == other.mimeType &&
        uploadStatus == other.uploadStatus &&
        accessUrl == other.accessUrl &&
        blurHash == other.blurHash;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, description, mimeType, uploadStatus, accessUrl, blurHash]);
}

AssetDtoStruct createAssetDtoStruct({
  String? id,
  String? description,
  String? mimeType,
  String? uploadStatus,
  String? accessUrl,
  String? blurHash,
}) =>
    AssetDtoStruct(
      id: id,
      description: description,
      mimeType: mimeType,
      uploadStatus: uploadStatus,
      accessUrl: accessUrl,
      blurHash: blurHash,
    );
