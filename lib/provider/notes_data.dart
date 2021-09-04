import 'package:flutter/cupertino.dart';
import 'package:note_app/database/database_helper.dart';
import 'package:note_app/model/note.dart';

class NotesData extends ChangeNotifier {

  var _db = DatabaseHelper.db;

  Future<List<Note>> getAllItems() async {
    var x = await _db.getAllNotes('title');
    return x;
  }

  void addNote(Note note) {
    _db.insertNote(note);
    notifyListeners();
  }

  void deleteNote(int noteId) async {
    _db.deleteNote(noteId);
    notifyListeners();
  }

  void updateNote(int noteId, String titleUpdate, String contentUpdate, String dateUpdate) {
    _db.updateNote(noteId, titleUpdate, contentUpdate, dateUpdate);
    notifyListeners();
  }

  get getNumberOfNotes async {
    var x = await _db.getNumberOfNotes();
    return x;
  }
}