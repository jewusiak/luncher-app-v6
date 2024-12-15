// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonetaryAmountStruct extends BaseStruct {
  MonetaryAmountStruct({
    double? amount,
    String? currencyCode,
  })  : _amount = amount,
        _currencyCode = currencyCode;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "currencyCode" field.
  String? _currencyCode;
  String get currencyCode => _currencyCode ?? '';
  set currencyCode(String? val) => _currencyCode = val;

  bool hasCurrencyCode() => _currencyCode != null;

  static MonetaryAmountStruct fromMap(Map<String, dynamic> data) =>
      MonetaryAmountStruct(
        amount: castToType<double>(data['amount']),
        currencyCode: data['currencyCode'] as String?,
      );

  static MonetaryAmountStruct? maybeFromMap(dynamic data) => data is Map
      ? MonetaryAmountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'amount': _amount,
        'currencyCode': _currencyCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'currencyCode': serializeParam(
          _currencyCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static MonetaryAmountStruct fromSerializableMap(Map<String, dynamic> data) =>
      MonetaryAmountStruct(
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        currencyCode: deserializeParam(
          data['currencyCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MonetaryAmountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MonetaryAmountStruct &&
        amount == other.amount &&
        currencyCode == other.currencyCode;
  }

  @override
  int get hashCode => const ListEquality().hash([amount, currencyCode]);
}

MonetaryAmountStruct createMonetaryAmountStruct({
  double? amount,
  String? currencyCode,
}) =>
    MonetaryAmountStruct(
      amount: amount,
      currencyCode: currencyCode,
    );
