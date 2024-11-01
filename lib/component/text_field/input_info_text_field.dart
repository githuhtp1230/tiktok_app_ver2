import 'package:flutter/material.dart';

class InputInfoTextField extends StatelessWidget {
  final String labelString;
  final IconData? iconData;
  final bool? isObscure;
  final TextEditingController? textEditingController;
  final String? assetReference;
  final FormFieldValidator<String>? validator;

  InputInfoTextField({
    super.key,
    required this.labelString,
    this.isObscure,
    this.iconData,
    this.textEditingController,
    this.assetReference,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelString,
        prefixIcon: iconData != null
            ? Icon(iconData)
            : Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  assetReference ?? "",
                  width: 10,
                ),
              ),
        labelStyle: const TextStyle(fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
      obscureText: isObscure ?? false,
    );
  }
}
