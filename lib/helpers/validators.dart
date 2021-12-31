import 'package:intl/intl.dart';

class ValidatorType {
  static final RegExp email = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp password = RegExp(r'^(?=.*)(.){8,15}$’');
  static final RegExp phoneNumber = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
}

extension DateTimeExtension on DateTime{
  String toDateString({String dateFormat = 'MMM dd, yyyy hh:mm a'}){
    DateFormat _dateFormat = DateFormat(dateFormat);
    return _dateFormat.format(this);
  }
}