import 'package:flutter/material.dart';
 
class RegistrationButton extends StatelessWidget {
  RegistrationButton({
    super.key,
    required this.label,
    required this.labelColor,
    required this.backgroundColor,
  });

  final Color labelColor;
  final Color backgroundColor;
  final String label;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // Processar os dados do formulário
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processando dados')),
          );
        }
      },
      child: Text(label, style: TextStyle(color: labelColor)),
    );
  }
}
