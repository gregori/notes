import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/services/notes_service.dart';
import 'package:notes/widgets/note_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notas'),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: NotesService().getNotes(),
                    builder: (context, snapshot) {
                      List<NoteTile> notes = [];

                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final notesDoc = snapshot.data!.docs;
                      for (var note in notesDoc) {
                        final String title = note.data()['title'];
                        final String subtitle = note.data()['description'];
                        final String id = note.id;
                        notes.add(NoteTile(
                          title: title,
                          subtitle: subtitle,
                          id: id,
                        ));
                      }

                      return Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 20.0,
                          ),
                          children: notes,
                        ),
                      );
                    }),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: const Icon(Icons.add),
        ));
  }
}
