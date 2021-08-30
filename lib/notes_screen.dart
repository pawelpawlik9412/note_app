import 'package:flutter/material.dart';
import 'package:note_app/size_config.dart';

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
                    onPressed: () {},
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
  const AllNotesView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          children: [],
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

