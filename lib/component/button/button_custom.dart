import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback onPressed;
  final String content;

  ButtonCustom({super.key, required this.onPressed, required this.content});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 80),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13)
        )
      ),
      onPressed: onPressed,
      child: Text(content, style: const TextStyle(color: Colors.black, fontSize: 20),),
    );
  }
}
