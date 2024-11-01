import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogs {
  static void showDialogYesNo(
      {String? mess,
        bool barrierDismissible = true,
        Function? onClose,
        Function? onOK}) {
    // flutter defined function
    showDialog(
      barrierDismissible: barrierDismissible,
      context: Get.context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Notification"),
          content: Text(mess!),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text(
                "Cancel",
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onClose!();
              },
            ),
            new TextButton(
              child: new Text(
                "OK",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onOK!();
              },
            ),
          ],
        );
      },
    );
  }

  // static
}