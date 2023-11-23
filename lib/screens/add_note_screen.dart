import 'package:flutter/material.dart';
import 'package:notes/services/notes_service.dart';
import 'package:notes/widgets/form_note.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  void onPressed() {
    NotesService().addNote(
      title: titleController.text,
      description: descriptionController.text,
    );
    Navigator.pushNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Nota'),
        backgroundColor: Colors.red,
      ),
      body: FormNote(
        onPressed: onPressed,
        titleController: titleController,
        descriptionController: descriptionController,
        formType: FormNote.addNote,
      ),
    );
  }
}
