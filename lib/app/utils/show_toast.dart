import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';

showToast(msg) {
  logg(msg);
  Fluttertoast.showToast(
    msg: msg.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}

void logg(msg, [StackTrace? stackTrace]) {
  String details = " - Details: $stackTrace";
  String message = '';

  if (msg is Map<String, dynamic>) {
    try {
      message = jsonEncode(msg);
    } catch (e) {
      message = msg.toString();
    }
  } else if (msg is Object) {
    try {
      message = jsonEncode(msg);
    } catch (e) {
      message = msg.toString();
    }
  } else if (msg.runtimeType == List) {
    message = (msg as List)
        .map((e) {
          if (e is Map<String, dynamic>) {
            return jsonEncode(e);
          } else {
            return e;
          }
        })
        .toList()
        .toString();
  } else {
    message = msg.toString();
  }

  String horizontalLine = '═' * 50;

  String logMessage = '''
$horizontalLine>>>>x
 ${message.padLeft(message.length + 2).padRight(message.length + 2)} 
x<<<<$horizontalLine
''';

  log(
    logMessage,
    name: "LEBOWSKI ${msg.runtimeType} ${stackTrace != null ? details : ''}",
  );
}
