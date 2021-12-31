import 'package:app_igoal/Widgets/NetworkImage/NetworkImage.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Models/TeamLineUp_Response.dart';

class Player extends StatelessWidget {
  final Alignment alignment;
  final String image, name;
  final Cards cardsData;
  final int playerNumber;
  final double playerRating;

  const Player(
      {this.alignment = Alignment.center,
      this.image,
      this.name,
      this.cardsData,
      this.playerNumber,
      this.playerRating});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: 47,
                width: 47,
                margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
                child: ClipOval(
                    child: Container(
                        color: Colors.white,
                        child: appNetworkImage(image, BoxFit.cover))),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle),
                  child: Text(
                    playerNumber.toString(),
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: cardsData.redcards > 0 || cardsData.yellowcards > 0
                      ? card(
                          cardColor: cardsData.redcards > 0
                              ? Colors.red
                              : cardsData.yellowcards > 0
                                  ? Colors.amberAccent
                                  : Colors.transparent)
                      : SizedBox.shrink()),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.rectangle),
                  child: Text(
                    playerRating.toString(),
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            ),
          )
        ],
      ),
    );
  }
}

Widget card({@required Color cardColor}) {
  if (cardColor == Colors.red || cardColor == Colors.amberAccent) {
    return Container(
      width: 15,
      height: 17,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            width: 0.5,
            color: Colors.black,
          ),
          color: Colors.white),
      child: SvgPicture.asset(
        'assets/images/card.svg',
        color: cardColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 2),
    );
  } else {
    return SizedBox.shrink();
  }
}
