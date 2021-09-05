import 'package:flutter/material.dart';
import 'package:note_app/model/shared_pref.dart';

enum NotesView {
  NoteGrid, NoteList,
}

class PreferencesData extends ChangeNotifier {

  String title ='Sort by title';
  String creationDate = 'Sort by creation date';
  String editionDate = 'Sort by edition date';

  String tableView = 'table_view';
  String gridView = 'grid_view';

  static final _sortPref = SharedPref(instanceName: 'sort_by', defaultValue: 'createDate DESC');
  static final _viewPref = SharedPref(instanceName: 'view', defaultValue: 'table_view');


  Future<String> getSortPreferences() async {
    var x = await _sortPref.read();
    return x;
  }

  void safeSortPreferences(String value) {
    _sortPref.save(value);
    notifyListeners();
  }

  void removeSortPreferences() {
    _sortPref.remove();
    notifyListeners();
  }

  Future<String> getStringForSortButton() async {
    var x = await _sortPref.read();
    String y;
    if (x == 'title') {
      y = title;
    }
    else if (x == 'createDate DESC') {
      y = creationDate;
    }
    else if (x == 'updateDate DESC') {
      y = editionDate;
    }
    return y;
  }

  Future<String> getViewPreferences() async {
    var x = await _viewPref.read();
    return x;
  }

  void safeViewPreferences(String value) {
    _viewPref.save(value);
    notifyListeners();
  }

  void removeViewPreferences() {
    _viewPref.remove();
    notifyListeners();
  }

  Future<NotesView> getIconForViewButton() async {
    var x = await _viewPref.read();
    if(x == tableView) {
      return NotesView.NoteList;
    }
    else {
      return NotesView.NoteGrid;
    }
  }

  Future<NotesView> getNotesView() async {
    var x = await _viewPref.read();
    if(x == tableView) {
      return NotesView.NoteList;
    }
    else {
      return NotesView.NoteGrid;
    }
  }

  Future<void> changeViewPreferences() async {
    var x = await getViewPreferences();
    if (x == tableView) {
      safeViewPreferences(gridView);
    } else if (x == gridView) {
      safeViewPreferences(tableView);
    }
    notifyListeners();
  }
}