import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/provider/notes_data.dart';
import 'package:note_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {

  final int id;
  final String title;
  final String content;
  final String createDate;
  final String updateDate;

  DetailScreen({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.createDate,
    @required this.updateDate,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _contentController.text = widget.content;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: SizeConfig.heightMultiplier * 4.0,
            left: SizeConfig.widthMultiplier * 3,
            right: SizeConfig.widthMultiplier * 3,
          ),
          child: Column(
            children: [
              TopButtonsBar(content: _contentController, title: _titleController, createDate: widget.createDate),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3,
              ),
              NoteDetailListView(title: _titleController, content: _contentController, createDate: widget.createDate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteDetailListView extends StatelessWidget  {

  TextEditingController title;
  TextEditingController content;
  String createDate;

  NoteDetailListView({@required this.title, @required this.content, @required this.createDate});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          children: [
            TextField(
              controller: title,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 4,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF4F4F4),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3C424A)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Text(createDate,
              style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.8,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            TextField(
              controller: content,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2.2,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF4F4F4),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3C424A)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopButtonsBar extends StatelessWidget {

  TextEditingController title;
  TextEditingController content;
  String createDate;


  TopButtonsBar({@required this.title, @required this.content, @required this.createDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.black,
                size: SizeConfig.heightMultiplier * 3.5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(color: Colors.tealAccent,),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(
                Icons.save_alt,
                color: Colors.black,
                size: SizeConfig.heightMultiplier * 3.5,
              ),
              onPressed: () {
                Provider.of<NotesData>(context, listen: false).addNote(Note(
                  title: title.text,
                  content: content.text,
                  createDate: createDate,
                  updateDate: createDate,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.black,
                size: SizeConfig.heightMultiplier * 3.5,
              ),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }
}
