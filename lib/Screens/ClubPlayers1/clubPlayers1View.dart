
import 'package:app_igoal/Screens/ClubPlayers1/clubPlayers1ViewModel.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ClubPlayers1View extends StatefulWidget {
  @override
  _ClubPlayers1ViewState createState() => _ClubPlayers1ViewState();
}

class _ClubPlayers1ViewState extends State<ClubPlayers1View> {

  //
  // bool isTabSelected_1 = false;
  // bool isTabSelected_2 = false;
  // bool isTabSelected_3 = true;
  // bool isTabSelected_4 = false;
  // bool isTabSelected_5 = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClubPlayers1ViewModel>(
        init: ClubPlayers1ViewModel(),
        builder:(viewModel){
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  videoPlayerItem(context,viewModel),
                  SizedBox(height: 16,),
                  ClubPlayer1MatchStatusItem(viewModel),
                  Padding(
                    padding: EdgeInsets.only(top: 16,),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Colors.grey
                        color: Color(0xff1B1B1B),
                      ),
                      padding: EdgeInsets.only(top: 16, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTabBarItem(
                            title: 'Score',
                            isSelected: viewModel.isTabSelected_1,
                            titleSize: 14,
                            onTap: () {
                              viewModel.onTab1Changed();
                            },
                          ),
                          CustomTabBarItem(
                            title: 'Field Plan',
                            isSelected: viewModel.isTabSelected_2,
                            titleSize: 14,
                            onTap: () {
                              viewModel.onTab2Changed();
                            },
                          ),
                          CustomTabBarItem(
                            title: 'Players',
                            titleSize: 14,
                            isSelected:viewModel.isTabSelected_3,
                            onTap: () {
                              viewModel.onTab3Changed();
                            },
                          ),
                          CustomTabBarItem(
                            title: 'Team Details',
                            titleSize: 14,
                            isSelected: viewModel.isTabSelected_4,
                            onTap: () {
                              viewModel.onTab4Changed();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 21,),
                  clubPlayer1HistoryItem(context,viewModel),
                  SizedBox(height: 10,),
                  // Expanded(
                  //   child: Container(
                  //     child: ListView(
                  //       children: [
                  //         clubPlayerItem(context,viewModel),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          );
        });
  }

  Column clubPlayer1HistoryItem(BuildContext context,ClubPlayers1ViewModel viewModel) {
    return Column(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    Text('Player History',style: TextStyle(fontSize: 24,color: Colors.white),),
                    SizedBox(height: 4,),
                    Text('Barcelona',style: TextStyle(fontSize: 16,color: Color(0xff5F5F5F)),),
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width-40,
                          lineHeight: 34.0,
                          percent: 0.21,
                          //linearStrokeCap: LinearStrokeCap.butt,
                          backgroundColor: Color(0xff625510),
                          progressColor: Color(0xff1B1B1B)
                      ),
                    )
                  ],
                );
  }

  Row ClubPlayer1MatchStatusItem(ClubPlayers1ViewModel viewModel) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    playerImageItem(viewModel),
                    Text('2 - 0',style: TextStyle(fontSize: 36,color: Colors.white),),
                    playerImageItem(viewModel),

                  ],
                );
  }

  Container clubPlayerItem(BuildContext context,ClubPlayers1ViewModel viewModel) {
    return Container(
            height: 145,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff1B1B1B),
              borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.only(left: 22,right: 22),
            child: Column(
              children: [
                SizedBox(height: 15,),
               clubPlayerListItem(viewModel),
                clubPlayerListItem(viewModel),
                clubPlayerListItem(viewModel),
                SizedBox(height: 15,),

              ],
            ),
          );
  }

  Widget clubPlayerListItem(ClubPlayers1ViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 7,bottom: 7),
      child: Column(
                   children: [
                     Row(
                       //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text('183',style: TextStyle(fontSize: 14,color: Colors.white),),
                         Spacer(),
                         Text('Messi',style: TextStyle(fontSize: 14,color: Colors.white),),
                         Spacer(),
                         Text('183',style: TextStyle(fontSize: 14,color: Color(0xffD41A1A)),),
                       ],
                     ),
                     SizedBox(height: 8,),
                     Divider(color: Colors.grey.shade800,),
                   ],
                 ),
    );
  }

  Container playerImageItem(ClubPlayers1ViewModel viewModel) {
    return Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
            );
  }


  Container videoPlayerItem(BuildContext context,ClubPlayers1ViewModel viewModel) {
    return Container(
      height: 190,
      color: Color(0xffC4C4C4),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.play_circle_outline_sharp,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }
}
