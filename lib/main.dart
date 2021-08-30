import 'package:flutter/material.dart';
import 'package:note_app/notes_screen.dart';
import 'package:note_app/size_config.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
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
    );
  }
}
