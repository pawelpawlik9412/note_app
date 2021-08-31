import 'package:flutter/material.dart';
import 'package:note_app/database/database_helper.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/provider/notes_data.dart';
import 'package:note_app/size_config.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopFunctionsBar(),
        AllNotesView(),
        BottomNotesCounter(),
      ],
    );
  }
}

class TopFunctionsBar extends StatelessWidget {
  const TopFunctionsBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.heightMultiplier * 4.0,
          left: SizeConfig.widthMultiplier * 3,
          right: SizeConfig.widthMultiplier * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notes',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: SizeConfig.textMultiplier * 5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.view_stream,
                      size: SizeConfig.textMultiplier * 3.5,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.create,
                      size: SizeConfig.textMultiplier * 3.5,
                    ),
                    onPressed: () {
                      Provider.of<NotesData>(context, listen: false).addNote(Note(
                        title: 'dummy data',
                        content: 'dummy data',
                        createDate: 'dummy data',
                        updateDate: 'dummy data',
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Text(
              'Sort by title',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 1.7,
                color: Color(0xFFAAA8B4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AllNotesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FutureBuilder(
          future: Provider.of<NotesData>(context).getAllItems(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              List<Note> list = snapshot.data;
              return ListView(
                children: List<Text>.generate(list.length, (i) => Text(list[i].title),),
              );
            }
            else if(snapshot.hasError) {
              return Text('Ops, something goes wrong!');
            }
            else if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class BottomNotesCounter extends StatelessWidget {
  const BottomNotesCounter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 0.8),
      width: double.infinity,
      height: SizeConfig.heightMultiplier * 3.5,
      child: Center(
        child: Text(
          '1 note',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2,
            color: Color(0xFFAAA8B4),
          ),
        ),
      ),
    );
  }
}

