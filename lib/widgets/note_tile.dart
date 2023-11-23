import 'package:flutter/material.dart';
import 'package:notes/screens/edit_note_screen.dart';
// import 'package:notes/screens/edit_note_screen.dart';
import 'package:notes/services/notes_service.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.id,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String id;

  @override
  Widget build(BuildContext context) {
    final notesService = NotesService();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/edit',
              arguments: EditNoteScreenArguments(
                title: title,
                description: subtitle,
                noteId: id,
              ));
        },
        onLongPress: () {
          notesService.deleteNote(id: id);
        },
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        tileColor: Colors.red[100],
      ),
    );
  }
}
