
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTabBarItem extends StatelessWidget {
  final String title;
  double titleSize;
  final String image;
  final bool isSelected;
  final Function onTap;
  CustomTabBarItem({this.title, this.image, this.isSelected, this.titleSize,this.onTap});
  @override
  Widget build(BuildContext context) {
    return image != null ? InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Stack(
        children: [
          Container(

            height: 35,
            width: 30,
            margin: EdgeInsets.only(bottom: 12),
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(image),
            //
            //     )
            // ),
            child: SvgPicture.asset(image,color: Theme.of(context).buttonColor,),
          ),
          isSelected ? Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                width: 35,
                decoration: BoxDecoration(
                    color: Color(0xffD7191D),
                    borderRadius: BorderRadius.circular(5)
                ),)
          ) : Container()
        ],
      ),
    ) : InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Stack(
        children: [
          Container(

            width: 95,
            //margin: EdgeInsets.only(bottom: 12),
              child: isSelected?Text(title,
                  style:   Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center ,
              ):Text(title,
                  style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center ,
              ),
            padding: EdgeInsets.only(bottom: 10),
          ),

          isSelected ? Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                    color: Color(0xffD7191D),
                    borderRadius: BorderRadius.circular(5)
                ),)
          ) : Container()
        ],
      ),
    );
  }
}


class CustomNewTabBarItem extends StatelessWidget {
  final String title;
  double titleSize;
  final String image;
  final bool isSelected;
  final Function onTap;
  CustomNewTabBarItem({this.title, this.image, this.isSelected, this.titleSize,this.onTap});
  @override
  Widget build(BuildContext context) {
    return image != null ? InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 25,
            width: 25,
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                )
            ),
          ),
          isSelected ? Positioned(
              bottom: 0,
              left: 16,
              right: 0,
              child: Container(
                height: 4,
                width: 35,
                decoration: BoxDecoration(
                    color: Color(0xffD7191D),
                    borderRadius: BorderRadius.circular(5)
                ),)
          ) : Container()
        ],
      ),
    ) : InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
              //margin: EdgeInsets.only(bottom: 12),
              child: Center(
                child: isSelected?Text(title,
                    style: Theme.of(context).textTheme.headline6,
                ):Text(title,
                    style: Theme.of(context).textTheme.headline6,
                ),
              )
          ),
          isSelected ? Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                    color: Color(0xffD7191D),
                    borderRadius: BorderRadius.circular(5)
                ),)
          ) : Container()
        ],
      ),
    );
  }
}