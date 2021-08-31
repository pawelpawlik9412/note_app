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
}