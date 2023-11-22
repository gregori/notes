import 'package:flutter/material.dart';
import 'package:notes/widgets/rounded_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        title: 'Login', color: Colors.blueAccent, onPressed: onPressed);
  }
}
