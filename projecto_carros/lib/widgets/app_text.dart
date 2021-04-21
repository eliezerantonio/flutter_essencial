import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.nextFocus,
    this.obscure=false,

  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscure ;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode nextFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: nextFocus,
      onFieldSubmitted: (String text) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      style: TextStyle(fontSize: 20, color: Colors.blue),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      validator: validator,
    );
  }
}
