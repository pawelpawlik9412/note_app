import 'package:flutter/material.dart';
import 'package:note_app/size_config.dart';
import 'package:flutter/cupertino.dart';

class DetailScreen extends StatelessWidget {
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
              TopButtonsBar(),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3,
              ),
              NoteDetailListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteDetailListView extends StatelessWidget {
  NoteDetailListView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4, right: SizeConfig.widthMultiplier * 4),
        child: ListView(
          children: [
            TextField(
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
            Text('03.03.2003',
              style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.8,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            TextField(
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
  TopButtonsBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2, left: SizeConfig.widthMultiplier * 2, right: SizeConfig.widthMultiplier * 2),
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
