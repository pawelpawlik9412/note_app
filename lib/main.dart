import 'package:flutter/material.dart';
import 'package:note_app/provider/preferences_data.dart';
import 'package:note_app/provider/notes_data.dart';
import 'package:note_app/screens/screen_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesData()),
        ChangeNotifierProvider(create: (_) => PreferencesData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: ScreenManager(),
          ),
        ),
      ),
    );
  }
}
