import 'package:flutter/material.dart';
import 'package:notes/services/notes_service.dart';
import 'package:notes/widgets/form_note.dart';

class EditNoteScreenArguments {
  final String title;
  final String description;
  final String noteId;

  EditNoteScreenArguments({
    required this.title,
    required this.description,
    required this.noteId,
  });
}

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late String noteId;

  void onPressed() {
    NotesService().updateNote(
      title: titleController.text,
      description: descriptionController.text,
      id: noteId,
    );
    Navigator.pushNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as EditNoteScreenArguments;

    titleController = TextEditingController(text: args.title);
    descriptionController = TextEditingController(text: args.description);
    noteId = args.noteId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Nota'),
        backgroundColor: Colors.red,
      ),
      body: FormNote(
        onPressed: onPressed,
        titleController: titleController,
        descriptionController: descriptionController,
        formType: FormNote.editNote,
      ),
    );
  }
}
