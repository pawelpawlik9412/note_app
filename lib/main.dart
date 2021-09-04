import 'package:flutter/material.dart';
import 'package:note_app/provider/preferences_data.dart';
import 'package:note_app/screens/notes_screen.dart';
import 'package:note_app/provider/notes_data.dart';
import 'package:note_app/size_config.dart';
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
            child: Container(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return OrientationBuilder(
                    builder: (context, orientation) {
                      SizeConfig().init(constraints, orientation);
                      return NotesScreen();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
