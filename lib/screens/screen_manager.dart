import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/provider/notes_data.dart';
import 'package:note_app/screens/detail_screen_view.dart';
import 'package:note_app/screens/notes_screen.dart';
import 'package:note_app/size_config.dart';
import 'package:provider/provider.dart';

class ScreenManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: NotesScreen(),
                    ),
                  ),
                  SizeConfig().screenSize ? Container() : Expanded(
                    flex: 3,
                    child: Container(
                      color: Color(0xFFF4F4F4),
                      child: FutureBuilder<Note>(
                          future: Provider.of<NotesData>(context).getNoteForDetailView(context),
                          builder: (context, snapshot) {
                            if(snapshot.hasData) {
                              Note note = snapshot.data;
                              return DetailScreenView(id: note.id, title: note.title, content: note.content, createDate: note.createDate, updateDate: note.updateDate);
                            }
                            else {
                              return Container();
                            }
                          },
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
