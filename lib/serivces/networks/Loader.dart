import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color:  Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadiusDirectional.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Color(0xffD62B14)),
              // ),
              child: Center(
                child: Image.asset('assets/images/LoaderIcon.png'),
              ),
            ),
          )

        ],
      ),
    );
  }
}