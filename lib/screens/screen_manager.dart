import 'package:flutter/material.dart';
import 'package:note_app/screens/detail_screen_view.dart';
import 'package:note_app/screens/notes_screen.dart';
import 'package:note_app/size_config.dart';

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
                    child: DetailScreenView(id: 1, title: '2', content: '3', createDate: '2021-09-08 09:56:18', updateDate: '2021-09-08 09:56:18')
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
