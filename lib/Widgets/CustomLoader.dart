import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/loader.gif",
      width: 42,
      height: 42,
      fit: BoxFit.contain,
    );
  }
}
