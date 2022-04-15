import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {Key? key,
      required this.nameController,
      required this.labelText,
      this.suffixIcon,
      this.keyboradType,
      this.isTextObscure,
      required this.errorText,
      required this.validatorFunction})
      : super(key: key);

  final TextEditingController nameController;
  final String labelText;
  final IconButton? suffixIcon;
  final TextInputType? keyboradType;
  final bool? isTextObscure;
  final String errorText;
  final String? Function(String?) validatorFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
        keyboardType: keyboradType,
        cursorColor: Colors.green,
        obscureText: isTextObscure ?? false,
        validator: validatorFunction);
  }
}
