import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_form_field.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key, required this.onChanged});

  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(hintText: 'Entre seu email', onChanged: onChanged);
  }
}
