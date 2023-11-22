import 'package:flutter/material.dart';
import 'package:notes/widgets/rounded_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        title: 'Registrar-se', color: Colors.green, onPressed: onPressed);
  }
}
