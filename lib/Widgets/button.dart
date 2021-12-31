import 'package:flutter/material.dart';

class iGoalButton extends StatelessWidget {
  final String title;
  final Color color;
  final String leftImage;
  final double cornerRadius;
  final VoidCallback onTap;

  iGoalButton(
      {this.title,
        this.color,
        this.leftImage,
        this.cornerRadius = 7,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        splashColor:Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor:Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: onTap,
        child: SizedBox(
          height: 53,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffd41a1a),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(child: Text(title??"", style: textStyle)),
          ),
        ),
      ),
    );
  }
}