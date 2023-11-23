import 'package:flutter/material.dart';
import 'package:notes/widgets/rounded_button.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        title: 'Adicionar Nota', color: Colors.red, onPressed: onPressed);
  }
}
