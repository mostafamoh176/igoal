import 'package:flutter/material.dart';

class ValidationModel{
  final String value;
  final String error;
  ValidationModel({@required this.value, @required this.error});
}

enum ViewState{Idle, Busy}

abstract class LoaderState{
  ViewState _state = ViewState.Idle;
  ViewState get viewState => _state;
  void setSate(ViewState state);
}

class ResponseErrorHandler{
  final bool hasError;
  final String errorMessage;
  ResponseErrorHandler({this.hasError, this.errorMessage});
}