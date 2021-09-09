import 'package:flutter/material.dart';
import 'package:note_app/size_config.dart';
import 'package:note_app/utils/format_date.dart';

class DetailScreenView extends StatelessWidget {

  final int id;
  final String title;
  final String content;
  final String createDate;
  final String updateDate;

  DetailScreenView({@required this.id, @required this.title, @required this.content, @required this.createDate, @required this.updateDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
              top: SizeConfig.heightMultiplier * 5,
              right: SizeConfig.heightMultiplier * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.fullscreen,
                  size: SizeConfig.heightMultiplier * 3,
                  color: Color(0xFFC6D7E5),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outline,
                  size: SizeConfig.heightMultiplier * 3,
                  color: Color(0xFFC6D7E5),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
                left: SizeConfig.widthMultiplier * 1.5,
                right: SizeConfig.widthMultiplier * 1.5),
            child: ListView(
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Text(
                  FormatDate.labelDateFormat(createDate),
                  style: TextStyle(
                    fontSize: SizeConfig.heightMultiplier * 1.5,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
