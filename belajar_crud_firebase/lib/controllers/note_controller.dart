import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';

class NoteController {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(Note note) async {
    // Ambil semua dokumen dulu buat tahu jumlah catatan
    final snapshot = await notesCollection.get();

    // Hitung jumlah dokumen, lalu buat ID baru
    final newId = 'noteId${snapshot.docs.length + 1}';

    // Simpan note dengan ID tersebut
    await notesCollection.doc(newId).set(note.toMap());
  }

  Future<void> updateNote(Note note) async {
    await notesCollection.doc(note.id).update(note.toMap());
  }

  Future<void> deleteNote(String id) async {
    await notesCollection.doc(id).delete();
  }

  Stream<List<Note>> getNotes() {
    return notesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Note.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
