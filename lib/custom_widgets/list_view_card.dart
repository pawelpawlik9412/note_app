import 'package:flutter/material.dart';
import 'package:note_app/provider/notes_data.dart';
import 'package:note_app/screens/detail_screen.dart';
import 'package:note_app/size_config.dart';
import 'package:note_app/utils/format_date.dart';
import 'package:provider/provider.dart';

class ListViewCard extends StatelessWidget {

  final int id;
  final String title;
  final String content;
  final String createDate;
  final String updateDate;

  ListViewCard({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.createDate,
    @required this.updateDate,
  });



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(SizeConfig().screenSize == true) {
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
        }
        else {
          Provider.of<NotesData>(context, listen: false).setSelectedNote(id);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: SizeConfig.heightMultiplier, left: SizeConfig.widthMultiplier * 1.5, right: SizeConfig.widthMultiplier * 1.5),
        width: double.infinity,
        height: 15 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 3, right: SizeConfig.widthMultiplier * 3, top: SizeConfig.heightMultiplier, bottom: SizeConfig.heightMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xFF3C424A),
                      fontSize: SizeConfig.textMultiplier * 3,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(FormatDate.labelDateFormat(createDate),
                  style: TextStyle(
                    color: Color(0xFF3C424A),
                    fontSize: SizeConfig.textMultiplier * 1.6,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF3C424A),
                    fontSize: SizeConfig.textMultiplier * 2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
