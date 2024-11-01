import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertCustom {
  static void showError(
      {String? message, Color? color, Color? textColor}) async {
    if (message != null && message != '') {
      if (message.contains("of 'index'")) return;
      Fluttertoast.showToast(
        msg: message ?? "",
        fontSize: 16.0,
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: color ?? Colors.red,
        textColor: textColor ?? Colors.white,
        webBgColor: "linear-gradient(to right, #b02600, #de5b37)",
      );
    }
  }

  static void showWarning({
    String message = "",
    String title = "Saha",
  }) {
    Fluttertoast.showToast(msg: message);
    // showFlash(
    //   duration: Duration(milliseconds: 2000),
    //   context: Get.context!,
    //   builder: (_, controller) {
    //     return Flash(
    //       controller: controller,
    //       position: FlashPosition.bottom,
    //       borderRadius: BorderRadius.circular(8.0),
    //       borderColor: Colors.amber,
    //       boxShadows: kElevationToShadow[8],
    //       backgroundGradient: RadialGradient(
    //         colors: [Colors.black87, Colors.black87],
    //         center: Alignment.topLeft,
    //         radius: 2,
    //       ),
    //       onTap: () => controller.dismiss(),
    //       forwardAnimationCurve: Curves.easeInCirc,
    //       reverseAnimationCurve: Curves.bounceIn,
    //       child: DefaultTextStyle(
    //         style: TextStyle(color: Colors.white),
    //         child: FlashBar(
    //           title: Text('$title'),
    //           content: Text('$message'),
    //           indicatorColor: Colors.yellow,
    //           icon: Icon(Icons.info_outline),
    //           primaryAction: TextButton(
    //             onPressed: () => controller.dismiss(),
    //             child: Text('Đóng'),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  static void showSuccess({
    String message = "",
    String title = "Saha",
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    // showFlash(
    //   duration: Duration(milliseconds: 1000),
    //   context: Get.context!,
    //   builder: (_, controller) {
    //     return Flash(
    //       controller: controller,
    //       position: FlashPosition.bottom,
    //       borderRadius: BorderRadius.circular(8.0),
    //       borderColor: Colors.blue,
    //       boxShadows: kElevationToShadow[8],
    //       backgroundGradient: RadialGradient(
    //         colors: [Colors.black87, Colors.black87],
    //         center: Alignment.topLeft,
    //         radius: 2,
    //       ),
    //       onTap: () => controller.dismiss(),
    //       forwardAnimationCurve: Curves.easeInCirc,
    //       reverseAnimationCurve: Curves.bounceIn,
    //       child: DefaultTextStyle(
    //         style: TextStyle(color: Colors.white),
    //         child: FlashBar(
    //           title: Text('$title'),
    //           content: Text('$message'),
    //           indicatorColor: Colors.green,
    //           icon: Icon(Icons.check),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
