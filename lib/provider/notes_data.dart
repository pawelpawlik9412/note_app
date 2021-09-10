import 'package:flutter/cupertino.dart';
import 'package:note_app/database/database_helper.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/provider/preferences_data.dart';
import 'package:provider/provider.dart';

class NotesData extends ChangeNotifier {

  var _db = DatabaseHelper.db;

  Note selectedNote;

  Future<List<Note>> getAllItems(BuildContext context) async {
    var sortBy = await Provider.of<PreferencesData>(context).getSortPreferences();
    var x = await _db.getAllNotes(sortBy);
    return x;
  }

  void addNote(Note note) {
    _db.insertNote(note);
    notifyListeners();
  }

  void deleteNote(int noteId, context) async {
    _db.deleteNote(noteId);
    notifyListeners();
    var y = await getFirstNote(context);
    if (y == null) {
      selectedNote = null;
    }
    else if(selectedNote == null || noteId == selectedNote.id || y != null) {
      setSelectedNote(y.id);
    }
    notifyListeners();
  }

  void updateNote(int noteId, String titleUpdate, String contentUpdate, String dateUpdate) {
    _db.updateNote(noteId, titleUpdate, contentUpdate, dateUpdate);
    notifyListeners();
    if(selectedNote == null) {
      return;
    }
    else if(noteId == selectedNote.id) {
      selectedNote.title = titleUpdate;
      selectedNote.content = contentUpdate;
      selectedNote.updateDate = dateUpdate;
    }
    notifyListeners();
  }

  get getNumberOfNotes async {
    var x = await _db.getNumberOfNotes();
    return x;
  }

  Future<Note> getFirstNote(context) async {
    var y = await Provider.of<PreferencesData>(context, listen:  false).getSortPreferences();
    var x = await _db.getAllNotes(y);
    var result;

    try {
      result = x[0];
    }
    catch (e) {
      print(e);
      result = null;
    }
    return result;
  }

  Future<void> setSelectedNote(noteId) async {
    var x = await _db.getNote(noteId);
    selectedNote = x;
    notifyListeners();
  }

  Future<Note> getNoteForDetailView(context) async {
    Note note;
    if(selectedNote == null) {
      note = await getFirstNote(context);
    }
    else {
      note = selectedNote;
    }
    return note;
  }
}