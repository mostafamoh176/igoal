


import 'package:app_igoal/Screens/Players/playersViewModel.dart';
import 'package:app_igoal/Widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayersView extends StatefulWidget {
  @override
  _PlayersViewState createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayersViewModel>(
        init: PlayersViewModel(),
        builder:(viewModel){
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xff262626),
              body: Column(
                children: [
                  SizedBox(height: 54,),
                  playerBasicInfo(context,viewModel),
                  SizedBox(height: 20,),
                  btnCallToAction(),
                  SizedBox(height: 8,),
                  Expanded(
                    child: ListView(
                      children: [
                        playerDetailItem(context,viewModel),
                        playerDetailItem(context,viewModel),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }

  Container playerBasicInfo(BuildContext context,PlayersViewModel viewModel) {
    return Container(
            height: 157,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff1B1B1B),
              borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.only(left: 25,right: 20,),
            child: Row(
              children: [
                playerImageItem(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 17,),
                      playerInfoItem(title: 'name',value: 'john'),
                      playerInfoItem(title: 'email',value:' john@gmail.com'),
                      playerInfoItem(title: 'country',value: 'Pakistan'),
                      SizedBox(height: 17,),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Widget playerDetailItem(BuildContext context,PlayersViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9,top: 9),
      child: Container(
              height: 271,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xff1B1B1B),
                  borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.only(left: 21,right: 21,top: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('7',style: TextStyle(fontSize: 16,color: Colors.white),)),
                      Text('Martin',style: TextStyle(fontSize: 16,color: Colors.white),),
                      SizedBox(width: 40,),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Divider(color: Colors.grey.shade800,),
                  SizedBox(height: 8,),
                   playerTenureInfo(playerName: 'Messi'),
                   playerTenureInfo(playerName: 'Martin'),
                ],
              ),
            ),
    );
  }

  Widget playerTenureInfo({String playerName,PlayersViewModel viewModel}) {
    return Padding(
      padding: const EdgeInsets.only(top: 9,bottom: 9),
      child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text('(7) $playerName',style: TextStyle(fontSize: 16,color: Colors.white),),
                       ],
                     ),
                     SizedBox(height: 4,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),
                         SizedBox(width: 14,),
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),
                         SizedBox(width: 14,),
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),
                       ],
                     ),
                     SizedBox(height: 4,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),
                         SizedBox(width: 14,),
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),
                         SizedBox(width: 14,),
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),

                       ],
                     ),
                     SizedBox(height: 4,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),
                         SizedBox(width: 14,),
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),
                         SizedBox(width: 14,),
                         Text('1998/1999',style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),),

                       ],
                     ),
                     SizedBox(height: 4,),
                   ],
                 ),
    );
  }

  Padding playerInfoItem({String title,String value,PlayersViewModel viewModel}) {
    return Padding(
                        padding: const EdgeInsets.only(bottom: 8,top: 8),
                        child: Container(
                          height: 25,
                          width: 200,
                          color: Color(0xff262626),
                        child: Row(
                          children: [
                            SizedBox(width: 17,),
                            Expanded(child: Text(value,style: TextStyle(fontSize: 14,color: Colors.white),)),
                            Text(title,style: TextStyle(fontSize: 14,color: Color(0xffD41A1A)),),
                            SizedBox(width: 8,),
                            Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width:5,
                                    color: Color(0xffD41A1A),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ),
                      );
  }

  Container playerImageItem() {
    return Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                  ),
                );
  }

  Widget btnCallToAction(){
    return iGoalButton(
      title: "Call To Action",
      onTap: (){

      },
    );
  }
}
