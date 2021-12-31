import 'package:app_igoal/Screens/Home/homeView.dart';
import 'package:app_igoal/Screens/Home/homeViewModel.dart';
import 'package:app_igoal/Screens/HomeMatches/homeMatchesViewModel.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool istExpanded = false;
bool istExpanded1 = false;

class HomeMatchesView extends StatefulWidget {
  @override
  _HomeMatchesViewState createState() => _HomeMatchesViewState();
}

class _HomeMatchesViewState extends State<HomeMatchesView> {

  //
  // bool isExpanded_1 = true;
  // bool isExpanded_2 = false;
  // bool isExpanded_3 = false;
  // bool isExpanded_4 = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeMatchesViewModel>(
        init: HomeMatchesViewModel(),
        builder:(viewModel){
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  HomeMatchesTopItem(context),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Colors.grey
                        color: Color(0xff1B1B1B),
                      ),
                      padding: EdgeInsets.only(top: 16, left: 20, right: 20,),
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
                            isSelected:viewModel.isTabSelected_2,
                            titleSize: 14,
                            onTap: () {
                              viewModel.onTab2Changed();
                            },
                          ),
                          CustomTabBarItem(
                            title: 'Players',
                            titleSize: 14,
                            isSelected: viewModel.isTabSelected_3,
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
                  if(viewModel.isTabSelected_2==true)Expanded(
                    child: ListView(
                      children: [

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey
                                  ),
                                ),
                                Text('Club',style: TextStyle(fontSize: 14,color: Colors.white),)
                              ],
                            ),
                            Column(
                              children: [
                                Text('4-3-2',style: TextStyle(fontSize: 14,color:Color(0xff5F5F5F)),),
                                Text('2-0',style: TextStyle(fontSize: 30,color: Colors.white),)
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey
                                  ),
                                ),
                                Text('Club',style: TextStyle(fontSize: 14,color: Colors.white),)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 38,),
                        Container(
                          child: Image.asset('assets/images/playersLoction.png',fit: BoxFit.cover,),
                        ),

                      ],
                    ),
                  ),
                  //
                  if(viewModel.isTabSelected_3==true)Expanded(
                    child: ListView(
                      children: [
                        //teamDetailItem(context),
                        playerDetailItem(context,viewModel),

                      ],
                    ),
                  ),
                  if(viewModel.isTabSelected_4==true)Expanded(
                    child: ListView(
                      children: [
                        teamDetailItem(context,viewModel),
                        // playerDetailItem(context),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          );
        });
  }

  Container HomeMatchesTopItem(BuildContext context) {
    return Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xff1B1B1B),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Club Barcelona',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Club Barcelona',
                        style: TextStyle(fontSize: 16, color: Color(0xff5F5F5F)),
                      )
                    ],
                  ),
                );
  }

  Container playerDetailItem(BuildContext context,HomeMatchesViewModel viewModel) {
    return Container(
                  height:(viewModel.isExpanded_2==false)? 125:231,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xff1B1B1B),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:20,top: 11,right: 20,bottom: 11),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                        ),

                                      ),
                                      SizedBox(width: 8,),
                                      Text('Barcelona',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Text('19',style: TextStyle(fontSize: 24,color: Colors.white),),
                                      //SizedBox(width: 8,),
                                      Spacer(),
                                      Text('Milandros',style: TextStyle(fontSize: 24,color: Colors.white),),
                                      Spacer(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),

                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,),
                        child: Divider(color: Colors.grey.shade800,),
                      ),
                      (viewModel.isExpanded_2==true)?
                      Expanded(
                        child: ListView(
                          children: [
                            playersDetailListItem(),
                            playersDetailListItem(),
                          ],
                        ),
                      ) :Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Show All',style: TextStyle(fontSize: 16,color: Color(0xffD41A1A)),),
                          InkWell(
                            splashColor:Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor:Colors.transparent,
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            onTap: (){

                              viewModel.onPlayersExpansionChanged();

                            },
                            child: Icon(
                                !viewModel.isExpanded_2
                                    ? Icons.keyboard_arrow_down_sharp
                                    : Icons.keyboard_arrow_up_sharp,
                                size: 30,
                                color: Color(0xffD7191D)),
                          ),

                        ],
                      ),

                    ],
                  ),

                );
  }

  Padding playersDetailListItem() {
    return Padding(
      padding: const EdgeInsets.only(left:20,top: 11,right: 20,bottom: 11),
                              child: Column(
                                children: [

                                  Row(
                                    children: [
                                      Expanded(child: Text('10',style: TextStyle(fontSize: 13,color: Colors.white),)),
                                      Text('Barcelona',style: TextStyle(fontSize: 13,color: Colors.white),),
                                      SizedBox(width: 8,),
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
                                ],
                              ),
                            );
  }

  Container teamDetailItem(BuildContext context,HomeMatchesViewModel viewModel) {
    return Container(
                  height: (viewModel.isExpanded_1==false)?50:239,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xff1B1B1B),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Saturday , September,2021',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                          ),
                          InkWell(
                            splashColor:Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor:Colors.transparent,
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            onTap: (){

                             viewModel.onTeamDetailsExpansionChanged();

                            },
                            child: Icon(
                                !viewModel.isExpanded_1
                                    ? Icons.keyboard_arrow_down_sharp
                                    : Icons.keyboard_arrow_up_sharp,
                                size: 30,
                                color: Color(0xffD7191D)),
                          ),

                        ],
                      ),
                      viewModel.isExpanded_1==true?Column(
                        children: [
                          SizedBox(height: 8,),
                          Divider(color: Colors.grey.shade800,),
                          teamDetail(context),
                          teamDetail(context),
                        ],
                      ):Container(),

                    ],
                  ),
                );
  }

  Container teamDetail(BuildContext context) {
    return Container(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff1B1B1B),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:8,bottom: 8,top: 6),
                        child: Container(
                          height: 15,
                          width: 15,
                          child: Image.asset('assets/images/bell.png'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Club',style: TextStyle(color: Colors.white,fontSize: 14),),
                          Container(
                            height: 40,
                            width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey
                          ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Stadium Berlin',style: TextStyle(fontSize:13,color:Color(0xff5F5F5F)),),
                              SizedBox(height: 2,),
                              Text('9:30',style: TextStyle(fontSize:24,color: Colors.white),),


                            ],
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey
                            ),
                          ),
                          Text('Club',style: TextStyle(color: Colors.white,fontSize: 14),),

                        ],
                      ),
                    ],
                  ),
                );
  }


  InkWell backBtn() {
    return InkWell(
        splashColor:Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor:Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 23.62,
              width: 13.5,
              child: Icon(
                Icons.navigate_before,
                color: Colors.white,
              )),
        ));
  }
}
