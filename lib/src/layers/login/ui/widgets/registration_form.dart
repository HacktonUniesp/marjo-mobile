import 'package:flutter/material.dart';
import 'package:marjosports/src/theme/theme_app.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationFormPerson extends StatefulWidget {
  RegistrationFormPerson(
      {super.key,
      required this.labelText,
      required this.keyboardType,
      required this.controller,
      required this.styleMask});

  final TextInputType keyboardType;
  final String labelText;
  final MaskTextInputFormatter styleMask;
  final TextEditingController controller;

  @override
  State<RegistrationFormPerson> createState() => _RegistrationFormPersonState();
}

class _RegistrationFormPersonState extends State<RegistrationFormPerson> {
   Color _labelColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  
  }

  @override
  void dispose() {
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: widget.controller,
        inputFormatters: [widget.styleMask],
         keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          focusColor: ThemeApp.grayColor,
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide.none,
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: _labelColor),
        ),
      ),
    );
  }
}
