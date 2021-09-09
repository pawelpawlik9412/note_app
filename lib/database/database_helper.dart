import 'package:note_app/model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  String id = 'id';
  String notesTable = 'notes_table';
  String title = 'title';
  String content = 'content';
  String createDate = 'createDate';
  String updateDate = 'updateDate';

  static Database _database;
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  get _dbPath async {
    var documentsDirectory = await _localPath;
    var path = p.join(documentsDirectory, '$notesTable.db');
    return path;
  }

  Future get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<bool> dbExists() async {
    return File(await _dbPath).exists();
  }

  initDB() async {
    String path = await _dbPath;
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $notesTable ("
          "$id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "$title TEXT,"
          "$content TEXT,"
          "$createDate TEXT,"
          "$updateDate TEXT"
          ")");
    });
  }

  closeDB() {
    if (_database != null) {
      _database.close();
    }
  }

  // CRUD //
  Future<List<Note>> getAllNotes(String orderBy) async {
    var db = await this.database;
    var map = await db.query('$notesTable order by $orderBy');
    List<Note> notesList = [];

    for (int i = 0; i < map.length; i++) {
      notesList.add(Note.fromMapObject(map[i]),
      );
    }
    return notesList;
  }

  Future<int> insertNote(Note note) async {
    var db = await this.database;
    var result = await db.insert(notesTable, note.toMap());
    return result;
  }

  Future<int> deleteNote(int noteId) async {
    var db = await this.database;
    var result = await db.rawDelete('DELETE FROM $notesTable WHERE $id =$noteId');
    return result;
  }

  Future<int> updateNote(int noteId, String titleUpdate, String contentUpdate, String dateUpdate) async {
    var db = await this.database;
    int result = await db.rawUpdate('UPDATE $notesTable SET $title = "$titleUpdate", $content = "$contentUpdate", $updateDate = "$dateUpdate" WHERE $id = $noteId');
    return result;
  }

  Future<int> getNumberOfNotes() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $notesTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<Note> getNote(noteId) async {
    final Database db = await this.database;
    final List<Map<String, dynamic>> map = await db.rawQuery(
        'SELECT * From $notesTable WHERE $id = $noteId');
    int i = 0;
    Note note = Note(
      id: map[i]['id'],
      title: map[i]['title'].toString(),
      content: map[i]['content'].toString(),
      createDate: map[i]['createDate'].toString(),
      updateDate: map[i]['updateDate'].toString(),
    );
    return note;
  }
}