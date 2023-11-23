import 'package:flutter/material.dart';
import 'package:notes/widgets/rounded_button.dart';

class EditNoteButton extends StatelessWidget {
  const EditNoteButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        title: 'Editar Nota', color: Colors.red, onPressed: onPressed);
  }
}
