
import 'package:app_igoal/helpers/importFiles.dart';

import 'package:app_igoal/helpers/validators.dart';
import 'package:flutter/cupertino.dart';
class IOSDateTimePicker extends StatelessWidget {
  final String title;
  IOSDateTimePicker({this.title = 'Date Of Birth'});

  String selectedDateTime = DateTime.now().toDateString(dateFormat: 'MMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 45,
            decoration: BoxDecoration(
                color: Color(0xffebedf0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                )),
            child: Center(child: Text(this.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),),),
          ),
          Container(
            height: 150,
            color:  Theme.of(context).scaffoldBackgroundColor,
            child: CupertinoDatePicker(
              backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDate) {
                selectedDateTime = newDate.toDateString(dateFormat: 'MMM dd, yyyy');
              },
              use24hFormat: true,
              minimumYear: 1900,
              maximumYear: 2050,
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          Divider(color: Colors.grey),
          Container(
            height: 45,
            decoration: BoxDecoration(
                color:  Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                )
            ),
            child: Row(
              children: <Widget>[
                Expanded(child: InkWell(splashColor:Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor:Colors.transparent,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),onTap: () => Navigator.pop(context),child: Container(color: Colors.transparent, child: Center(child: Text('Cancel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),)))),
                VerticalDivider(color: Colors.grey,),
                Expanded(child: InkWell(splashColor:Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor:Colors.transparent,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),onTap: () => Navigator.pop(context, selectedDateTime), child: Container(color: Colors.transparent, child: Center(child: Text('Done', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),),))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}