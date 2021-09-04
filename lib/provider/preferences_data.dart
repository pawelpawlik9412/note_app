import 'package:flutter/material.dart';
import 'package:note_app/model/shared_pref.dart';

class PreferencesData extends ChangeNotifier {

  String title ='Sort by title';
  String creationDate = 'Sort by creation date';
  String editionDate = 'Sort by edition date';

  static final _sortPref = SharedPref(instanceName: 'sort_by', defaultValue: 'createDate DESC');

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
}