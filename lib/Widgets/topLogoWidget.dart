import 'package:flutter/material.dart';

class TopLogoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(

          height: MediaQuery.of(context).size.height*0.06,
          width: MediaQuery.of(context).size.width*0.50,
          decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Color(4288880644), BlendMode.modulate),
                image: AssetImage('assets/images/app_logo.png',),
              )
          ),
        ),
      ),
    );
  }
}

