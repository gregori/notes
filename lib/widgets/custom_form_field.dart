import 'package:flutter/material.dart';
import 'package:notes/utils/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.obscureText,
  });

  final String hintText;
  final bool? obscureText;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: kTextFieldDecoration.copyWith(
        hintText: hintText,
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
    );
  }
}
