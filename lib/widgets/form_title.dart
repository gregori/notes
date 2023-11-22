import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, required this.formTitle});

  final String formTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        formTitle,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
