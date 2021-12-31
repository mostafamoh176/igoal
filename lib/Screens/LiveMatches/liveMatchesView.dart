import 'package:app_igoal/Screens/LiveMatches/liveMatchesViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveMatchesView extends StatefulWidget {
  @override
  _LiveMatchesViewState createState() => _LiveMatchesViewState();
}

class _LiveMatchesViewState extends State<LiveMatchesView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveMatchesViewModel>(
        init: LiveMatchesViewModel(),
        builder:(viewModel){
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    videoPlayerItem(context,viewModel),
                    LiveMatchsItem(context,viewModel),
                    liveMatchDetailItem(context,viewModel),
                    SizedBox(height: 24,),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Container liveMatchDetailItem(BuildContext context,LiveMatchesViewModel viewModel) {
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

  Padding LiveMatchsItem(BuildContext context,LiveMatchesViewModel viewModel) {
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

  Widget liveMatchesCommentryItem(String icon,LiveMatchesViewModel viewModel) {
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

  Container videoPlayerItem(BuildContext context,LiveMatchesViewModel viewModel) {
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
