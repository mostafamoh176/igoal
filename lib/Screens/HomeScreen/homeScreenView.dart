import 'dart:convert';
import 'dart:ui' as ui;

import 'package:app_igoal/Screens/Description/descriptionView.dart';
import 'package:app_igoal/Screens/HomeScreen/homeScreenModel.dart';
import 'package:app_igoal/Screens/HomeScreen/homeScreenViewModel.dart';
import 'package:app_igoal/Screens/Home_4/home4View.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/main.dart';
import 'package:app_igoal/serivces/networks/Loader.dart';
import 'package:app_igoal/time_ago.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeScreenView extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();
  List<dynamic> updatematchstatus = <dynamic>[];

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<HomeScreenView> {
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  String swipeDirection;
  var Definitions = [
    'NS',
    'LIVE',
    'HT',
    'FT',
    'FT_PEN',
    'ET',
    'PEN_LIVE',
    'AET',
    'BREAK',
    'FT_PE',
    'CANCL',
    'POSTP',
    'INT',
    'ABAN',
    'SUSP',
    'AWARDED',
    'DELAYED',
    'TBA',
    'WO',
    'AU',
    'Deleted'
  ];
  static const _adUnitID = "ca-app-pub-3940256099942544/8135179316";
  final _nativeAdController = NativeAdmobController();
 Timer time;
  @override
  void initState() {
    super.initState();
    TimerMatchUpdate();
  }
  @override
  void dispose() {
       print("league['id']## dispose" );
     time.cancel();
    super.dispose();
  }


  TimerMatchUpdate() {
    getstatus();
    time=Timer.periodic(Duration(seconds: 35), (timer) => getstatus());
  }

  getstatus() async {
    final response = await http
        .get(Uri.parse("https://limitless-sierra-19130.herokuapp.com/"));
    List<dynamic> status = <dynamic>[];
    if (response.statusCode == 200) {
      status = json.decode(response.body);
      if (status.length > 0) setState(() => widget?.updatematchstatus = status);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenViewModel>(
        init: HomeScreenViewModel(),
        builder: (vieWModel) {
          return (vieWModel.viewState == ViewState.Idle) ?
            Scaffold(
              backgroundColor:  (ThemeService().theme.toString() == "ThemeMode.dark")
                  ? Colors.black
                  : Colors.white,
              appBar: new AppBar(
                iconTheme: IconThemeData(
                    color: (ThemeService().theme.toString() ==
                            "ThemeMode.dark")
                        ? Colors.white
                        : Colors.black),
                backgroundColor:
                    (ThemeService().theme.toString() == "ThemeMode.dark")
                        ? Colors.black
                        : Colors.white,
                elevation: 0,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 30, 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(Color(4288880644), BlendMode.modulate),
                        image: AssetImage(
                          'assets/images/app_logo.png',
                        ),
                      )),
                    ),
                  ),
                ),
                leading: InkWell(
                  onTap: (){
                    ThemeService().switchTheme();
                    setState(() {

                    });
                  },
                  child: (ThemeService().theme.toString() ==
                      "ThemeMode.dark")
                      ? Image.asset(
                    'assets/images/sun.png',
                    height: 26,
                    width: 26,
                    color: Theme.of(context).buttonColor,
                  )
                      : Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          child: Image.asset(
                    "assets/images/moon.png",
                    height: 26,
                    width: 26,
                    color: Theme.of(context).buttonColor,
                  ),
                        ),
                      ),),
              ),

             /* drawer: Container(
                width: 200,
                child: new Drawer(
                    child: new ListView(
                  children: <Widget>[
                    new Divider(),
                    // new DrawerHeader(
                    //   child: new Text('القائمة'),
                    // ),
                    ListTile(
                      trailing: (ThemeService().theme.toString() ==
                              "ThemeMode.dark")
                          ? Image.asset(
                              'assets/images/sun.png',
                              height: 26,
                              width: 26,
                              color: Theme.of(context).buttonColor,
                            )
                          : Image.asset(
                              "assets/images/moon.png",
                              height: 26,
                              width: 26,
                              color: Theme.of(context).buttonColor,
                            ),
                      title: (ThemeService().theme.toString() ==
                              "ThemeMode.dark"
                          ? const Text(
                              'الوضع العادي',
                              textAlign: TextAlign.center,
                            )
                          : const Text(
                              'الوضع الليلي',
                              textAlign: TextAlign.center,
                            )),
                      onTap: () {
                        ThemeService().switchTheme();
                        setState(() {

                        });
                      },
                    ),
                    // InkWell(
                    //   child: (ThemeService().theme.toString() ==
                    //           "ThemeMode.dark")
                    //       ? Image.asset(
                    //           'assets/images/sun.png',
                    //           height: 26,
                    //           width: 26,
                    //           color: Theme.of(context).buttonColor,
                    //         )
                    //       : Image.asset(
                    //           "assets/images/moon.png",
                    //           height: 26,
                    //           width: 26,
                    //           color: Theme.of(context).buttonColor,
                    //         ),
                    //   onTap: () {
                    //     ThemeService().switchTheme();
                    //   },
                    // ),
                    // new ListTile(
                    //   title: new Text('First Menu Item'),
                    //   onTap: () {},
                    // ),

                    new Divider(),
                    // new ListTile(
                    //   title: new Text('About'),
                    //   onTap: () {},
                    // ),
                  ],
                )),
              ),*/
              body: Container(
                child: Column(
                  children: [
                    (vieWModel.currentMatchesDataList.isNotEmpty)
                        ? Container(
                            height: Get.height * 0.125,
                            child: getCarouselSlider(vieWModel),
                          )
                        : Container(
                          // color: Colors.white,
                           height: Get.height * 0.125,
                            width: MediaQuery.of(context).size.width,
                          ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: Get.height * 0.07,
                      // height:MediaQuery.of(context).size.height*0.1,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).backgroundColor,
                      ),
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomNewTabBarItem(
                              title: 'Recent',
                              isSelected: vieWModel.isTabSelected_1,
                              titleSize: 18,
                              onTap: () {
                                vieWModel.onTab1Changed();
                                //print(vieWModel.isTabSelected_1);
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomNewTabBarItem(
                              title: 'Objectives',
                              isSelected: vieWModel.isTabSelected_2,
                              titleSize: 18,
                              onTap: () {
                                vieWModel.onTab2Changed();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child:vieWModel.isTabSelected_1 ?
                    Column(children: [
                      SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        // child:Container()
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                                child:
                                vieWModel.newsList==null ? Container(child:Center(child:CircularProgressIndicator())):
                                Row(children: List.generate(vieWModel.newsList.length, (index) => homeScreenFirstItem(vieWModel, index)),)),
                          )
                        ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          vieWModel.newsVideoList==null ? Container(child:Center(child:CircularProgressIndicator()))
                              :
                          Carousel(
                            images: [
                              vieWModel.newsVideoList.length==0 ? Center(child: CircularProgressIndicator()) : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: homeScreenSecondItem(vieWModel, 0)),
                                  Expanded(
                                      child: homeScreenSecondItem(vieWModel, 1)),
                                ],
                              ),
                              vieWModel.newsVideoList.length==0 ? Center(child: CircularProgressIndicator()) : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: homeScreenSecondItem(vieWModel, 2)
                                  ),
                                  Expanded(
                                      child: homeScreenSecondItem(vieWModel, 3)
                                  ),
                                ],
                              ),
                            ],
                            dotSize: 0,
                            dotSpacing: 15.0,
                            dotColor: Colors.lightGreenAccent,
                            indicatorBgPadding: 5.0,
                            dotBgColor: Colors.transparent,
                            borderRadius: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(4),
                          width: double.infinity,
                          height: Get.height * 0.1,
                          child: NativeAdmob(
                            adUnitID: _adUnitID,
                            numberAds: 3,
                            controller: _nativeAdController,
                            type: NativeAdmobType.banner,
                          ),
                        ),
                      ),
                    ],)
                          :
                      Column(
                        children: [
                          SizedBox(
                            height: 19,
                          ),
                          (vieWModel.newsVideoList != null)
                              ? Expanded(
                                child: Container(
                            // color: Colors.red,
                            width:MediaQuery.of(context).size.width,
                            child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: vieWModel.newsVideoList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // return Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Container(color: Colors.yellow,),
                                  // );
                                  return Container(

                                    child: homeScreenSecondItem(vieWModel, index),
                                  );
                                },
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            ),
                          ),
                              )
                              : Container(),
                        ],
                      ),
                    ),
                    /**
                    GestureDetector(
                        onHorizontalDragEnd:
                            (DragEndDetails details) {
                          if (details.primaryVelocity > 0) {
                            if (vieWModel.isTabSelected_2 == true) {
                              vieWModel.onTab1Changed();
                            }
                          }
                          else if (details.primaryVelocity < 0) {
                            if (vieWModel.isTabSelected_1 == true) {
                              vieWModel.onTab2Changed();
                            }
                          }
                        },
                        child: vieWModel.isTabSelected_1 == true
                            ? Column(
                              children: [
                                (vieWModel.newsList != null)
                                    ? Container(
                                        height: 160,
                                        child: ListView.builder(
                                          scrollDirection:
                                              Axis.horizontal,
                                          itemCount: vieWModel
                                              .newsList.length,
                                          itemBuilder:
                                              (BuildContext
                                                      context,
                                                  int index) {
                                            return homeScreenFirstItem(
                                                vieWModel, index);
                                          },
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 12,
                                ),



                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(4),
                                    width: double.infinity,
                                    height: Get.height * 0.1,
                                    child: NativeAdmob(
                                      adUnitID: _adUnitID,
                                      numberAds: 3,
                                      controller:
                                          _nativeAdController,
                                      type: NativeAdmobType.banner,
                                    ),
                                  ),
                                ),
                              ],
                            )


                            : Column(
                                children: [
                                  SizedBox(
                                    height: 19,
                                  ),
                                  (vieWModel.newsVideoList != null)
                                      ? Container(
                                          height: 190,
                                          width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width,
                                          child: ListView.builder(
                                            scrollDirection:
                                                Axis.horizontal,
                                            itemCount: vieWModel
                                                .newsVideoList.length,
                                            itemBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return homeScreenSecondItem(
                                                  vieWModel, index);
                                            },
                                          ),
                                        )
                                      : Container(),
                                ],
                              )

                    )
                     */
                  ],
                ),
              ),
            )
          :
            vieWModel.viewState == ViewState.Busy
                ? Positioned.fill(child: Loading())
                : Container();
        },
      autoRemove: false,
        );
  }

  Widget getCarouselSlider(HomeScreenViewModel vieWModel) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 110,
        enlargeCenterPage: false,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 10),
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: Duration(
          seconds: 3,
        ),
      ),

      items: vieWModel.currentMatchesDataList
          .asMap()
          .entries
          .map((e) => homeScreenMatchItem(context,
              vieWModel.currentMatchesDataList[e.key], vieWModel, e.key))
          .toList(),
      // itemCount:
      // vieWModel.currentMatchesDataList.length,
      // itemBuilder: (context, index, realIdx) {
      //   return homeScreenMatchItem(
      //       context,
      //       vieWModel
      //           .currentMatchesDataList[index],
      //       vieWModel,
      //       index);
      // },
    );
  }

  Widget bottomItem(HomeScreenViewModel viewModel, int index) {
    return InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        Get.to(() => DescriptionView(
              newsDetail: viewModel.myArticlesList[index],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: Image.network(
                      viewModel.myArticlesList[index]['nesimgurl']),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.myArticlesList[index]['newsshortdesc'],
                      style: Theme.of(context).primaryTextTheme.headline1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(viewModel.myArticlesList[index]['newstitle'],
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget homeScreenSecondItem(HomeScreenViewModel viewModel, int index,{double padding:5}) {
    // logger
    //     .i("viewModel.newsVideoList.length ${viewModel.newsVideoList.length}");
    if (viewModel.newsVideoList.length == 0) {
      return Container(child:Center(child:Center(child: CircularProgressIndicator())));
    }
    return Padding(
      padding:  EdgeInsets.all(padding),
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          showCustomDialog(
              context, viewModel, viewModel.newsVideoList[index]['url'],
              title: "هذا سوف يترك التطبيق", okBtnFunction: () {});
        },
        child: Container(
              decoration: BoxDecoration(
              // color: Colors.white,
              color: Color(0xff5f5d5d),
              borderRadius: BorderRadius.all(Radius.circular(20)),),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Expanded(
                  child: Container(
                    // height: 100,
                    // width: Get.width *0.5,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      color: Color(0xff5f5d5d),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: MemoryImage(Uri
                              .parse(viewModel
                              .newsVideoList[index]["image64"]
                              .toString() ??
                              "")
                              .data
                              .contentAsBytes())),
                    ),
                  ),
                ),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Text(
                        TimeAgo.timeAgoSinceDate(DateFormat('dd-MM-yyyy h:mma').format(viewModel.newsVideoList[index]['urldate'].toDate()),),
                        style:TextStyle(color:Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                  child: Directionality(
                    textDirection: ui.TextDirection.rtl,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            viewModel.newsVideoList[index]['title'],
                              // maxLines: 1,
                            style: Theme
                                .of(context)
                                .primaryTextTheme
                                .subtitle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ],),
              Positioned(
                top: 7,
                left: 20,
                child: Container(
                  height: 17,
                  width: 51,
                  decoration: BoxDecoration(
                      color: Color(0xffDA1A1A),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Hot',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeScreenFirstItem(HomeScreenViewModel viewModel, int index) {
    return InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        Get.to(() => DescriptionView(
              newsDetail: viewModel.newsList[index],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: Container(
          // height: Get.height * 0.18,
          width: Get.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff1B1B1B),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff000000).withOpacity(0),
                          Color(0xff000000).withOpacity(1)
                        ]).createShader(bounds);
                  },
                  blendMode: BlendMode.darken,
                  child: Container(
                    width: Get.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Color(0xff1B1B1B),
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(viewModel.newsList[index]['nesimgurl']),
                        )),

                  ),
                ),
              ),
              Container(

                width: Get.width * 0.7,


                padding: EdgeInsets.only(right: 24),
                child: Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:25),
                        child: Text(
                          viewModel.newsList[index]['newstitle']??"",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget homeScreenMatchItem(
      BuildContext context,
      CurrentMatchesData currentMatchesData,
      HomeScreenViewModel viewModel,
      int index) {
    return InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        print("currentMatchesData.id.toString()" +
            currentMatchesData.id.toString());

        Get.to(() => Home4View(
              id: currentMatchesData.id.toString(),
              seasonid: currentMatchesData.seasonId.toString(),
            ));
      },
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  teamImageItem(currentMatchesData.localTeam.data.logoPath),
                  SizedBox(
                    height: 7,
                  ),
                  InkWell(
                    splashColor:Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor:Colors.transparent,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {},
                    child: Text(
                      viewModel.leagueName[
                                  currentMatchesData.localTeam.data.name] !=
                              null
                          ? viewModel.leagueName[
                              currentMatchesData.localTeam.data.name]
                          : currentMatchesData.localTeam.data.name,
                      // viewModel.countriesArabic.where((o) => o['id'].toString() == currentMatchesData.localTeam.data.countryId.toString()).toList()[0]['name'].toString(),
                      style: Theme.of(context).primaryTextTheme.headline1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    (this.Definitions.indexOf(
                                    currentMatchesData.time.status.toString()) >
                                -1 &&
                            (currentMatchesData.time.status == 'FT' ||
                                currentMatchesData.time.status == 'HT' ||
                                currentMatchesData.time.status == 'FT_PEN'))
                        ? Text(
                            currentMatchesData.scores.localteamScore
                                    .toString() ??
                                "",
                            style: TextStyle(
                              fontSize: 36,
                              color: Color(0xffD7191D),
                                fontWeight: FontWeight.bold
                            ),
                          )
                        : Text(
                            currentMatchesData.time.status == 'LIVE'
                                ? (widget.updatematchstatus
                                            .where((element) =>
                                                element['id'] ==
                                                currentMatchesData.id)
                                            .toList()
                                            .length >
                                        0
                                    ? widget.updatematchstatus
                                            .where((element) =>
                                                element['id'] ==
                                                currentMatchesData.id)
                                            .toList()[0]['scores']
                                                ['localteam_score']
                                            .toString() ??
                                        ""
                                    : currentMatchesData.scores.localteamScore
                                            .toString() ??
                                        "")
                                : currentMatchesData.scores.localteamScore
                                        .toString() ??
                                    "",
                            style: TextStyle(
                              fontSize: 36,
                              color: Color(0xffD7191D),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                    Text(
                      '  :  ',
                      style: TextStyle(fontSize: 36, color: Color(0xffD7191D),
                      fontWeight: FontWeight.bold
                      ),
                    ),


                    (this.Definitions.indexOf(
                                    currentMatchesData.time.status.toString()) >
                                -1 &&
                            (currentMatchesData.time.status == 'FT' ||
                                currentMatchesData.time.status == 'HT' ||
                                currentMatchesData.time.status == 'FT_PEN'))
                        ? Text(
                            currentMatchesData.scores.visitorteamScore
                                    .toString() ??
                                "",
                            style: TextStyle(
                              fontSize: 36,
                              color: Color(0xffD7191D),
                                fontWeight: FontWeight.bold

                            ),
                          )
                        : Text(
                            currentMatchesData.time.status == 'LIVE'
                                ? (widget.updatematchstatus
                                            .where((element) =>
                                                element['id'] ==
                                                currentMatchesData.id)
                                            .toList()
                                            .length >
                                        0
                                    ? widget.updatematchstatus
                                            .where((element) =>
                                                element['id'] ==
                                                currentMatchesData.id)
                                            .toList()[0]['scores']
                                                ['visitorteam_score']
                                            .toString() ??
                                        ""
                                    : currentMatchesData.scores.visitorteamScore
                                            .toString() ??
                                        "")
                                : currentMatchesData.scores.visitorteamScore
                                        .toString() ??
                                    "",
                            style: TextStyle(
                                fontSize: 36, color: Color(0xffD7191D),
                                fontWeight: FontWeight.bold

                            )
                      ,
                          ),
                    // (currentMatchesData.time.status == 'LIVE'
                    //     ? Text(widget.updatematchstatus
                    //     .where((element) =>
                    // element['id'] == currentMatchesData.id)
                    //     .toList()
                    //     .length >
                    //     0
                    //     ? widget.updatematchstatus
                    //     .where((element) =>
                    // element['id'] == currentMatchesData.id)
                    //     .toList()[0]['scores']['visitorteamScore']
                    //     .toString()
                    //     :
                    // currentMatchesData.scores.visitorteamScore.toString(),
                    //   style: TextStyle(fontSize: 36, color: Color(0xffD7191D),),),),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                // Text(currentMatchesData.time.startingAt.time, style: Theme.of(context).primaryTextTheme.headline1,),
                // Text(DateFormat.jm().format(DateTime.parse("2021-01-01 "+currentMatchesData.time.startingAt.time,)), style: Theme.of(context).primaryTextTheme.headline1,),

                (this.Definitions.indexOf(
                                currentMatchesData.time.status.toString()) >
                            -1 &&
                        (currentMatchesData.time.status == 'FT' ||
                            currentMatchesData.time.status == 'HT' ||
                            currentMatchesData.time.status == 'FT_PEN'))
                    ? Text(currentMatchesData.time.status)
                    //widget.status.where((o) => o['id'].toString() =="17958535").toString()
                    : (currentMatchesData.time.status == 'LIVE'
                        ? Text(widget.updatematchstatus
                                    .where((element) =>
                                        element['id'] == currentMatchesData.id)
                                    .toList()
                                    .length >
                                0
                            ? widget.updatematchstatus
                                    .where((element) =>
                                        element['id'] == currentMatchesData.id)
                                    .toList()[0]['time']['minute']
                                    .toString() ??
                                ""
                            : currentMatchesData.time.minute.toString() ?? "")
                        : Text(
                            DateFormat.jm().format(DateTime.parse(
                              "2021-01-01 " +
                                  currentMatchesData.time.startingAt.time,
                            )),
                            style: Theme.of(context).primaryTextTheme.headline1,
                          )),

                // Text(DateFormat.H().format(DateTime.parse("2021-01-01 "+viewModel.fixturesGames[index]['time']['starting_at']['time'])),style: Theme.of(context).primaryTextTheme.headline6,)
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  teamImageItem(currentMatchesData.visitorTeam.data.logoPath),
                  SizedBox(
                    height: 7,
                  ),
                  InkWell(
                    splashColor:Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor:Colors.transparent,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {},
                    child: Text(
                      viewModel.leagueName[
                                  currentMatchesData.visitorTeam.data.name] !=
                              null
                          ? viewModel.leagueName[
                              currentMatchesData.visitorTeam.data.name]
                          : currentMatchesData.visitorTeam.data.name,
                      style: Theme.of(context).primaryTextTheme.headline1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container teamImageItem(String path) {
    return Container(
        height: 45,
        width: 45,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
        child: Image.network(
          path ?? 'https://via.placeholder.com/150',
          fit: BoxFit.cover,
        ));
  }

  showCustomDialog(
      BuildContext context, HomeScreenViewModel viewModel, dynamic data,
      {@required String title, @required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            title: Directionality(
                textDirection: ui.TextDirection.rtl,
                child: Text(
                  title,
                  style: Theme.of(context).primaryTextTheme.headline1,
                )),
            content: Directionality(
                textDirection: ui.TextDirection.rtl,
                child: Text(
                  "تتم استضافة هذا الفيديو بواسطة موقع ويب خارجي. الهدف ليس مسؤولاً عن المحتوى الذي توشك على مشاهدته",
                  style: Theme.of(context).primaryTextTheme.headline1,
                )),
            actions: <Widget>[
              InkWell(
                splashColor:Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor:Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  widget.browser.openUrlRequest(
                      urlRequest: URLRequest(url: Uri.parse(data)),
                      options: options);
                  // viewModel.launchURL(data);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffD7191D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: Text(
                            'مشاهدة فيديو',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget homeScreenVulgarisItem(HomeScreenViewModel viewModel, int index) {
    return InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        Get.to(() => DescriptionView(
              newsDetail: viewModel.newsVulagrisList[index],
            ));
        // showCustomDialog(context,viewModel,viewModel.newsVideoList[index]['url'] ,title:"This will Leave Application",okBtnFunction: (){});
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Container(
          height: 200,
          width: 195,
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 195,
                decoration: BoxDecoration(
                    color: Colors.white,
                    //color: Color(0xff1B1B1B),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 195,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //color: Color(0xff1B1B1B),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(viewModel
                                .newsVulagrisList[index]['nesimgurl'])),
                      ),
                    ),
                    Positioned(
                      top: 7,
                      left: 20,
                      child: Container(
                        height: 17,
                        width: 51,
                        decoration: BoxDecoration(
                            color: Color(0xffDA1A1A),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Hot',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: Directionality(
                    textDirection: ui.TextDirection.rtl,
                    child: Container(
                      height: 94,
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              viewModel.newsVulagrisList[index]['newstitle'],
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}
