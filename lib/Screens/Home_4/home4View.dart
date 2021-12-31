import 'package:app_igoal/Screens/ClubPlayers/clubPlayersView.dart';
import 'package:app_igoal/Screens/HomeScreen/homeScreenModel.dart';
import 'package:app_igoal/Screens/HomeScreen/homeScreenView.dart';
import 'package:app_igoal/Screens/Home_4/home4ViewModel.dart';
import 'package:app_igoal/Screens/leagueInfo/leagueInfoView.dart';
import 'package:app_igoal/Screens/playerInfo/playerInfoView.dart';
import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:app_igoal/Widgets/topLogoWidget.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/Loader.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:flutter_html/flutter_html.dart';
import 'dart:math';
import 'TeamLineUpScreen.dart';

class Home4View extends StatefulWidget {
  MyInAppBrowser get browser => new MyInAppBrowser();
  String id;
  String seasonid;
  String matchStatus;
  Home4View({
    this.id,
    this.seasonid,
    this.matchStatus,
  });
  @override
  _Home4ViewState createState() => _Home4ViewState();
}

class _Home4ViewState extends State<Home4View> {
  var indexLocal = 0;
  double progress = 0;
  String url = "";
  //
  var options = InAppBrowserClassOptions(
    crossPlatform: InAppBrowserOptions(hideUrlBar: false),
    inAppWebViewGroupOptions: InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true, javaScriptEnabled: true),
    ),
  );
  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double initialoffSet = MediaQuery.of(context).size.width;
    ScrollController _controller =
        ScrollController(initialScrollOffset: initialoffSet);

    return GetBuilder<Home4ViewModel>(
        // dispose:(_)=> Get.find<Home4ViewModel>(),
        init: Home4ViewModel(
            id: widget.id,
            seasonId: widget.seasonid,
            matchStatus: widget.matchStatus),
        builder: (viewModel) {
          if (viewModel.viewState == ViewState.Idle)
            return Container(
              // decoration: BoxDecoration(
              //     color:Color(0xFF000000),
              //     borderRadius: BorderRadius.circular(5)
              // ),
              color: (ThemeService().theme.toString() == "ThemeMode.dark")
                  ? Colors.black
                  : Colors.white,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    // expandedHeight: 230,
                    backgroundColor:
              (ThemeService().theme.toString() == "ThemeMode.dark")
                ? Theme.of(context).secondaryHeaderColor
                : Colors.white,
                        // (ThemeService().theme.toString() == "ThemeMode.dark")
                        //     ? Colors.black
                        //     : Colors.white,
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.black),
                    leading: IconButton(
                      onPressed: () {
                        Get.reset();
                        Get.back();
                      },
                      icon: Icon(Icons.navigate_before),
                      color: Theme.of(context).buttonColor,
                    ),
                    floating: false,
                    title: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Color(4288880644), BlendMode.modulate),
                            image: AssetImage(
                              'assets/images/app_logo.png',
                            ),
                          )),
                        ),
                      ),
                    ),
                    pinned: true,
                    // flexibleSpace: FlexibleSpaceBar(
                    //   background: TopLogoItem(),
                    // ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      Material(
                        color: (ThemeService().theme.toString() ==
                                "ThemeMode.dark")
                            ? Colors.black
                            : Colors.white,
                        child: topMatchItem(
                            context, viewModel.currentMatchData, viewModel),
                      ),
                      Material(
                        color: (ThemeService().theme.toString() ==
                                "ThemeMode.dark")
                            ? Colors.black
                            : Colors.white,
                        child: Padding(
                            padding:
                                EdgeInsets.only(bottom: 5, right: 0, left: 0),
                            child: tabBar(viewModel, _controller)),
                      ),
                      Material(
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(18.0),
                        //   side: BorderSide(color: Theme.of(context).primaryColor),
                        // ),
                        color: (ThemeService().theme.toString() ==
                                "ThemeMode.dark")
                            ? Colors.black
                            : Colors.white,
                        child: listBar(viewModel, _controller, size),
                      ),
                    ]),
                  ),
                ],
              ),
            );
          else
            return (viewModel.viewState == ViewState.Busy
                ? Positioned.fill(child: Loading())
                : Container());
        });
  }

  Widget tabBar(Home4ViewModel viewModel, ScrollController _controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: [
              // SizedBox(
              //   width: 20,
              // ),
              CustomTabBarItem(
                title: 'فيديو',
                isSelected: viewModel.isTabSelected_1,
                titleSize: 16,
                onTap: () {
                  viewModel.onTab1Selected();
                  print(ThemeService().theme);
                },
              ),
              // SizedBox(
              //   width: 40,
              // ),
              CustomTabBarItem(
                title: 'إحصائيات',
                isSelected: viewModel.isTabSelected_2,
                titleSize: 16,
                onTap: () {
                  viewModel.onTab2Selected();
                },
              ),
              // SizedBox(
              //   width: 40,
              // ),
              // CustomTabBarItem(
              //     title: 'خطة',
              //     titleSize: 16,
              //     isSelected: viewModel.isTabSelected_3,
              //     onTap: () {
              //       viewModel.onTab3Selected();
              //     }),
              // SizedBox(
              //   width: 40,
              // ),
              CustomTabBarItem(
                  title: 'لقاءات',
                  titleSize: 16,
                  isSelected: viewModel.isTabSelected_4,
                  onTap: () {
                    viewModel.onTab4Selected();
                  }),
              // SizedBox(
              //   width: 40,
              // ),
              CustomTabBarItem(
                  title: 'الترتيب',
                  titleSize: 16,
                  isSelected: viewModel.isTabSelected_5,
                  onTap: () {
                    viewModel.onTab5Selected();
                  }),
              // SizedBox(
              //   width: 40,
              // ),
              CustomTabBarItem(
                title: 'التفاصيل',
                titleSize: 16,
                isSelected: viewModel.isTabSelected_6,
                onTap: () {
                  viewModel.onTab6selected();
                },
              ),
              // SizedBox(
              //   width: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listBar(
      Home4ViewModel viewModel, ScrollController _controller, Size size) {
    List<dynamic> attjson = viewModel.dataMatch['events']['data'];
    attjson.reversed;

    Iterable<dynamic> penshot = attjson.where((element) =>
        (element['type'].toString() == 'pen_shootout_miss' ||
            element['type'].toString() == 'pen_shootout_goal'));

    //  attjson.remove(attjson.where((element) => (element['type'].toString() == 'pen_shootout_miss' ||
    //     element['type'].toString() == 'pen_shootout_goal')));
    print(penshot);
    // if(viewModel.dataMatch['scores']['ht_score']!='null')
    // attjson.add(attjson[0]);
    return Container(
      decoration: BoxDecoration(
     color: (ThemeService().theme.toString() == "ThemeMode.dark")
        ? Color(0xff262626) //Theme.of(context).secondaryHeaderColor
        : Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          if (viewModel.isTabSelected_5 == true)
            (viewModel.seasonList.length > 0)
                ? Tab5(viewModel, _controller, size)
                : Column(),
          if (viewModel.isTabSelected_6 == true)
            for (var att in penshot)
              if (penshot.length > 0) events(viewModel, att, attjson),

          if (viewModel.isTabSelected_6 == true)
            for (var att in attjson.reversed)
              (attjson.length > 0)
                  ? Tab6(viewModel, _controller, attjson, att)
                  : Container(),

          if (attjson.length > 0 && viewModel.isTabSelected_6 == true)
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 35,
                    width: 35,
                    // color:Colors.grey,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          // color: Colors.grey,
                          child: Image.asset(
                            'assets/images/wall-clock.png',
                            color: (ThemeService().theme.toString() ==
                                    "ThemeMode.dark")
                                ? Colors.white
                                : Colors.black,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (viewModel.isTabSelected_2 == true)
            (viewModel.dataMatch['stats'] != null &&
                    viewModel.dataMatch['stats']['data'].length > 0)
                ? Tab2(viewModel, _controller, size)
                : Container(),
          if (viewModel.isTabSelected_3 == true &&
              viewModel.teamLineUpResponse != null)
            Tab3(viewModel, _controller, size),
          if (viewModel.isTabSelected_1 == true)
            for (var i in viewModel.dataMatch['highlights']['data'])
              Tab1(viewModel, _controller, size, i),
          // if (viewModel.isTabSelected_1 == true)
          // Tab1GestureDetector(viewModel),
          if (viewModel.isTabSelected_4 == true)
            (viewModel.finalYearData != null)
                ? Tab4(viewModel, _controller, size)
                : Container(),
        ],
      ),
    );
  }

  Widget Tab4(
      Home4ViewModel viewModel, ScrollController _controller, Size size) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left
          print("left");
          viewModel.onTab2Selected();
        } else if (details.primaryVelocity < 0) {
          // User swiped Right
          print("right");
          viewModel.onTab5Selected();
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        // height:(viewModel.itemlength*125)+(viewModel.finalYearData.length*15).toDouble(),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            // physics: NeverScrollableScrollPhysics(),

            itemCount: viewModel.finalYearData.length,
            itemBuilder: (BuildContext context, int index) {
              return teamDetailsItem(
                  context, viewModel.finalYearData[index], viewModel, index);
            }),
      ),
    );
  }

  Widget Tab1GestureDetector(Home4ViewModel viewModel) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left
          print("left");
        } else if (details.primaryVelocity < 0) {
          // User swiped Right
          print("right");
          viewModel.onTab2Selected();
        }
      },
      child: Container(
        color: (ThemeService().theme.toString() == "ThemeMode.dark")
            ? Colors.black
            : Colors.white,
        // height: height,
        height: MediaQuery.of(context).size.height * 1,
        child: Stack(
          children: [
            Opacity(
              opacity: viewModel.progress == 1.0 ? 1 : 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Container(),
              ),
            ),
            viewModel.progress == 1.0
                ? Center(
                    child: Container(),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }

  Widget Tab1(Home4ViewModel viewModel, ScrollController _controller, Size size,
      var i) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left
          print("left");
          viewModel.onTab1Selected();
        } else if (details.primaryVelocity < 0) {
          // User swiped Right
          print("right");
          viewModel.onTab2Selected();
        }
      },
      child: Container(
        // color: (ThemeService().theme.toString() == "ThemeMode.dark")? Colors.red: Colors.black,
        child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            widget.browser.openUrlRequest(
                urlRequest: URLRequest(url: Uri.parse(i['location'])),
                options: options);
          },
          child: Html(
            data:
                "<video id=video src=${i['location']}  type=video/mp4 style=\"pointer-events:none;\"></video>",
          ),
        ),
      ),
    );
  }

  Widget Tab3(
      Home4ViewModel viewModel, ScrollController _controller, Size size) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          _controller.jumpTo(_controller.position.minScrollExtent);
          viewModel.onTab2Selected();
        } else if (details.primaryVelocity < 0) {
          _controller.jumpTo(_controller.position.maxScrollExtent);
          viewModel.onTab4Selected();
        }
      },
      child: viewModel.teamLineUpResponse == null && viewModel.isLoading
          ? Padding(
              padding: EdgeInsets.only(top: size.height * 0.2),
              child: Center(child: CustomLoader()),
            )
          : SizedBox(
              height: size.height * 0.7,
              child: (viewModel.teamLineUpResponse != null)
                  ? TeamLineUpScreen(response: viewModel.teamLineUpResponse)
                  : Container(),
            ),
    );
  }

  Widget Tab2(
      Home4ViewModel viewModel, ScrollController _controller, Size size) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Lef
          print("left");
          viewModel.onTab1Selected();
        } else if (details.primaryVelocity < 0) {
          // User swiped Rig
          print("right");
          viewModel.onTab4Selected();
        }
      },
      child: Container(
        // color: (ThemeService().theme.toString() == "ThemeMode.dark")
        //                ?  Theme.of(context).secondaryHeaderColor
        //                : Colors.grey,
        height: (((50 * 19).toDouble() + 90) +
                ((50 * 5) + 100) +
                (50 * 2) +
                24.toDouble()) +
            8,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          children: [
            (viewModel.dataMatch['stats'] != null &&
                    viewModel.dataMatch['stats']['data'].length > 0)
                ? clubPlayer1HistoryItem(context, viewModel)
                : Container(),
            (viewModel.dataMatch['stats'] != null &&
                    viewModel.dataMatch['stats']['data'].length > 0)
                ? clubPlayerItem(context, viewModel) //clubPlayerItems()
                : Container(),
            // SizedBox(
            //   height: 8,
            // ),
            Container(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Center(
                    child: Text(
                  ' التسديدات ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Circular",
                    fontWeight: FontWeight.w500,
                  ),
                  // style: Theme.of(context).primaryTextTheme.headline6,
                ))),
            Container(
              // height: 200,
              height: (50) * 5.toDouble(),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: (ThemeService().theme.toString() == "ThemeMode.dark")
                      ? Color(0xff1B1B1B) //Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.only(left: 22, right: 22),
              child: Column(
                children: [
                  Container(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (viewModel.dataMatch['stats']['data'][0]['shots']
                                        ['ongoal'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][0]
                                            ['shots']['ongoal']
                                        .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  )
                                : Text(
                                    "0",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  ),
                            Spacer(),
                            Text(
                              'التسديدات على المرمى',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Spacer(),
                            (viewModel.dataMatch['stats']['data'][1]['shots']
                                        ['ongoal'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][1]
                                            ['shots']['ongoal']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  )
                                : Text("0",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffD41A1A))),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (viewModel.dataMatch['stats']['data'][0]
                                        ['goal_kick'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][0]
                                            ['goal_kick']
                                        .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  )
                                : Text(
                                    "0",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  ),
                            Spacer(),
                            Text(
                              'التسديد خارج المرمى',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Spacer(),
                            (viewModel.dataMatch['stats']['data'][1]
                                        ['goal_kick'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][1]
                                            ['goal_kick']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  )
                                : Text("0",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffD41A1A))),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (viewModel.dataMatch['stats']['data'][0]['shots']
                                        ['blocked'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][0]
                                            ['shots']['blocked']
                                        .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  )
                                : Text(
                                    "0",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  ),
                            Spacer(),
                            Text(
                              'التسديد تم صدها',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Spacer(),
                            (viewModel.dataMatch['stats']['data'][1]['shots']
                                        ['blocked'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][1]
                                            ['shots']['blocked']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  )
                                : Text("0",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffD41A1A))),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (viewModel.dataMatch['stats']['data'][0]['shots']
                                        ['insidebox'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][0]
                                            ['shots']['insidebox']
                                        .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  )
                                : Text(
                                    "0",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  ),
                            Spacer(),
                            Text(
                              'التسديد داخل منطقة الجزاء',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Spacer(),
                            (viewModel.dataMatch['stats']['data'][1]['shots']
                                        ['insidebox'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][1]
                                            ['shots']['insidebox']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  )
                                : Text("0",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffD41A1A))),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (viewModel.dataMatch['stats']['data'][0]['shots']
                                        ['outsidebox'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][0]
                                            ['shots']['outsidebox']
                                        .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  )
                                : Text(
                                    "0",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  ),
                            Spacer(),
                            Text(
                              'التسديد خارج منطقة الجزاء',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Spacer(),
                            (viewModel.dataMatch['stats']['data'][1]['shots']
                                        ['outsidebox'] !=
                                    null)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][1]
                                            ['shots']['outsidebox']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  )
                                : Text("0",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffD41A1A))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Center(
                    child: Text(
                  'التمريرات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Circular",
                    fontWeight: FontWeight.w500,
                  ),
                  // style: Theme.of(context).primaryTextTheme.headline6,
                ))),
            Container(
              // height: 200,
              height: (47) * 2.toDouble(),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: (ThemeService().theme.toString() == "ThemeMode.dark")
                      ? Color(0xff1B1B1B)// Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.only(left: 22, right: 22),
              child: Column(
                children: [
                  Container(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 50,
                    child: Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (viewModel.dataMatch['stats']['data'][0]
                                            ['passes'] !=
                                        null &&
                                    viewModel
                                            .dataMatch['stats']['data'][0]
                                                ['passes']
                                            .length >
                                        0)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][0]
                                            ['passes']['accurate']
                                        .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  )
                                : Text(
                                    "0",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  ),
                            Spacer(),
                            Text(
                              'التمريرات الدقيقة',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Spacer(),
                            (viewModel.dataMatch['stats']['data'][1]
                                            ['passes'] !=
                                        null &&
                                    viewModel
                                            .dataMatch['stats']['data'][1]
                                                ['passes']
                                            .length >
                                        0)
                                ? Text(
                                    viewModel.dataMatch['stats']['data'][1]
                                            ['passes']['accurate']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  )
                                : Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (viewModel.dataMatch['stats']['data'][0]
                                            ['passes'] !=
                                        null &&
                                    viewModel
                                            .dataMatch['stats']['data'][0]
                                                ['passes']
                                            .length >
                                        0)
                                ? Text(
                                    (viewModel.dataMatch['stats']['data'][0]
                                                    ['passes']['percentage']
                                                .toString() ==
                                            'null')
                                        ? "0"
                                        : viewModel.dataMatch['stats']['data']
                                                [0]['passes']['percentage']
                                            .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  )
                                : Text(
                                    "0",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  ),
                            Spacer(),
                            Text(
                              'نسبة التمريرات الدقيقة',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Spacer(),
                            (viewModel.dataMatch['stats']['data'][1]
                                            ['passes'] !=
                                        null &&
                                    viewModel
                                            .dataMatch['stats']['data'][1]
                                                ['passes']
                                            .length >
                                        0)
                                ? Text(
                                    (viewModel.dataMatch['stats']['data'][1]
                                                    ['passes']['percentage']
                                                .toString() ==
                                            'null')
                                        ? "0"
                                        : viewModel.dataMatch['stats']['data']
                                                [1]['passes']['percentage']
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  )
                                : Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffD41A1A)),
                                  ),
                          ],
                        ),
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

  Widget Tab6t() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color.fromRGBO(26, 26, 26, 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'End 90 minutes',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Circular',
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("sss"),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 869,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 38, 38, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(top: 790, left: 0, child: null),
                    Positioned(
                      top: 306,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 463,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Color.fromRGBO(26, 26, 26, 1),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 323,
                        left: 20,
                        child: Text(
                          'End 90 minutes',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 579,
                        left: 20.00048828125,
                        child: Text(
                          'Halftime',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 243,
                        left: 20,
                        child: Divider(
                            color: Color.fromRGBO(107, 107, 107, 1),
                            thickness: 0.5)),
                    Positioned(
                        top: 356.50732421875,
                        left: 19.99951171875,
                        child: Divider(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            thickness: 1)),
                    Positioned(
                        top: 612.50732421875,
                        left: 20,
                        child: Divider(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            thickness: 1)),
                    Positioned(
                        top: 319,
                        left: 173,
                        child: Text(
                          '2-4',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 575,
                        left: 173,
                        child: Text(
                          '2-2',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 368,
                        left: 188,
                        child: Transform.rotate(
                          angle: -89.99999999999999 * (pi / 180),
                          child: Divider(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              thickness: 1),
                        )),
                    Positioned(
                        top: 434,
                        left: 188,
                        child: Transform.rotate(
                          angle: -89.99999999999999 * (pi / 180),
                          child: Divider(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              thickness: 1),
                        )),
                    Positioned(
                        top: 500,
                        left: 188,
                        child: Transform.rotate(
                          angle: -89.99999999999999 * (pi / 180),
                          child: Divider(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              thickness: 1),
                        )),
                    Positioned(
                        top: 624,
                        left: 188,
                        child: Transform.rotate(
                          angle: -89.99999999999999 * (pi / 180),
                          child: Divider(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              thickness: 1),
                        )),
                    Positioned(
                        top: 690,
                        left: 188,
                        child: Transform.rotate(
                          angle: -89.99999999999999 * (pi / 180),
                          child: Divider(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              thickness: 1),
                        )),
                    Positioned(
                        top: 407,
                        left: 169,
                        child: Text(
                          '90’ +4',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(212, 26, 26, 1),
                              fontFamily: 'Circular',
                              fontSize: 13,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 473,
                        left: 169,
                        child: Text(
                          '90’ +4',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(212, 26, 26, 1),
                              fontFamily: 'Circular',
                              fontSize: 13,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 539,
                        left: 169,
                        child: Text(
                          '90’ +4',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(212, 26, 26, 1),
                              fontFamily: 'Circular',
                              fontSize: 13,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 663,
                        left: 180,
                        child: Text(
                          '36',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 13,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 397,
                        left: 222,
                        child: Text(
                          'Joseph',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 470,
                        left: 222,
                        child: Text(
                          'Joseph',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 536,
                        left: 222,
                        child: Text(
                          'Joseph',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 662,
                        left: 20,
                        child: Text(
                          'Joseph Joseph',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Circular',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 417,
                        left: 222,
                        child: Text(
                          'Barcelona Club',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(107, 107, 107, 1),
                              fontFamily: 'Circular',
                              fontSize: 13,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 403,
                        left: 328,
                        child: Container(
                            width: 27,
                            height: 27,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(27, 27)),
                            ))),
                    Positioned(
                        top: 729,
                        left: 177,
                        child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0.00012205868551973253,
                                  left: 0,
                                  child: Container(
                                      width: 19.999799728393555,
                                      height: 19.999977111816406,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: SvgPicture.asset(
                                              'assets/images/vector.svg',
                                              semanticsLabel: 'vector'),
                                        ),
                                        Positioned(
                                          top: 5.648317813873291,
                                          left: 9.41405963897705,
                                          child: SvgPicture.asset(
                                              'assets/images/vector.svg',
                                              semanticsLabel: 'vector'),
                                        ),
                                      ]))),
                            ]))),
                  ])),
            ],
          ),
        ],
      ),
    );
  }

  Widget Tab6(Home4ViewModel viewModel, ScrollController _controller,
      List<dynamic> attjson, var att) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left
          print("left");
          viewModel.onTab5Selected();
        } else if (details.primaryVelocity < 0) {
          // User swiped Right
          print("right");
        }
      },
      child: (att['type'] != 'pen_shootout_miss' &&
              att['type'] != 'pen_shootout_goal')
          ? Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if ((viewModel?.dataMatch['time']['status'].toString() ==
                              "FT" ||
                          viewModel?.dataMatch['time']['status'].toString() ==
                              "FT_PEN") &&
                      attjson.indexOf(att) ==
                          viewModel.dataMatch['events']['data'].length - 1)
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: (ThemeService().theme.toString() ==
                                  "ThemeMode.dark")
                              ? Theme.of(context).secondaryHeaderColor
                              : Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      // color:
                      //     (ThemeService().theme.toString() == "ThemeMode.dark")
                      //         ? Colors.white
                      //         : Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 5, left: 25),
                            child: Text(
                              "نهاية الوقت",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Circular",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 0, left: 105),
                            child: Text(
                              viewModel.currentMatchData.scores.htScore
                                      .toString() ??
                                  "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Circular",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if ((viewModel?.dataMatch['time']['status'].toString() ==
                              "FT" ||
                          viewModel?.dataMatch['time']['status'].toString() ==
                              "FT_PEN") &&
                      attjson.indexOf(att) ==
                          viewModel.dataMatch['events']['data'].length - 1)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.96,
                      child: Divider(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          thickness: 0.5),
                    ),
                  if ((int.parse(att['minute'].toString()) < 46 &&
                          int.parse(att['minute'].toString()) >= 45) &&
                      (viewModel.dataMatch['scores']['ht_score'].toString() !=
                          'null'))
                    Container(height: 50, child: halftime(viewModel)),
                  (attjson.length > 0)
                      ? events(viewModel, att, attjson)
                      : Container(),
                ],
              ),
            )
          : Container(),
    );
  }

  Widget events(Home4ViewModel viewModel, var att, List<dynamic> attjson) {
    if (viewModel.localid.toString() == att['team_id'].toString()) {
      return Row(
        children: [
          Flexible(
            flex: 3,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: new Container(
                // width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  (att['player_name'].toString().length > 18)
                                      ? att['player_name']
                                          .toString()
                                          .substring(0, 18)
                                      : att['player_name'].toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: (ThemeService().theme.toString() ==
                                              "ThemeMode.dark")
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Text(
                                  att['related_player_name'].toString() ==
                                          'null'
                                      ? ''
                                      : att['related_player_name'].toString(),
                                  style: TextStyle(
                                    color: Color(0xff6b6b6b),
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                    (att['result'].toString() == 'null'
                                        ? ''
                                        : att['result'].toString()),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red))
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  onTap: () {
                                    Get.to(() => PlayerInfoView(
                                          playerId: att['player']['data']
                                                  ['player_id']
                                              .toString(),
                                        ));
                                  },
                                  child: CircleAvatar(
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      child: Image.network(att['player']['data']
                                              ['image_path'] ??
                                          "".toString()),
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Positioned(
                                  right: 0.0,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    width: 15,
                                    height: 15,
                                    image: AssetImage(
                                        'assets/images/${att['type']}.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            // child: Container(
            //   alignment: AlignmentDirectional.center,
            //   child: Text(
            //     att['minute'].toString(),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            child: Container(
              alignment: AlignmentDirectional.center,
              height: 35,
              width: 35,
              // color:Colors.grey,
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    child: Text(
                      att['minute'].toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // if (att['minute'].toString() != "90" && attjson.la)
                  // attjson.lastIndexOf(att) == attjson.length - 1
                  //     ? Container()
                  //     :
                  // (viewModel?.dataMatch['scores']['ht_score'] != 'null' &&
                  //     int.parse(att['minute'].toString()) <= 45  &&
                  //     int.parse(attjson[attjson.lastIndexOf(att)]['minute']
                  //         .toString()) >
                  //         46)? Container() :
                  Positioned(
                    top: 20,
                    child: Container(
                      child: Image.asset(
                        'assets/images/line.png',
                        color: (ThemeService().theme.toString() ==
                                "ThemeMode.dark")
                            ? Colors.white
                            : Colors.black,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
                // width: MediaQuery.of(context).size.width / 2,
                ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              alignment: AlignmentDirectional.center,
              height: 35,
              width: 35,
              // color:Colors.grey,
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    child: Text(
                      att['minute'].toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // if (att['minute'].toString() != "90" )
                  // attjson.lastIndexOf(att) == attjson.length - 1
                  //     ? Container()
                  //     :
                  // if(viewModel?.dataMatch['scores']['ht_score']=='null')
                  //  (viewModel?.dataMatch['scores']['ht_score'] != 'null' &&
                  //     int.parse(att['minute'].toString()) <= 45  &&
                  //         int.parse(attjson[attjson.lastIndexOf(att)]['minute']
                  //                 .toString()) >
                  //             46)? Container() :
                  Positioned(
                    top: 25,
                    child: Container(
                      child: Image.asset(
                        'assets/images/line.png',
                        color: (ThemeService().theme.toString() ==
                                "ThemeMode.dark")
                            ? Colors.white
                            : Colors.black,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: new Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  onTap: () {
                                    Get.to(() => PlayerInfoView(
                                          playerId: att['player']['data']
                                                  ['player_id']
                                              .toString(),
                                        ));
                                    // print(player['player']['data']['player_id']);
                                  },
                                  child: CircleAvatar(
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      child: Image.network(
                                        att['player']['data']['image_path']
                                            .toString(),
                                      ),
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Positioned(
                                  left: 0.0,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    width: 15,
                                    height: 15,
                                    image: AssetImage(
                                        'assets/images/${att['type']}.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  (att['player_name'].toString().length > 18)
                                      ? att['player_name']
                                          .toString()
                                          .substring(0, 18)
                                      : att['player_name'].toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: (ThemeService().theme.toString() ==
                                              "ThemeMode.dark")
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Text(
                                  att['related_player_name'].toString() ==
                                          'null'
                                      ? ''
                                      : att['related_player_name'].toString(),
                                  style: TextStyle(
                                    color: Color(0xff6b6b6b),
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  (att['result'].toString() == 'null'
                                      ? ''
                                      : att['result'].toString()),
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget Tab5(
      Home4ViewModel viewModel, ScrollController _controller, Size size) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left
          print("left");
          viewModel.onTab4Selected();
        } else if (details.primaryVelocity < 0) {
          // User swiped Right
          print("right");
          viewModel.onTab6selected();
        }
      },
      child: Column(
        children: [
          ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              // primary: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: viewModel.seasonList.length,
              itemBuilder: (BuildContext context, int index) {
                return arrangementsMainItem(
                    context,
                    viewModel.seasonList[index],
                    viewModel.seasonList[index].data,
                    viewModel);
              }),
          bottomLeague(viewModel),
        ],
      ),
    );
  }

  Widget bottomLeague(Home4ViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          child: Container(
            height: 55 * viewModel.arry.length.toDouble(),
            decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(20)),
            child: Directionality(
              textDirection: ui.TextDirection.rtl,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.arry.length,
                itemBuilder:
                    // ignore: missing_return
                    (BuildContext context, int index) {
                  if (viewModel.arry.length == 1) {
                    if (index == 0) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.green);
                    }
                  }
                  if (viewModel.arry.length == 2) {
                    if (index == 0) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.green);
                    } else if (index == 1) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.red);
                    }
                  }
                  if (viewModel.arry.length == 3) {
                    if (index == 0) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.green);
                    } else if (index == 1) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.yellow);
                    } else if (index == 2) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.red);
                    }
                  }
                  if (viewModel.arry.length == 4) {
                    if (index == 0) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.green);
                    } else if (index == 1) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.yellow);
                    } else if (index == 2) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.orange);
                    } else if (index == 3) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.red);
                    }
                  }
                  if (viewModel.arry.length == 5) {
                    if (index == 0) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.green);
                    } else if (index == 1) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.yellow);
                    } else if (index == 2) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.orangeAccent);
                    } else if (index == 3) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.orange);
                    } else if (index == 4) {
                      return BottomColorItem(
                          context, viewModel, index, Colors.red);
                    }
                  }
                },
              ),
            ),
          ),
          onTap: () {
            print(viewModel.arry);
          }),
    );
  }

  Widget BottomColorItem(
      BuildContext context, Home4ViewModel viewModel, int index, Color color) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 8, bottom: 8, right: 12),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: color),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            viewModel.leagueName[viewModel.arry[index]] != null
                ? viewModel.leagueName[viewModel.arry[index]]
                : viewModel.arry[index],
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
        ],
      ),
    );
  }

  Padding arrangementsMainItem(BuildContext context, Season seasonMatchModel,
      dynamic dataList, Home4ViewModel viewModel) {
    print("dataList" + dataList.length.toString());
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 0, right: 8, left: 8),
      child: Container(
        height: (dataList.length > 10)
            ? (57 * dataList.length).toDouble()
            : (70 * dataList.length).toDouble(),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (ThemeService().theme.toString() == "ThemeMode.dark")
              ? Colors.black
              : Colors.white,
          // color: Colors.orange
        ),
        child: Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (seasonMatchModel.groupName == null)
                        ? ''
                        : seasonMatchModel.groupName,
                    style: Theme.of(context).primaryTextTheme.headline1,
                  )
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(' ',
                        style: Theme.of(context).primaryTextTheme.headline1),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Text('الفريق',
                        style: Theme.of(context).primaryTextTheme.headline1),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text('ل',
                        style: Theme.of(context).primaryTextTheme.headline1),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text('ف',
                        style: Theme.of(context).primaryTextTheme.headline1),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text('ت',
                        style: Theme.of(context).primaryTextTheme.headline1),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text('خ',
                        style: Theme.of(context).primaryTextTheme.headline1),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Center(
                    child: Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Text('نقاط',
                          style: Theme.of(context).primaryTextTheme.headline1),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Center(
                    child: Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Text('اهداف',
                          style: Theme.of(context).primaryTextTheme.headline1),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(' ',
                        style: Theme.of(context).primaryTextTheme.headline1),
                  ),
                ],
              ),
              Expanded(
                // height: (dataList.length * 60).toDouble(),
                child: Container(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: dataList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      print('inner List');
                      print("dataList:" + dataList.length.toString());

                      return arrangementsInnerItem(
                          context, dataList[index], viewModel);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget arrangementsInnerItem(
      BuildContext context, dynamic data, Home4ViewModel viewModel) {
    return Row(
      children: [
        Container(
          height: 53,
          width: MediaQuery.of(context).size.width / 3.0,
          padding: EdgeInsets.only(top: 6, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (viewModel.arry.length == 1 &&
                  viewModel.arry[0] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.green,
                ),
              if (viewModel.arry.length == 2 &&
                  viewModel.arry[0] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.green,
                )
              else if (viewModel.arry.length == 2 &&
                  viewModel.arry[0] != data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.red,
                ),
              if (viewModel.arry.length == 3 &&
                  viewModel.arry[0] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.green,
                )
              else if (viewModel.arry.length == 3 &&
                  viewModel.arry[1] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.yellow,
                )
              else if (viewModel.arry.length == 3 &&
                  viewModel.arry[2] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.red,
                ),
              if (viewModel.arry.length == 4 &&
                  viewModel.arry[0] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.green,
                )
              else if (viewModel.arry.length == 4 &&
                  viewModel.arry[1] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.yellow,
                )
              else if (viewModel.arry.length == 4 &&
                  viewModel.arry[2] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.orange,
                )
              else if (viewModel.arry.length == 4 &&
                  viewModel.arry[3] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.red,
                ),
              if (viewModel.arry.length == 5 &&
                  viewModel.arry[0] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.green,
                )
              else if (viewModel.arry.length == 5 &&
                  viewModel.arry[1] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.yellow,
                )
              else if (viewModel.arry.length == 5 &&
                  viewModel.arry[2] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Color(0xffD2B48C),
                )
              else if (viewModel.arry.length == 5 &&
                  viewModel.arry[3] == data['result'])
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.orange,
                )
              else if (viewModel.arry.length == 5 &&
                  viewModel.arry[4] == data['result'])
                Container(
                  height: 50,
                  width: 2,
                  color: Colors.red,
                ),
              SizedBox(width: 4),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      ' ',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => ClubPlayersView(
                                teamId: data['team']['data']['id'].toString(),
                              ));
                        },
                        child: arrangementsClubIconItem(
                            data['team']['data']['logo_path'])),
                    SizedBox(width: 5),
                    Expanded(
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ClubPlayersView(
                                  teamId: data['team']['data']['id'].toString(),
                                ));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                viewModel.leagueName[data['team']['data']
                                            ['name']] !=
                                        null
                                    ? viewModel.leagueName[data['team']['data']
                                        ['name']]
                                    : data['team']['data']['name'],
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                                maxLines: 1,
                              ),
                              if (viewModel.arry.length == 1 &&
                                  viewModel.arry[0] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                          data['result'].toString().isNotEmpty
                                              ? (data['result'].toString() ==
                                                      'null'
                                                  ? ''
                                                  : data['result'].toString())
                                              : '',
                                          style: TextStyle(
                                              fontSize: 8.0,
                                              color: Colors.green),
                                          textAlign: TextAlign.center)),
                                ),
                              if (viewModel.arry.length == 2 &&
                                  viewModel.arry[0] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0,
                                  //             color: Colors.green),
                                  //         textAlign: TextAlign.center)),
                                )
                              else if (viewModel.arry.length == 2 &&
                                  viewModel.arry[0] != data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0, color: Colors.red),
                                  //         textAlign: TextAlign.center),),
                                ),
                              if (viewModel.arry.length == 3 &&
                                  viewModel.arry[0] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0,
                                  //             color: Colors.green),
                                  //         textAlign: TextAlign.center)),
                                )
                              else if (viewModel.arry.length == 3 &&
                                  viewModel.arry[1] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0,
                                  //             color: Colors.amberAccent),
                                  //         textAlign: TextAlign.center)),
                                )
                              else if (viewModel.arry.length == 3 &&
                                  viewModel.arry[2] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0, color: Colors.red),
                                  //         textAlign: TextAlign.center)),
                                ),
                              if (viewModel.arry.length == 4 &&
                                  viewModel.arry[0] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0,
                                  //             color: Colors.green),
                                  //         textAlign: TextAlign.center)),
                                )
                              else if (viewModel.arry.length == 4 &&
                                  viewModel.arry[1] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0,
                                  //             color: Colors.amberAccent),
                                  //         textAlign: TextAlign.center)),
                                )
                              else if (viewModel.arry.length == 4 &&
                                  viewModel.arry[2] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0,
                                  //             color: Colors.orange),
                                  //         textAlign: TextAlign.center)),
                                )
                              else if (viewModel.arry.length == 4 &&
                                  viewModel.arry[3] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //     alignment: AlignmentDirectional.center,
                                  //     child: Text(
                                  //         data['result'].toString().isNotEmpty
                                  //             ? (data['result'].toString() ==
                                  //                     'null'
                                  //                 ? ''
                                  //                 : data['result'].toString())
                                  //             : '',
                                  //         style: TextStyle(
                                  //             fontSize: 8.0,
                                  //             color: Colors.red),
                                  //         textAlign: TextAlign.center))
                                ),
                              if (viewModel.arry.length == 5 &&
                                  viewModel.arry[0] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //                                     alignment: AlignmentDirectional.center,
                                  //                                     child: Text(
                                  //                                         data['result'].toString().isNotEmpty
                                  //                                             ? (data['result'].toString() == 'null'
                                  //                                                 ? ''
                                  //                                                 : data['result'].toString())
                                  //                                             : '',
                                  //                                         style: TextStyle(
                                  //                                             fontSize: 8.0,
                                  //                                             color: Colors.green),
                                  //                                         textAlign: TextAlign.center))
                                )
                              else if (viewModel.arry.length == 5 &&
                                  viewModel.arry[1] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //                                     alignment: AlignmentDirectional.center,
                                  //                                     child: Text(
                                  //                                         data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '',
                                  //                                         style: TextStyle(fontSize: 8.0, color: Colors.amberAccent),
                                  //                                         textAlign: TextAlign.center))
                                )
                              else if (viewModel.arry.length == 5 &&
                                  viewModel.arry[2] == data['result'])
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: Text(
                                            data['result'].toString().isNotEmpty
                                                ? (data['result'].toString() ==
                                                        'null'
                                                    ? ''
                                                    : data['result'].toString())
                                                : '',
                                            style: TextStyle(
                                                fontSize: 8.0,
                                                color: Color(0xffD2B48C)),
                                            textAlign: TextAlign.center)))
                              else if (viewModel.arry.length == 5 &&
                                  viewModel.arry[3] == data['result'])
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: Text(
                                            data['result'].toString().isNotEmpty
                                                ? (data['result'].toString() ==
                                                        'null'
                                                    ? ''
                                                    : data['result'].toString())
                                                : '',
                                            style: TextStyle(
                                                fontSize: 8.0,
                                                color: Colors.orange),
                                            textAlign: TextAlign.center)))
                              else if (viewModel.arry.length == 5 &&
                                  viewModel.arry[4] == data['result'])
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: Text(
                                            data['result'].toString().isNotEmpty
                                                ? (data['result'].toString() ==
                                                        'null'
                                                    ? ''
                                                    : data['result'].toString())
                                                : '',
                                            style: TextStyle(
                                                fontSize: 8.0,
                                                color: Colors.black),
                                            textAlign: TextAlign.center))),

                              //6
                              if (viewModel.arry.length == 6 &&
                                  viewModel.arry[0] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //                                     alignment: AlignmentDirectional.center,
                                  //                                     child: Text(
                                  //                                         data['result'].toString().isNotEmpty
                                  //                                             ? (data['result'].toString() ==
                                  //                                                     'null'
                                  //                                                 ? ''
                                  //                                                 : data['result'].toString())
                                  //                                             : '',
                                  //                                         style: TextStyle(
                                  //                                             fontSize: 8.0,
                                  //                                             color: Colors.green),
                                  //                                         textAlign: TextAlign.center))
                                )
                              else if (viewModel.arry.length == 6 &&
                                  viewModel.arry[1] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //                                     alignment: AlignmentDirectional.center,
                                  //                                     child: Text(
                                  //                                         data['result'].toString().isNotEmpty
                                  //                                             ? (data['result'].toString() ==
                                  //                                                     'null'
                                  //                                                 ? ''
                                  //                                                 : data['result'].toString())
                                  //                                             : '',
                                  //                                         style: TextStyle(
                                  //                                             fontSize: 8.0,
                                  //                                             color: Colors.amberAccent),
                                  //                                         textAlign: TextAlign.center))
                                )
                              else if (viewModel.arry.length == 6 &&
                                  viewModel.arry[2] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //                                     alignment: AlignmentDirectional.center,
                                  //                                     child: Text(
                                  //                                         data['result'].toString().isNotEmpty
                                  //                                             ? (data['result'].toString() ==
                                  //                                                     'null'
                                  //                                                 ? ''
                                  //                                                 : data['result'].toString())
                                  //                                             : '',
                                  //                                         style: TextStyle(
                                  //                                             fontSize: 8.0,
                                  //                                             color: Color(0xffD2B48C)),
                                  //                                         textAlign: TextAlign.center))
                                )
                              else if (viewModel.arry.length == 6 &&
                                  viewModel.arry[3] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //                                     alignment: AlignmentDirectional.center,
                                  //                                     child: Text(
                                  //                                         data['result'].toString().isNotEmpty
                                  //                                             ? (data['result'].toString() ==
                                  //                                                     'null'
                                  //                                                 ? ''
                                  //                                                 : data['result'].toString())
                                  //                                             : '',
                                  //                                         style: TextStyle(
                                  //                                             fontSize: 8.0,
                                  //                                             color: Colors.orange),
                                  //                                         textAlign: TextAlign.center))
                                )
                              else if (viewModel.arry.length == 6 &&
                                  viewModel.arry[4] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //                                 alignment: AlignmentDirectional.center,
                                  //                                 child: Text(
                                  //                                     data['result'].toString().isNotEmpty
                                  //                                         ? (data['result'].toString() ==
                                  //                                                 'null'
                                  //                                             ? ''
                                  //                                             : data['result'].toString())
                                  //                                         : '',
                                  //                                     style: TextStyle(
                                  //                                         fontSize: 8.0, color: Colors.black),
                                  //                                     textAlign: TextAlign.center)),
                                )
                              else if (viewModel.arry.length == 6 &&
                                  viewModel.arry[5] == data['result'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(),
                                  // Align(
                                  //                                 alignment: AlignmentDirectional.center,
                                  //                                 child: Text(
                                  //                                     data['result'].toString().isNotEmpty
                                  //                                         ? (data['result'].toString() ==
                                  //                                                 'null'
                                  //                                             ? ''
                                  //                                             : data['result'].toString())
                                  //                                         : '',
                                  //                                     style: TextStyle(
                                  //                                         fontSize: 8.0, color: Colors.black),
                                  //                                     textAlign: TextAlign.center),
                                  //                               ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(data['overall']['games_played'].toString(),
                      style: Theme.of(context).primaryTextTheme.subtitle1),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(data['overall']['won'].toString(),
                      style: Theme.of(context).primaryTextTheme.subtitle1),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(data['overall']['draw'].toString(),
                      style: Theme.of(context).primaryTextTheme.subtitle1),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(data['overall']['lost'].toString(),
                      style: Theme.of(context).primaryTextTheme.subtitle1),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(' ' + data['total']['points'].toString(),
                      style: Theme.of(context).primaryTextTheme.subtitle1),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Text(
                      data['total']['goal_difference'].toString(),
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container arrangementsClubIconItem(String path) {
    return Container(
      height: 27,
      width: 27,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Image.network(path.isNotEmpty
          ? path
          : 'https://cdn.sportmonks.com/images//soccer/teams/14/228398.png'),
    );
  }

  Padding detailItem(
      BuildContext context, int index, BroadCasting broadCasting) {
    return Padding(
      padding: EdgeInsets.only(top: 6, bottom: 6),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: (index.isOdd)
              ? BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20))
              : BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20)),
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: (index.isEven)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    broadCasting.tvstation,
                    style: Theme.of(context).primaryTextTheme.headline1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/staellite.png',
                    height: 16,
                    width: 16,
                    color: Theme.of(context).buttonColor,
                  ),
                  Spacer()
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Expanded(
                      child: Text(
                    broadCasting.tvstation,
                    style: Theme.of(context).primaryTextTheme.headline1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/staellite.png',
                    height: 16,
                    width: 16,
                    color: Theme.of(context).buttonColor,
                  ),
                ],
              ),
      ),
    );
  }

  Widget topMatchItem(BuildContext context,
      CurrentMatchesData currentMatchesData, Home4ViewModel home4viewModel) {
    return InkWell(
      onTap: () {
        print(currentMatchesData.time.status);
        print((currentMatchesData.time.status == "FT_PEN"));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: (ThemeService().theme.toString() == "ThemeMode.dark")
                ? Theme.of(context).secondaryHeaderColor
                : Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                // topLeft: Radius.circular(20.0),
                // topRight: Radius.circular(20.0)
            ),
          ),
          child: Column(
            children: [
              Container(
                height: (currentMatchesData.time.status.toString() == "FT_PEN")
                    ? 120
                    : 80,
                // height: 120,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => LeagueInfoView(
                              leagueId:
                                  currentMatchesData.league.data.id.toString(),
                            ));
                      },
                      child: Container(
                        child: Image.network(
                          currentMatchesData.league.data.logoPath,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        // if(viewModel.isTrue==true) {
                        //   print(league['id']);
                        //   Get.to(()=>LeagueInfoView(leagueId: league['id'].toString(),));
                        // }
                        print("league['id']:" +
                            currentMatchesData.league.data.id.toString());
                        Get.to(() => LeagueInfoView(
                              leagueId:
                                  currentMatchesData.league.data.id.toString(),
                            ));
                      },
                      child: Container(
                        child: Text(
                          home4viewModel.leagueName[
                                      currentMatchesData
                                          .league.data.id
                                          .toString()] !=
                                  null
                              ? home4viewModel.leagueName[
                                  currentMatchesData.league.data.id.toString()]
                              : currentMatchesData.league.data.id.toString(),
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                      ),
                    ),
                    (currentMatchesData.time.status.toString() == "FT_PEN")
                        ? InkWell(
                            onTap: () {
                              print(currentMatchesData.time.status);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 37,
                                    height: 42,
                                    child: Center(
                                      child: Text(
                                        currentMatchesData
                                                    .scores.localteamPenScore
                                                    .toString() !=
                                                null
                                            ? currentMatchesData
                                                .scores.localteamPenScore
                                                .toString()
                                            : "",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      child: Image.asset(
                                        'assets/images/dotIcon.png',
                                        height: 19,
                                        width: 4,
                                        color: Theme.of(context).buttonColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 37,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        currentMatchesData
                                                    .scores.visitorteamPenScore
                                                    .toString() !=
                                                null
                                            ? currentMatchesData
                                                .scores.visitorteamPenScore
                                                .toString()
                                            : "",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Container(
                // color: Colors.black,
                height: 170,
                // height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => ClubPlayersView(
                                    teamId: currentMatchesData.localTeam.data.id
                                        .toString(),
                                  ));
                            },
                            child: Container(
                              child: Image.network(
                                currentMatchesData.localTeam.data.logoPath,
                                height: 74,
                                width: 49,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          InkWell(
                            onTap: () {
                              print(currentMatchesData.localTeam.data.id
                                  .toString());
                              print(home4viewModel.leagueName[
                                  currentMatchesData.localTeam.data.name]);
                              // print(home4viewModel.leagueName["Levante"]);

                              // print( home4viewModel.leagueName[currentMatchesData.localTeam.data.name]!=null?home4viewModel.leagueName[currentMatchesData.localTeam.data.name]:currentMatchesData.localTeam.data.name);
                              // print(home4viewModel.countriesArabic.where((o) => o['id'].toString() == currentMatchesData.localTeam.data.id.toString()).toList()[0]['name'].toString());
                            },
                            child: Text(
                              home4viewModel.leagueName[currentMatchesData
                                          .localTeam.data.name] !=
                                      null
                                  ? home4viewModel.leagueName[
                                      currentMatchesData.localTeam.data.name]
                                  : currentMatchesData.localTeam.data.name,
                              textAlign: TextAlign.center,
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 37,
                              height: 42,
                              child: Center(
                                child: Text(
                                  currentMatchesData.scores.localteamScore
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 36, color: Color(0xffD7191D)),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Theme.of(context).secondaryHeaderColor,
                                child: Image.asset(
                                  'assets/images/dotIcon.png',
                                  height: 19,
                                  width: 4,
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                            ),
                            Container(
                              width: 37,
                              height: 42,
                              decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  currentMatchesData.scores.visitorteamScore
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 36, color: Color(0xffD7191D)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 90,
                            height: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffd41a1a),
                            ),

                            // height: 27,
                            // width: 60,
                            // decoration: BoxDecoration(
                            //   color: Color(0xffD7191D),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {
                                print(currentMatchesData.time.minute);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //(widget.matchStatus!=null)?
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 2),
                                      child: AutoSizeText(
                                        home4viewModel
                                            .checkstatus(
                                                currentMatchesData.time)
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "Circular",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 1,
                                  // ),
                                  Container(
                                    padding: EdgeInsets.only(right: 3),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => ClubPlayersView(
                                    teamId: currentMatchesData
                                        .visitorTeam.data.id
                                        .toString(),
                                  ));
                            },
                            child: Container(
                              child: Image.network(
                                currentMatchesData
                                        .visitorTeam.data.logoPath.isEmpty
                                    ? 'https://via.placeholder.com/150'
                                    : currentMatchesData
                                        .visitorTeam.data.logoPath,
                                height: 74,
                                width: 49,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            home4viewModel.leagueName[currentMatchesData
                                        .visitorTeam.data.name] !=
                                    null
                                ? home4viewModel.leagueName[
                                    currentMatchesData.visitorTeam.data.name]
                                : currentMatchesData.visitorTeam.data.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding videoItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(0xff1F1F1F), borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 74,
                  width: 74,
                  //color: Colors.purple,
                  decoration: BoxDecoration(
                      //  color: Color(0xff1F1F1F),
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Image.asset('assets/images/video.png'),
                      Center(
                        child: Container(
                          height: 30,
                          width: 30,
                          child:
                              Image.asset('assets/images/Iconplaycircle.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1 - 0 Jonas Hofman 1',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    'Streamja.com',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding MatchesItem(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 11, bottom: 11),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff1B1B1B),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                clubPictureItem(),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Club',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'June 15',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xffD41A1A)),
                      ),
                      Text(
                        '2-0',
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                clubPictureItem(),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Club',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container clubPictureItem() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    );
  }

  Widget teamDetailsItem(BuildContext context, YearData yearData,
      Home4ViewModel viewModel, int index) {
      print("Home4ViewModel"+yearData.year.toString()+" l ="+yearData.data.length.toString());
    return Padding(
      padding:  EdgeInsets.only(top: index== 0 ? 0 : 5),
      child: Container(
        height: (yearData.data.length *
            (yearData.data.length==1?115:90)).toDouble(),
        // padding: EdgeInsets.only(top: index == 0 ? 0 : 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (ThemeService().theme.toString() == "ThemeMode.dark")
              ? Color(0xff1a1a1a)
              : Colors.white,
        ),
        // height: 239,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 25, top: 10),
                    child: Text(
                      yearData.year ,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.93,
                child: Divider(
                  height: 1,
                  thickness: 0.3,
                  color: Colors.white,
                ),
              ),
              Container(
                height: (yearData.data.length * 100).toDouble(),
                // width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                  // primary: false,
                    shrinkWrap: true,
                    itemCount: yearData.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return teamDetails(context, yearData.data[index], viewModel);
                    }),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget teamDetailItem(BuildContext context, YearData yearData,
      Home4ViewModel viewModel, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Container(
        height: (yearData.data.length * 110).toDouble(),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: (ThemeService().theme.toString() == "ThemeMode.dark")
                ? Colors.black
                : Colors.white,
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(yearData.year,
                      style: Theme.of(context).primaryTextTheme.headline1),
                ),
              ],
            ),
            Container(
              height: (yearData.data.length * 75).toDouble(),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  // primary: false,
                  shrinkWrap: true,
                  itemCount: yearData.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return teamDetail(context, yearData.data[index], viewModel);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget teamDetail(
      BuildContext context, dynamic data, Home4ViewModel viewModel) {
    return InkWell(
      onTap: () {
        print("Navigate");
        //Get.off();
        //
        //   Get.back();
        Get.reset();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home4View(
              id: data['id'].toString(),
              seasonid: data['season_id'].toString(),
            ),
          ),
        );
      },
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        color: (ThemeService().theme.toString() == "ThemeMode.dark")
            ? Colors.black
            : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8, top: 6),
              child: Container(
                height: 15,
                width: 15,
                //child: Image.asset('assets/images/bell.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                      viewModel.leagueName[
                      data['localTeam']['data']['name'].toString()] !=
                          null
                          ? viewModel.leagueName[
                      data['localTeam']['data']['name'].toString()]
                          : data['localTeam']['data']['name'].toString(),
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    )),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => ClubPlayersView(
                      teamId: data['localTeam']['data']['id'].toString(),
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child:
                    Image.network(data['localTeam']['data']['logo_path']),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stadium Berlin',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          data['scores']['localteam_score'].toString(),
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                        Text(
                          "-",
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                        Text(
                          data['scores']['visitorteam_score'].toString(),
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => ClubPlayersView(
                      teamId: data['visitorTeam']['data']['id'].toString(),
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child:
                    Image.network(data['visitorTeam']['data']['logo_path']),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Directionality(
                      textDirection: ui.TextDirection.rtl,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              viewModel.leagueName[data['visitorTeam']['data']
                              ['name']] !=
                                  null
                                  ? viewModel.leagueName[data['visitorTeam']['data']
                              ['name']]
                                  : data['visitorTeam']['data']['name'],
                              style: Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget teamDetails(
      BuildContext context, dynamic data, Home4ViewModel viewModel) {
    print("teamDetails"+data.toString());
    return InkWell(
      onTap: () {
        print("Navigate");
        //Get.off();
        //
        //   Get.back();
        Get.reset();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home4View(
              id: data['id'].toString(),
              seasonid: data['season_id'].toString(),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Container(
              padding: EdgeInsets.only(top: 5,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  Container(),
                  Text(
                     data['venue']['data']['name'].toString()=='null'
                        ?"":data['venue']['data']['name'].toString(),
                    style: TextStyle(
                      color: Color(0xff505050),
                      fontSize: 13,
                    ),
                  ),
                  Container(),
                  Container(),
                ],
              ),
            ),
            Container(
              height:  38,
              // padding: EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ClubPlayersView(
                          teamId: data['localTeam']['data']['id'].toString(),
                        ));
                      },
                      child: Center(
                        child: Text(
                          data['localTeam']['data']['name'].toString(),
                          style: TextStyle(
                            color:  (ThemeService().theme.toString() == "ThemeMode.dark")
                                ? Colors.white
                                : Color(0xff1a1a1a),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ClubPlayersView(
                          teamId: data['localTeam']['data']['id'].toString(),
                        ));
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(360),child: Image.network(data['localTeam']['data']['logo_path'])),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Center(
                      child: Text(
                        data['scores']['localteam_score'].toString()+":"+data['scores']['visitorteam_score'].toString(),
                        style: TextStyle(
                          color:  (ThemeService().theme.toString() == "ThemeMode.dark")
                              ? Colors.white
                              : Color(0xff1a1a1a),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child:  InkWell(
                      onTap: () {
                        Get.to(() => ClubPlayersView(
                          teamId: data['visitorTeam']['data']['id'].toString(),
                        ));
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(360),child: Image.network(data['visitorTeam']['data']['logo_path'])),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Center(
                      child: Text(
                        data['visitorTeam']['data']['name'].toString(),
                        style: TextStyle(
                          color: (ThemeService().theme.toString() == "ThemeMode.dark")
                              ? Colors.white
                              : Color(0xff1a1a1a),
                          fontSize: 14,
                        ),
                      ),
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

  Container LiveMatchDetailItem(
      BuildContext context, Home4ViewModel viewModel) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(left: 20, right: 20, top: 17),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'End 90 minutes',
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '2 -4',
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
          // Row(
          //   children: [
          //     SizedBox(width: 16,),
          //     Expanded(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               color: Theme.of(context).buttonColor,
          //             ),
          //           ),
          //           Text('90 +4',style: TextStyle(fontSize: 13,color: Color(0xffD41A1A)),),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               color: Theme.of(context).buttonColor,
          //             ),
          //           ),
          //           Text('90 +4',style: TextStyle(fontSize: 13,color: Color(0xffD41A1A)),),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               color: Theme.of(context).buttonColor,
          //             ),
          //           ),
          //           Text('90 +4',style: TextStyle(fontSize: 13,color: Color(0xffD41A1A)),),
          //         ],
          //       ),
          //     ),
          //     SizedBox(width: 16,),
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               color: Colors.transparent,
          //             ),
          //           ),
          //           Row(
          //             children: [
          //               Expanded(
          //                 child: Column(
          //                   children: [
          //                     Text('Joseph',style: Theme.of(context).primaryTextTheme.subtitle1,),
          //                     SizedBox(height: 4,),
          //                     Text('Joseph',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
          //                   ],
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Container(
          //                   height: 27,
          //                   width: 27,
          //                   decoration: BoxDecoration(
          //                       shape: BoxShape.circle,
          //                       color: Colors.grey
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               // color: Theme.of(context).buttonColor,
          //             ),
          //           ),
          //           Row(
          //             children: [
          //               Expanded(
          //                 child: Column(
          //                   children: [
          //                     Text('Joseph',style: Theme.of(context).primaryTextTheme.subtitle1,),
          //                     Text('Joseph',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
          //                   ],
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Container(
          //                   height: 27,
          //                   width: 27,
          //                   decoration: BoxDecoration(
          //                       shape: BoxShape.circle,
          //                       color: Colors.grey
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               color: Colors.transparent,
          //             ),
          //           ),
          //           Row(
          //             children: [
          //               Expanded(
          //                 child: Column(
          //                   children: [
          //                     Text('Joseph',style: Theme.of(context).primaryTextTheme.subtitle1,),
          //                     Text('Joseph',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
          //                   ],
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Container(
          //                   height: 27,
          //                   width: 27,
          //                   decoration: BoxDecoration(
          //                       shape: BoxShape.circle,
          //                       color: Colors.grey
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // Padding(
          //   padding: EdgeInsets.only(left:20,right: 20,top: 17 ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text('Half Time     ',style:Theme.of(context).primaryTextTheme.headline1,),
          //       Expanded(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text('2 -4',style:Theme.of(context).primaryTextTheme.headline1,),
          //           ],
          //         ),
          //       ),
          //       Spacer(),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 8,),
          // Divider(color: Colors.grey.shade800,),
          // Row(
          //   //mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     SizedBox(width: 16,),
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               color: Colors.transparent,
          //             ),
          //           ),
          //           Row(
          //             children: [
          //               Expanded(
          //                 child: Column(
          //                   children: [
          //                     Text('Joseph',style: Theme.of(context).primaryTextTheme.subtitle1,),
          //                     SizedBox(height: 4,),
          //                     Text('Joseph',style: TextStyle(fontSize: 13,color: Color(0xff5F5F5F)),)
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(width: 16,),
          //     Expanded(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               color: Colors.white,
          //             ),
          //           ),
          //           Text('32',style: Theme.of(context).primaryTextTheme.headline1,),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               height: 28,
          //               width: 1,
          //               color:Theme.of(context).buttonColor,
          //             ),
          //           ),
          //           Image.asset('assets/images/timer.png',height: 20,width: 20,color: Theme.of(context).buttonColor,)
          //         ],
          //       ),
          //     ),
          //     SizedBox(width: 60,),
          //
          //
          //   ],
          // ),
          Expanded(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                matchtimeDetailItem(context),
                matchtimeDetailItem(context),
                halfTimeItem(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget halfTimeItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Half Time',
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '2 -4',
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget matchtimeDetailItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 20,
              width: 1,
              color: Theme.of(context).buttonColor,
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue)),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Messi",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      child: Center(
                          child: Text(
                        "90",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      )),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Messi",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'xavi',
                      style: TextStyle(fontSize: 13, color: Color(0xff5F5F5F)),
                    ),
                  ],
                ))),
                Container(
                  height: 20,
                  width: 1,
                  color: Theme.of(context).buttonColor,
                ),
                Expanded(
                    child: Container(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'xavi',
                      style: TextStyle(fontSize: 13, color: Color(0xff5F5F5F)),
                    ),
                  ],
                ))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column clubPlayer1HistoryItem(
      BuildContext context, Home4ViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'الاستحواذ',
          style: TextStyle(
            color: (ThemeService().theme.toString() == "ThemeMode.dark")
                ? Colors.white
                : Colors.black,
            fontSize: 24,
            fontFamily: "Circular",
            fontWeight: FontWeight.w500,
          ),
          // style: Theme.of(context).primaryTextTheme.headline6,
        ),
        // SizedBox(
        //   height: 4,
        // ),
        // SizedBox(
        //   height: 8,
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 20,right: 20),
        //   child: LinearPercentIndicator(
        //       width: MediaQuery.of(context).size.width-40,
        //       lineHeight: 34.0,
        //       percent: 0.21,
        //       //linearStrokeCap: LinearStrokeCap.butt,
        //       // backgroundColor: Color(0xff625510),
        //       //progressColor: Color(0xff1B1B1B),
        //
        //   ),
        // )
        (viewModel.dataMatch['stats'] != null &&
                viewModel.dataMatch['stats']['data'].length > 0)
            ? Container(
                height: 34,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(98, 85, 16, 1),
                ), //Color(0xffADACAC)),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *
                              (viewModel.dataMatch['stats']['data'][0]
                                      ['possessiontime'] /
                                  100) -
                          20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0)),
                        color: (ThemeService().theme.toString() ==
                                "ThemeMode.dark")
                            ? Color(0xff1B1B1B)//Colors.black
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(viewModel.dataMatch['stats']['data'][0]
                                    ['possessiontime']
                                .toString() +
                            '%'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *
                              ((viewModel.dataMatch['stats']['data'][1]
                                      ['possessiontime'] /
                                  100)) -
                          20,
                      child: Center(
                        child: Text(viewModel.dataMatch['stats']['data'][1]
                                    ['possessiontime']
                                .toString() +
                            '%'),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget clubPlayerItems() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 157,
                  top: 15,
                  child: Text(
                    "Leo Messi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Leo Messi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 156,
                  top: 97,
                  child: Text(
                    "Leo Messi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 15,
                  child: Text(
                    "183",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  left: 22.01,
                  top: 56,
                  child: Text(
                    "183",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  left: 21,
                  top: 97,
                  child: Text(
                    "183",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  left: 335,
                  top: 15,
                  child: Text(
                    "183",
                    style: TextStyle(
                      color: Color(0xffd41a1a),
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  left: 335.01,
                  top: 56,
                  child: Text(
                    "183",
                    style: TextStyle(
                      color: Color(0xffd41a1a),
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  left: 334,
                  top: 97,
                  child: Text(
                    "183",
                    style: TextStyle(
                      color: Color(0xffd41a1a),
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  left: 20.99,
                  top: 44.55,
                  child: Container(
                    width: 335.01,
                    height: 1,
                  ),
                ),
                Positioned(
                  left: 21,
                  top: 85.55,
                  child: Container(
                    width: 335.01,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container clubPlayerItem(BuildContext context, Home4ViewModel viewModel) {
    return Container(
      // height: 200,
      height: (50.5) * 19.toDouble(),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: (ThemeService().theme.toString() == "ThemeMode.dark")
              ? Color(0xff1B1B1B) //Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.only(left: 22, right: 22),
      child: Column(
        children: [
          Container(
            height: 12,
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['shots']
                                ['total'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['shots']
                                    ['total']
                                .toString(),
                            style: TextStyle(
                              color: (ThemeService().theme.toString() ==
                                      "ThemeMode.dark")
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14,
                            ),
                            // style:
                            //     Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'التسديات',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['shots']
                                ['total'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['shots']
                                    ['total']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['goal_kick'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['goal_kick']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'المرمى',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['goal_kick'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['goal_kick']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['free_kick'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['free_kick']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'ركلة حرة',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['free_kick'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['free_kick']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['ball_safe'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['ball_safe']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'تصديات',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['ball_safe'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['ball_safe']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['throw_in'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['throw_in']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'رمياة تماس',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['throw_in'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['throw_in']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['goal_attempts'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]
                                    ['goal_attempts']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'محاولات على المرمى',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['goal_attempts'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]
                                    ['goal_attempts']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['saves'] != null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['saves']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'كرات صدت',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['saves'] != null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['saves']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['passes'] !=
                                null &&
                            viewModel.dataMatch['stats']['data'][0]['passes']
                                    .length >
                                0)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['passes']
                                    ['total']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'التمريرات',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['passes'] !=
                                null &&
                            viewModel.dataMatch['stats']['data'][0]['passes']
                                    .length >
                                0)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['passes']
                                    ['total']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['attacks']
                                ['attacks'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['attacks']
                                    ['attacks']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'اجمالي الفرص',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['attacks']
                                ['attacks'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['attacks']
                                    ['attacks']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['attacks']
                                ['dangerous_attacks'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['attacks']
                                    ['dangerous_attacks']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'فرص خطيرة',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['attacks']
                                ['dangerous_attacks'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['attacks']
                                    ['dangerous_attacks']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['fouls'] != null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['fouls']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'الاخطاء',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['fouls'] != null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['fouls']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['corners'] != null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['corners']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'الضربات الركنية',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['corners'] != null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['corners']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['offsides'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['offsides']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'التسلل',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['offsides'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['offsides']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['yellowcards'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]
                                    ['yellowcards']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'بطاقات صفراء',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['yellowcards'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]
                                    ['yellowcards']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['redcards'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['redcards']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'بطاقات صفراء',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['redcards'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['redcards']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['injuries'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['injuries']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'بطاقات صفراء',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['injuries'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['injuries']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['penalties'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]['penalties']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'ضربات جزاء',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['penalties'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]['penalties']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['substitutions'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]
                                    ['substitutions']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'التغيرات',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['substitutions'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]
                                    ['substitutions']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 3),
            height: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (viewModel.dataMatch['stats']['data'][0]['substitutions'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][0]
                                    ['substitutions']
                                .toString(),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          )
                        : Text(
                            "0",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                    Spacer(),
                    Text(
                      'التغيرات',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Spacer(),
                    (viewModel.dataMatch['stats']['data'][1]['substitutions'] !=
                            null)
                        ? Text(
                            viewModel.dataMatch['stats']['data'][1]
                                    ['substitutions']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          )
                        : Text(
                            "0",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffD41A1A)),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clubPlayerListItem(Home4ViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '183',
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
              Spacer(),
              Text(
                'Messi',
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
              Spacer(),
              Text(
                '183',
                style: TextStyle(fontSize: 14, color: Color(0xffD41A1A)),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
        ],
      ),
    );
  }
}

class halftime extends StatelessWidget {
  halftime(this.viewModel);
  final viewModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: (ThemeService().theme.toString() == "ThemeMode.dark")
              ? Colors.black
              : Colors.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      // color:
      //     (ThemeService().theme.toString() == "ThemeMode.dark")
      //         ? Colors.white
      //         : Colors.grey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 3, right: 5, left: 25),
                child: Text(
                  "نهاية شوط",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Circular",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, right: 0, left: 100),
                child: Text(
                  viewModel.currentMatchData.scores.ftScore.toString() ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Circular",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.96,
            child: Divider(
                color: Color.fromRGBO(255, 255, 255, 1), thickness: 0.5),
          ),
        ],
      ),
    );
    // return Container(
    //   height: 30,
    //   color: (ThemeService().theme.toString() == "ThemeMode.dark")
    //       ? Colors.black
    //       : Colors.grey,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Stack(
    //         alignment: AlignmentDirectional.center,
    //         clipBehavior: Clip.none,
    //         children: [
    //           Row(
    //
    //             children: [
    //               Container(
    //                 // padding: EdgeInsets.only(right: 250, left: 0),
    //                 child: Text(
    //                   // "نهاية شوط",
    //                   viewModel.currentMatchData.scores.ftScore.toString(),
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 20,
    //                     fontFamily: "Circular",
    //                     fontWeight: FontWeight.w500,
    //                   ),
    //                 ),
    //               ),
    //
    //             ],
    //           ),
    //           Positioned(
    //             top: 25,
    //             child: Container(
    //               child: Image.asset(
    //                 'assets/images/line.png',
    //                 color: (ThemeService().theme.toString() == "ThemeMode.dark")
    //                     ? Colors.white
    //                     : Colors.black,
    //                 width: 25,
    //                 height: 20,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}

class NewLogWidget extends StatelessWidget {
  const NewLogWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.reset();
                    Get.back();
                    // Navigator.pop(context);
                  },
                  child: Container(
                      height: 23.62,
                      width: 13.5,
                      child: Icon(Icons.navigate_before,
                          color: Theme.of(context).buttonColor))),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Color(4288880644), BlendMode.modulate),
                  image: AssetImage(
                    'assets/images/app_logo.png',
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
