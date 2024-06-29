import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationFormPerson extends StatelessWidget {
  final MaskTextInputFormatter styleMask;
  final TextInputType keyboardType;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextStyle? errorStyle;

  const RegistrationFormPerson({
    required this.styleMask,
    required this.keyboardType,
    required this.labelText,
    required this.controller,
    this.validator,
    this.errorStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [styleMask],
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorStyle: errorStyle,
      ),
      validator: validator,
    );
  }
}
