import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesService {
  final _notesCollection = FirebaseFirestore.instance.collection('notes');

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes() {
    return _notesCollection.snapshots();
  }

  Future<void> updateNote({
    required String title,
    required String description,
    required String id,
  }) async {
    DocumentReference note = _notesCollection.doc(id);

    Map<String, dynamic> data = {
      'title': title,
      'description': description,
    };

    await note
        .update(data)
        .whenComplete(() => log('Nota atualizada'))
        .catchError((e) => log(e));
  }

  Future<void> addNote({
    required String title,
    required String description,
  }) async {
    DocumentReference note = _notesCollection.doc();

    Map<String, dynamic> data = {
      'title': title,
      'description': description,
    };

    await note
        .set(data)
        .whenComplete(() => log('Nota atualizada'))
        .catchError((e) => log(e));
  }

  Future<void> deleteNote({required String id}) async {
    DocumentReference note = _notesCollection.doc(id);

    await note
        .delete()
        .whenComplete(() => log('Nota removida'))
        .catchError((e) => log(e));
  }
}
