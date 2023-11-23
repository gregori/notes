import 'package:flutter/material.dart';
import 'package:notes/utils/constants.dart';
import 'package:notes/widgets/add_note_button.dart';
import 'package:notes/widgets/edit_note_button.dart';

class FormNote extends StatelessWidget {
  static const addNote = 'add_note';
  static const editNote = 'edit_note';

  const FormNote({
    super.key,
    required this.onPressed,
    required this.titleController,
    required this.descriptionController,
    required this.formType,
  });

  final VoidCallback onPressed;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final String formType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration:
                kTextFieldDecoration.copyWith(hintText: 'Título da nota'),
            controller: titleController,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição da nota',
              ),
              controller: descriptionController,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          formType == addNote
              ? AddNoteButton(onPressed: onPressed)
              : EditNoteButton(onPressed: onPressed)
        ],
      ),
    );
  }
}
