import 'package:flutter/material.dart';
import 'package:note_app/screens/detail_screen.dart';
import 'package:note_app/size_config.dart';
import 'package:note_app/utils/format_date.dart';

class GridViewCard extends StatelessWidget {

  final int id;
  final String title;
  final String content;
  final String createDate;
  final String updateDate;

  GridViewCard({@required this.id, @required this.title, @required this.content, @required this.createDate, @required this.updateDate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailScreen(
                id: id,
                title: title,
                content: content,
                createDate: createDate,
                updateDate: updateDate,
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2.0),
        margin: EdgeInsets.all(SizeConfig.heightMultiplier * 1.0),
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.2,
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF3C424A),
                fontSize: SizeConfig.textMultiplier * 2.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.7,
            ),
            Text(
              FormatDate.labelDateFormat(createDate),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF3C424A),
                fontSize: SizeConfig.textMultiplier * 1.8,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.7,
            ),
            Text(
              content,
              textAlign: TextAlign.left,
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize:  SizeConfig.textMultiplier * 1.8,
                color: Color(0xFF3C424A),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
