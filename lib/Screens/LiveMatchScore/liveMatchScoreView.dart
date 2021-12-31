import 'package:app_igoal/Screens/LiveMatchScore/liveMatchScoreViewModel.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:app_igoal/Widgets/topLogoWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveMatchScoreView extends StatefulWidget {
  @override
  _LiveMatchScoreViewState createState() => _LiveMatchScoreViewState();
}

class _LiveMatchScoreViewState extends State<LiveMatchScoreView> {

  //
  // bool isTabSelected_1 = false;
  // bool isTabSelected_2 = false;
  // bool isTabSelected_3 = true;
  // bool isTabSelected_4 = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveMatchesScoreViewModel>(
        init: LiveMatchesScoreViewModel(),
        builder:(viewModel){
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 8,),
                    backBtn(),
                    Expanded(child: TopLogoItem()),
                  ],
                ),
                LiveMatchesScoreItem(context,viewModel),
                LiveMatchesComentryItem(viewModel),
                LiveMatchsItem(context,viewModel),
                LiveMatchDetailItem(context,viewModel),

              ],
            ),
          ),
        ),
      );
    });
  }

  Container LiveMatchDetailItem(BuildContext context,LiveMatchesScoreViewModel viewModel) {
    return Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff1B1B1B),
                    borderRadius: BorderRadius.circular(20)
                ),
                padding: EdgeInsets.only(left:20,right: 20,top: 17 ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('End 90 minutes',style:TextStyle(fontSize: 16,color: Colors.white),),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('2 -4',style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Divider(color: Colors.grey.shade800,),
                    Row(
                      children: [
                        SizedBox(width: 16,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Text('90 +4',style: TextStyle(fontSize: 13,color: Color(0xffD41A1A)),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Text('90 +4',style: TextStyle(fontSize: 13,color: Color(0xffD41A1A)),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Text('90 +4',style: TextStyle(fontSize: 13,color: Color(0xffD41A1A)),),
                            ],
                          ),
                        ),
                        SizedBox(width: 16,),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('Joseph',style: TextStyle(fontSize: 14,color: Colors.white),),
                                        SizedBox(height: 4,),
                                        Text('Joseph',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 27,
                                      width: 27,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('Joseph',style: TextStyle(fontSize: 14,color: Colors.white),),
                                        Text('Joseph',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 27,
                                      width: 27,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('Joseph',style: TextStyle(fontSize: 14,color: Colors.white),),
                                        Text('Joseph',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 27,
                                      width: 27,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:20,right: 20,top: 17 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Half Time     ',style:TextStyle(fontSize: 16,color: Colors.white),),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('2 -4',style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    Divider(color: Colors.grey.shade800,),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 16,),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('Joseph',style: TextStyle(fontSize: 14,color: Colors.white),),
                                        SizedBox(height: 4,),
                                        Text('Joseph',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Text('32',style: TextStyle(fontSize: 13,color: Colors.white),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset('assets/images/timer.png',height: 20,width: 20,)
                            ],
                          ),
                        ),
                        SizedBox(width: 60,),


                      ],
                    ),
                  ],
                ),
              );
  }

  Padding LiveMatchesComentryItem(LiveMatchesScoreViewModel viewModel) {
    return Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 2,bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTabBarItem(
                      title: 'Header 1',
                      isSelected:viewModel.isTabSelected_1,
                      titleSize: 14,
                      onTap: (){
                       viewModel.onTab1Selected();
                      },
                    ),
                    CustomTabBarItem(
                      title: 'Header 2',
                      titleSize: 14,
                      isSelected:viewModel.isTabSelected_2,
                      onTap: (){
                        viewModel.onTab2Selected();
                      },
                    ),
                    CustomTabBarItem(
                      title: 'Header 3',
                      titleSize: 14,
                      isSelected:viewModel.isTabSelected_3,
                      onTap: (){
                        viewModel.onTab3Selected();
                      },
                    ),
                    CustomTabBarItem(
                      title: 'Header 4',
                      titleSize: 14,
                      isSelected:viewModel.isTabSelected_4,
                      onTap: (){
                        viewModel.onTab4Selected();
                      },
                    ),
                  ],
                ),
              );
  }

  Padding LiveMatchesScoreItem(BuildContext context,LiveMatchesScoreViewModel viewModel) {
    return Padding(
                padding: const EdgeInsets.only(bottom: 12,top:8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff1F1F1F),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [

                      Container(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(height: 4,),
                            Container(
                              child :Image.asset('assets/images/image_1.png', width: 30, height: 30,),
                            ),
                            SizedBox(height: 6,),
                            Text('LaLiga Logo Text',style: TextStyle(fontSize: 14,color: Colors.yellow),)

                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.18,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 4,),
                                  Container(
                                    child :Image.asset('assets/images/image_1.png', width:49, height: 74,),
                                  ),
                                  SizedBox(height: 2,),
                                  Text('Team 1',style: TextStyle(fontSize: 14,color: Colors.white),),

                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Container(
                                      width: 37,
                                      height:42,
                                      child: Center(
                                        child: Text('2',style: TextStyle(fontSize: 14,color: Colors.white),),
                                      ),
                                      decoration: BoxDecoration(

                                        color: Color(0xff1F1F1F),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Color(0xff1F1F1F),
                                        child: Image.asset('assets/images/dotIcon.png',height: 19,width: 4,),
                                      ),
                                    ),
                                    Container(
                                      width: 37,
                                      height:42,

                                      decoration: BoxDecoration(
                                        color: Color(0xff1F1F1F),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text('2',style: TextStyle(fontSize: 14,color: Colors.white),),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Image.asset('assets/images/groupTime.png',height: 27,width: 58,),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 4,),
                                  Container(
                                    child :Image.asset('assets/images/image_1.png', width:49, height: 74,),
                                  ),
                                  SizedBox(height: 2,),
                                  Text('Team 2',style: TextStyle(fontSize: 14,color: Colors.white),),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }


  Widget liveMatchesCommentryItem(String icon,LiveMatchesScoreViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8,left: 20,right: 20),
      child: Row(
        children: [
          Expanded(
              child: Text(
                'Mario Martin',
                style: TextStyle(fontSize: 13, color: Color(0xff5F5F5F)),
              )),
          Text(
            'Jahid jaykar',
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
          SizedBox(
            width: 4,
          ),
          Image.asset(
            icon,
            height: 15,
            width: 15,
          )
        ],
      ),
    );
  }


  Padding LiveMatchsItem(BuildContext context,LiveMatchesScoreViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: 83,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff1B1B1B)),
        padding: EdgeInsets.only(top:6,bottom: 6 ),
        child: Column(
          children: [
            liveMatchesCommentryItem('assets/images/mic.png',viewModel),
            liveMatchesCommentryItem('assets/images/livenewsIcon.png',viewModel),
          ],
        ),
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
        onTap: (){

          Navigator.pop(context);
        },
        child: Container(
            height:23.62,
            width: 13.5,
            child: Icon(Icons.navigate_before,color: Colors.white,)));
  }
}
