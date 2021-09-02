import 'package:flutter/material.dart';
import 'package:note_app/custom_widgets/list_view_card.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/provider/notes_data.dart';
import 'package:note_app/size_config.dart';
import 'package:provider/provider.dart';
import 'package:note_app/screens/detail_screen.dart';

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
          right: SizeConfig.widthMultiplier * 3,
      ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                id: null,
                                title: null,
                                content: null,
                                createDate: '00.00.0000',
                                updateDate: '00.00.0000',
                              );;
                            },
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
              return Scrollbar(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final note = list[index];
                    return Dismissible(
                      key: Key(note.id.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        margin: EdgeInsets.only(top: SizeConfig.heightMultiplier),
                        color: Colors.redAccent,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 8),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: SizeConfig.heightMultiplier * 3.5,
                            ),
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        try {
                          Provider.of<NotesData>(context, listen: false).deleteNote(note.id);
                          list.removeAt(index);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: ListViewCard(
                        id: note.id,
                        title: note.title,
                        content: note.content,
                        createDate: note.createDate,
                        updateDate: note.updateDate,
                      ),
                    );
                  },
                ),
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
        child: FutureBuilder(
          future: Provider.of<NotesData>(context).getNumberOfNotes,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == 1) {
                return NumberOfNotesText(number: snapshot.data, notes: 'note');
              }
              else {
                return NumberOfNotesText(number: snapshot.data, notes: 'notes');
              }
            }
            else {
              return Text(
                '',
              );
            }
          },
        ),
      ),
    );
  }
}

class NumberOfNotesText extends StatelessWidget {

  final int number;
  final String notes;

  NumberOfNotesText({@required this.number, @required this.notes});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$number  $notes',
      style:  TextStyle(
        fontSize: SizeConfig.textMultiplier * 2,
        color: Color(0xFFAAA8B4),
      ),
    );
  }
}


