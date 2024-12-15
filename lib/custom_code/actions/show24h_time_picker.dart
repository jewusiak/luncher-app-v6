// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> show24hTimePicker(
  BuildContext context,
  String? initialTime,
) async {
  // Add your function code here!
  initialTime ??= DateFormat.Hm().format(DateTime.now());
  TimeOfDay? dt = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(DateFormat.Hm().parse(initialTime)),
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );
  if (dt == null) return initialTime;

  return DateFormat.Hm().format(DateTime(1970, 01, 01, dt.hour, dt.minute));
}
