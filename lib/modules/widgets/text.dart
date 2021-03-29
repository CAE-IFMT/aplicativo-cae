import 'package:flutter/material.dart';

/// Classe generica para criação de textField
/// usada para inserção e controle de informações
class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final bool password;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  AppText(
      this.label, this.hint, {this.password = false, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
