import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_form_field.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key, required this.onChanged});

  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      hintText: 'Entre sua senha',
      onChanged: onChanged,
      obscureText: true,
    );
  }
}
