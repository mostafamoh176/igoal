import 'dart:async';
import 'package:app_igoal/Screens/ClubPlayers/clubPlayersView.dart';
import 'package:app_igoal/Screens/Countries/countriesView.dart';
import 'package:app_igoal/Screens/NextMatches/nextMatchesViewModel.dart';
import 'package:app_igoal/const.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/main.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

Timer _timer;

int start = 10;

class NextMatchesView extends StatefulWidget {
  @override
  _NextMatchesViewState createState() => _NextMatchesViewState();
}

class _NextMatchesViewState extends State<NextMatchesView> {
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
  bool checkBox4 = false;
  bool checkBox5 = false;
  bool checkBox6 = false;
  bool checkBox7 = false;
  bool checkBox8 = false;

  final date2 = DateTime.now();

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<NextMatchesViewModel>(
  //       key: UniqueKey(),
  //       init: NextMatchesViewModel(),
  //       builder: (viewModel) {
  //         return SafeArea(
  //             key: UniqueKey(),
  //             bottom: false,
  //             top: false,
  //             child: Scaffold(
  //                 backgroundColor:
  //                     (ThemeService().theme.toString() == "ThemeMode.dark")
  //                         ? Colors.black
  //                         : Colors.white,
  //                 body: Container(
  //                   child: Text(
  //                     '\n\n${viewModel.fixturesGames[0]['time']['minute'].toString()}',
  //                   ),
  //                 )));
  //       });
  // }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.e("_NextMatchesViewState");
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NextMatchesViewModel>(
        key: UniqueKey(),
        init: NextMatchesViewModel(),
        builder: (viewModel) {

          return SafeArea(
            key: UniqueKey(),
            bottom: false,
            top: false,
            child: Scaffold(
              backgroundColor:
                  (ThemeService().theme.toString() == "ThemeMode.dark")
                      ? Colors.black
                      : Colors.white,
              body: Column(
                key: UniqueKey(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Row(
                    key: UniqueKey(),
                    children: [
                      // backBtn(),
                      Expanded(child: topImageLogo()),
                    ],
                  ),
                  topBarWidget(context, viewModel),
                  Expanded(
                    child: Container(
                        key: UniqueKey(),
                        child: Stack(
                          key: UniqueKey(),
                          children: [

                            //  for(int i=0;i<viewModel.fixturesGames.length;i++)
                            //   Padding(
                            //     padding: const EdgeInsets.all(5.0),
                            //     child: matchItem(context, viewModel, i),
                            //   ),
                            ListView.builder(
                              key: UniqueKey(),
                              padding: EdgeInsets.all(5),
                              itemCount: viewModel.fixturesGames.length,
                              itemBuilder: (BuildContext context, int index) {
                                return matchItem(context, viewModel, index);
                                // return Column(
                                //   children: [
                                //     Expanded(child: matchItem(context, viewModel, index)),
                                //     Expanded(
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(8.0),
                                //         child: Column(
                                //           children: [
                                //             CountdownTimer(
                                //               // endTime: viewModel.endTime,
                                //               endTime: DateTime.parse(viewModel
                                //                               .fixturesGames[
                                //                           viewModel.fixturesGames
                                //                                   .length -
                                //                               1]['time'][
                                //                       'starting_at']['date_time'])
                                //                   .millisecondsSinceEpoch,
                                //               widgetBuilder: (_,
                                //                   CurrentRemainingTime time) {
                                //                 if (time == null) {
                                //                   // viewModel.endTime =
                                //                   // DateTime.parse(viewModel.fixturesGames[viewModel.fixturesGames.length-1]
                                //                   //             ['time']['starting_at']['date_time'])
                                //                   // .millisecondsSinceEpoch;
                                //                   viewModel
                                //                       .endTime = (DateTime.now()
                                //                           .millisecondsSinceEpoch +
                                //                       1000 * 60);
                                //                   // viewModel.getFavouritiesData();
                                //                   // viewModel.getFixturesGame();
                                //                   viewModel
                                //                       .getFixturesGameUpdate();
                                //                   //viewModel.getTimerData();
                                //                   return Container(
                                //                     key: UniqueKey(),
                                //                     child: Text('0',
                                //                         style: Theme.of(context)
                                //                             .primaryTextTheme
                                //                             .headline2,
                                //                         overflow: TextOverflow
                                //                             .ellipsis),
                                //                   );
                                //                 }
                                //                 return (viewModel.fixturesGames[
                                //                                         index]
                                //                                     ['time']
                                //                                 ['status'] ==
                                //                             "LIVE" ||
                                //                         viewModel.fixturesGames[
                                //                                         index]
                                //                                     ['time']
                                //                                 ['status'] ==
                                //                             "HT")
                                //                     ? Container(
                                //                         key: UniqueKey(),
                                //                         child: Text("0",
                                //                             style: Theme.of(
                                //                                     context)
                                //                                 .primaryTextTheme
                                //                                 .headline2),
                                //                       )
                                //                     : Container(
                                //                         key: UniqueKey(),
                                //                         child: Text(
                                //                             time.sec.toString(),
                                //                             style: Theme.of(
                                //                                     context)
                                //                                 .primaryTextTheme
                                //                                 .headline2,
                                //                             overflow:
                                //                                 TextOverflow
                                //                                     .ellipsis),
                                //                       );
                                //               },
                                //             ),
                                //             // Text((DateTime.now().difference(DateTime.parse(viewModel.fixturesGames[index]['time']['starting_at']['date_time'])).inMinutes).toString(),
                                //             //   overflow: TextOverflow.ellipsis,
                                //             //   style: Theme.of(context).primaryTextTheme.headline2,),
                                //             SizedBox(
                                //               height: 2,
                                //             ),
                                //             Text(
                                //               'ثانية',
                                //               style: TextStyle(
                                //                   fontSize: 16,
                                //                   color: Color(0xff5F5F5F),
                                //                   fontWeight: FontWeight.w400),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // );
                              },
                            )

                            // else(viewModel.viewState == ViewState.Busy
                            //       ? Positioned.fill(child: Loading())
                            //       : Container()),
                          ],
                        ),
                        ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget topBarWidget(BuildContext context, NextMatchesViewModel viewModel) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xFF8A0F11), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.4,
            padding: EdgeInsets.only(left: 20),
            child: Text(
              " المباراة القادمة",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
          InkWell(
            splashColor:Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor:Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {
              //print(viewModel.favoriteLeagues.length);
              _modalBottomSheet(context, viewModel);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 5.5,
              child: Center(
                child: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/images/plus.png')),
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            width: MediaQuery.of(context).size.width / 2.6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
          // itemCount: 2,
              itemCount: viewModel.favoriteLeagues.length,
              itemBuilder: (BuildContext context, int index) {
                // favouriteItems(
                //   viewModel.favoriteLeagues[index], viewModel);
                return

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                         // "aa",
                           viewModel.favoriteLeagues[index]['Arleagues'].toString(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width:5),
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Image.network(
                          viewModel.favoriteLeagues[index]['logo_path'],
                        // "https://cdn.sportmonks.com/images//soccer/teams/24/10264.png",
                          width: 25,
                          height: 25,
                        ),
                      ),


                    ],
                ),
                  );

                  //Text("lenght  ${viewModel.favoriteLeagues.length} heading ${viewModel.favoriteLeagues[index]}");

                  // favouriteItems(
                  //   viewModel.favoriteLeagues[index], viewModel);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget favouriteItems(
      dynamic favouriteLeague, NextMatchesViewModel viewModel) {
    print("============favouriteLeague ${ favouriteLeague['Arleagues'].toString()}===========");
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              child: Text(
               "cheking ${favouriteLeague}",
                //favouriteLeague['Arleagues'].toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 2),
            Container(
              alignment: AlignmentDirectional.center,
              child: Image.network(
               // favouriteLeague['logo_path'],
               "https://cdn.sportmonks.com/images//soccer/teams/24/10264.png",
                width: 25,
                height: 25,
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget matchItem(
      BuildContext context, NextMatchesViewModel viewModel, index) {
    return GetBuilder<NextMatchesViewModel>(
        key: UniqueKey(),
        init: NextMatchesViewModel(),
        builder: (viewModel) {
        return Container(
          key: UniqueKey(),
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(20)),
          height: 315.0,
          //height: MediaQuery.of(context).size.height*0.48,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    'assets/images/bell (1).svg',
                                    fit: BoxFit.cover,
                                    color: (viewModel.isGetMatchNotification
                                                .where((element) =>
                                                    element['SubID'].toString() ==
                                                    viewModel.fixturesGames[index]
                                                            ['id']
                                                        .toString())
                                                .toList()
                                                .length >
                                            0)
                                        ? Colors.red
                                        : Theme.of(context).buttonColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(shape: BoxShape.circle),
                                child: Image.network(
                                  viewModel.fixturesGames[index]['league']['data']['logo_path'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor:Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor:Colors.transparent,
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                                onTap: () {
                                  _modalSettingSheet(
                                      context,
                                      viewModel,
                                      viewModel.fixturesGames[index]['id']
                                          .toString());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    child: SvgPicture.asset(
                                      'assets/images/settings (4).svg',
                                      fit: BoxFit.cover,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.purple,
                        //height: (128+52+104).toDouble(),
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor:Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    highlightColor:Colors.transparent,
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      // height: MediaQuery.of(context).size.height*0.22,
                                      // width: MediaQuery.of(context).size.width*0.22,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.network(
                                        viewModel.fixturesGames[index]['localTeam']
                                            ['data']['logo_path'],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    onTap: () {
                                      Get.to(() => ClubPlayersView(
                                            teamId: viewModel.fixturesGames[index]
                                                    ['localTeam']['data']['id']
                                                .toString(),
                                          ));
                                    },
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            viewModel.leagueName[viewModel
                                                        .fixturesGames[index]
                                                            ['localTeam']['data']
                                                            ['name']
                                                        .toString()] !=
                                                    null
                                                ? viewModel.leagueName[viewModel
                                                    .fixturesGames[index]['localTeam']
                                                        ['data']['name']
                                                    .toString()]
                                                : viewModel.fixturesGames[index]
                                                        ['localTeam']['data']['name']
                                                    .toString(),
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .subtitle1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                key: UniqueKey(),
                                //height: MediaQuery.of(context).size.height*0.24,
                                child: Column(
                                  key: UniqueKey(),
                                  children: [
                                    SizedBox(
                                      height: 6,
                                    ),
                                    AutoSizeText(
                                      viewModel.leagueName[viewModel
                                                  .fixturesGames[index]['league_id']
                                                  .toString()] !=
                                              null
                                          ? viewModel.leagueName[viewModel
                                              .fixturesGames[index]['league_id']
                                              .toString()]
                                          : viewModel.fixturesGames[index]['league']
                                              .toString(),
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle1,
                                      minFontSize: 6,
                                      maxLines: 1,
                                    ),
                                    Expanded(
                                      child: Container(
                                        key: UniqueKey(),
                                        width: double.infinity,
                                        // color: Colors.greenAccent,
                                        child: Column(
                                          key: UniqueKey(),
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              key: UniqueKey(),
                                              child: (viewModel.fixturesGames[index]
                                                              ['time']['status'] ==
                                                          "LIVE" ||
                                                      viewModel.fixturesGames[index]
                                                              ['time']['status'] ==
                                                          "HT" ||
                                                      viewModel.fixturesGames[index]
                                                              ['time']['status'] ==
                                                          "ET" ||
                                                      viewModel.fixturesGames[index]
                                                              ['time']['status'] ==
                                                          "PEN_LIVE")
                                                  ? Container(
                                                      key: UniqueKey(),
                                                      child:
                                                      (
                                                      viewModel.fixturesGames[index]
                                                              ['time']['status'] ==
                                                          "HT" ||
                                                      viewModel.fixturesGames[index]
                                                              ['time']['status'] ==
                                                          "ET" ||
                                                      viewModel.fixturesGames[index]
                                                              ['time']['status'] ==
                                                          "PEN_LIVE")?
                                                           Text(viewModel.fixturesGames[index]['time']["status"].toString(),style: Theme.of(context).primaryTextTheme.headline6,):
                                                       Text(viewModel.fixturesGames[index]['time']["minute"].toString(),style: Theme.of(context).primaryTextTheme.headline6,),
                                                    )
                                                  : Container(
                                                      key: UniqueKey(),
                                                      child: Text(
                                                        DateFormat.jm().format(DateTime
                                                            .parse("2021-01-01 " +
                                                                viewModel.fixturesGames[
                                                                                index]
                                                                            ['time']
                                                                        [
                                                                        'starting_at']
                                                                    ['time'])),
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .headline6,
                                                      ),
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor:Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    highlightColor:Colors.transparent,
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      // height: MediaQuery.of(context).size.height*0.22,
                                      // width: MediaQuery.of(context).size.width*0.22,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.network(
                                        viewModel.fixturesGames[index]
                                            ['visitorTeam']['data']['logo_path'],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    onTap: () {
                                      Get.to(() => ClubPlayersView(
                                          teamId: viewModel.fixturesGames[index]
                                                  ['visitorTeam']['data']['id']
                                              .toString()));
                                    },
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            viewModel.leagueName[viewModel
                                                        .fixturesGames[index]
                                                            ['visitorTeam']['data']
                                                            ['name']
                                                        .toString()] !=
                                                    null
                                                ? viewModel.leagueName[viewModel
                                                    .fixturesGames[index]['visitorTeam']
                                                        ['data']['name']
                                                    .toString()]
                                                : viewModel.fixturesGames[index]
                                                        ['visitorTeam']['data']['name']
                                                    .toString(),
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .subtitle1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  (viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "LIVE" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "HT" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "ET" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "PEN_LIVE")
                                      ?  Container()
                                      : Text(
                                          (-1 *
                                                  (DateTime.now()
                                                      .difference(DateTime.parse(
                                                          viewModel.fixturesGames[
                                                                      index]['time']
                                                                  ['starting_at']
                                                              ['date_time']))
                                                      .inDays))
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color:white,fontSize: 35,fontWeight: FontWeight.bold)
                                        ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  (viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "LIVE" ||
                                              viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "HT")
                                          ? Container()
                                            
                                          :   Text(
                                    ' يوم ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  (viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "LIVE" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "HT" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "ET" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "PEN_LIVE")
                                      ? Text( (viewModel.fixturesGames[index]['scores']['localteam_score'].toString()=='null')?"0":viewModel.fixturesGames[index]['scores']['localteam_score'].toString(),
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline2)
                                      : Text(
                                          (-1 *
                                                  (DateTime.now()
                                                          .difference(DateTime.parse(
                                                              viewModel.fixturesGames[index]
                                                                          ['time']
                                                                      ['starting_at']
                                                                  ['date_time']))
                                                          .inHours -
                                                      (DateTime.now()
                                                              .difference(DateTime.parse(
                                                                  viewModel.fixturesGames[index]
                                                                              ['time']
                                                                          ['starting_at']
                                                                      ['date_time']))
                                                              .inDays) *
                                                          24))
                                              .toString(),
                                          style: TextStyle(color:white,fontSize: 35,fontWeight: FontWeight.bold)
                                        ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                    (viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "LIVE" ||
                                              viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "HT")
                                          ? Container()
                                            
                                          :  Text(
                                    ' ساعة ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  (viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "LIVE" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "HT" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "ET" ||
                                          viewModel.fixturesGames[index]['time']
                                                  ['status'] ==
                                              "PEN_LIVE")
                                      ? Text( (viewModel.fixturesGames[index]['scores']['visitorteam_score'].toString()=='null')?"0":viewModel.fixturesGames[index]['scores']['visitorteam_score'].toString(),
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline2)
                                      : Text(
                                          (-1 *
                                                  (DateTime.now()
                                                          .difference(DateTime.parse(
                                                              viewModel.fixturesGames[index]
                                                                          ['time']
                                                                      ['starting_at']
                                                                  ['date_time']))
                                                          .inMinutes -
                                                      (DateTime.now()
                                                              .difference(DateTime.parse(
                                                                  viewModel.fixturesGames[index]
                                                                              ['time']
                                                                          ['starting_at']
                                                                      ['date_time']))
                                                              .inHours) *
                                                          60))
                                              .toString(),
                                          style:TextStyle(color:white,fontSize: 35,fontWeight: FontWeight.bold)
                                        ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                   (viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "LIVE" ||
                                              viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "HT")
                                          ? Container()
                                            
                                          : Text(
                                    'دقيقة',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: white,
                                        fontWeight: FontWeight.w400),
                                  ), 
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CountdownTimer(
                                    // endTime: viewModel.endTime,
                                    endTime: DateTime.parse(viewModel.fixturesGames[
                                                viewModel.fixturesGames.length - 1]
                                            ['time']['starting_at']['date_time'])
                                        .millisecondsSinceEpoch,
                                    widgetBuilder: (_, CurrentRemainingTime time) {
                                      if (time == null) {
                                        // viewModel.endTime =
                                        // DateTime.parse(viewModel.fixturesGames[viewModel.fixturesGames.length-1]
                                        //             ['time']['starting_at']['date_time'])
                                        // .millisecondsSinceEpoch;
                                        viewModel.endTime =
                                            (DateTime.now().millisecondsSinceEpoch +
                                                1000 * 60);
                                        // viewModel.getFavouritiesData();
                                        // viewModel.getFixturesGame();
                                        viewModel.getFixturesGameUpdate();
                                        //viewModel.getTimerData();
                                        return Container(
                                          key: UniqueKey(),
                                          child: Text('0',
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2,
                                              overflow: TextOverflow.ellipsis),
                                        );
                                      }
                                      return (viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "LIVE" ||
                                              viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "HT")
                                          ? Container()
                                            
                                          : Container(
                                              key: UniqueKey(),
                                              child: Text(time.sec.toString(),
                                                  style: TextStyle(color:white,fontSize: 35,fontWeight: FontWeight.bold),
                                                  overflow: TextOverflow.ellipsis),
                                            );
                                    },
                                  ),
                                  // Text((DateTime.now().difference(DateTime.parse(viewModel.fixturesGames[index]['time']['starting_at']['date_time'])).inMinutes).toString(),
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: Theme.of(context).primaryTextTheme.headline2,),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  (viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "LIVE" ||
                                              viewModel.fixturesGames[index]['time']
                                                      ['status'] ==
                                                  "HT")
                                          ? Container()
                                            
                                          : Text(
                                    'ثانية',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Container(
                          height: 2,
                          //width: MediaQuery.of(context).size.width,
                          color: Color(0xff262626),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    'assets/images/calendar (1).svg',
                                    color: Theme.of(context).buttonColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                AutoSizeText(
                                  viewModel.onDateArabic(
                                      viewModel.fixturesGames[index]['time']
                                          ['starting_at']['date']),
                                  style:
                                      Theme.of(context).primaryTextTheme.subtitle2,
                                  minFontSize: 3,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    'assets/images/movie-tickets.svg',
                                    color: Theme.of(context).buttonColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    child: AutoSizeText(
                                  (viewModel.fixturesGames[index]['venue'] != null)
                                      ? viewModel.leagueName[
                                                  viewModel.fixturesGames[index]
                                                      ['venue']['data']['name']] !=
                                              null
                                          ? viewModel.leagueName[
                                              viewModel.fixturesGames[index]
                                                  ['venue']['data']['name']]
                                          : viewModel.fixturesGames[index]['venue']
                                              ['data']['name']
                                      : "",
                                  style:
                                      Theme.of(context).primaryTextTheme.subtitle2,
                                  minFontSize: 3,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                )),
                                // Expanded(child: AutoSizeText("jhkjhkjhkjhkjhkjkjhjhklhlkhkjhhkjhk",minFontSize: 3,maxLines: 1,overflow: TextOverflow.clip,))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 20,)
            ],
          ),
        );
      }
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
        child: Container(
            height: 23.62,
            width: 13.5,
            child: Icon(
              Icons.navigate_before,
              color: Colors.white,
            )));
  }

  Padding topImageLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.50,
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter:
                ColorFilter.mode(Color(4288880644), BlendMode.modulate),
            image: AssetImage('assets/images/app_logo.png'),
          )),
        ),
      ),
    );
  }

  void _modalBottomSheet(context, NextMatchesViewModel viewModel) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        // enableDrag: true,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              //margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: CountriesView(
                istrue: false,
              ),
            ),
          );
        }).whenComplete(() {
      print("Here");
      //viewModel.getFavouritiesData();
      //
      viewModel.getFavouritiesData();
      // viewModel.loadJsonData();
      // viewModel.signInAnonymously();
      // _nextMatchesViewModel=NextMatchesViewModel();
    });
  }

  void _modalSettingSheet(
    context,
    NextMatchesViewModel viewModel,
    String fixtureId,
  ) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Settings(
              userId: viewModel.notificationUserId, fixtureGameId: fixtureId);
        }).whenComplete(() {
      print("Here");
      viewModel.getFavouritiesData();
    });
  }
}

class Settings extends StatefulWidget {
  String userId;
  String fixtureGameId;
  Settings({this.userId, this.fixtureGameId});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsViewModel viewModel;
  @override
  void dispose() {
    // TODO: implement dispose
    viewModel.onNotificationSave();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsViewModel>(
        key: UniqueKey(),
        init: () {
          this.viewModel = SettingsViewModel(
              notificationId: widget.userId,
              fixtureGameId: widget.fixtureGameId);
          return viewModel;
        }(),
        builder: (viewModel) {
          return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            ////1
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/Start Match.png'),
                                    // Container(
                                    //   height: 35,
                                    //   width: 35,
                                    //   decoration: BoxDecoration(
                                    //       shape: BoxShape.circle,
                                    //       color: Colors.transparent
                                    //   ),
                                    //   child: SvgPicture.asset('assets/images/wall-clock.svg'),
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'البداية',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.startgame,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      checkColor: Colors.red,
                                      onChanged: (val) {
                                        print("CheckBox");
                                        // setState(() {
                                        //   if(val==true){
                                        //     checkBox1=true;
                                        //   }
                                        //   else if(val==false){
                                        //     checkBox1=false;
                                        //   }
                                        // });
                                        print(viewModel.startgame);
                                        viewModel.onCheckBox1Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //2
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/HalfTIme.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.grey
                                    //     ),
                                    //      child:SvgPicture.asset('assets/images/footballTime1.svg')
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "منتصف الوقت ",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.halfgame,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox2Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //3
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/End TIme.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.transparent
                                    //     ),
                                    //     child:SvgPicture.asset('assets/images/footballTimer.svg')
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "الوقت كامل",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.fullgame,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox3Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //4
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/Goal_Not.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.transparent
                                    //     ),
                                    //     child: ClipRRect(
                                    //       borderRadius: BorderRadius.circular(360),
                                    //       child: SvgPicture.asset('assets/images/game.svg'),
                                    //     )
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "الاهداف",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.goals,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox4Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //5
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/Red Card.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.transparent
                                    //     ),
                                    //     child:SvgPicture.asset('assets/images/redCard.svg')
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "كروت حمراء",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.redcard,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox5Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //6
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/Yellow Card.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.transparent
                                    //     ),
                                    //     child:SvgPicture.asset('assets/images/yellowCard.svg')
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "كروت صفراء",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.yellowcard,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox6Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //7
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/Penalty_Not.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.transparent
                                    //     ),
                                    //     child:SvgPicture.asset('assets/images/penalty.svg')
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "بلنتي",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.penalty,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox7Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //8
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/Map.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.transparent
                                    //     ),
                                    //     child:SvgPicture.asset('assets/images/plan.svg')
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "الخطة",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.plan,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox8Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //9
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/Change Player.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.transparent
                                    //     ),
                                    //     child:SvgPicture.asset('assets/images/transfer.svg')
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "التغيرات",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.subst,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox9Changed(val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //10
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/Reminder.png'),
                                    // Container(
                                    //     height: 35,
                                    //     width: 35,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         color: Colors.transparent
                                    //     ),
                                    //     child:SvgPicture.asset('assets/images/social-media.svg')
                                    // ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "تذكير قبل بالمباراة",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline1,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Spacer(),
                                    Checkbox(
                                      value: viewModel.reminderbeforematch,
                                      checkColor: Colors.red,
                                      activeColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      onChanged: (val) {
                                        viewModel.onCheckBox10Changed(val);
                                      },
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
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            viewModel.onUnSelectAll();
                          },
                          child: Container(
                            height: 70,
                            width: 200,
                            color: Colors.red,
                            child: Center(
                                child: Text(
                              ' الغاء الجميع',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            viewModel.onSelectAll();
                          },
                          child: Container(
                            height: 70,
                            width: 200,
                            color: Colors.transparent,
                            child: Center(
                                child: Text(
                              ' اختيار الجميع ',
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ));
        });
  }
}

class SettingsViewModel extends GetxController implements LoaderState {
  bool checkBox1 = true;
  bool checkBox2 = true;
  bool checkBox3 = true;
  bool checkBox4 = true;
  bool checkBox5 = true;
  bool checkBox6 = true;
  bool checkBox7 = true;
  bool checkBox8 = true;
  bool checkBox9 = true;
  bool checkBox10 = true;

  String notificationUserId;
  String fixtureId;

  dynamic fireid = true;
  dynamic startgame = true;
  dynamic halfgame = true;
  dynamic fullgame = true;
  dynamic goals = true;
  dynamic redcard = true;
  dynamic yellowcard = true;
  dynamic penalty = true;
  dynamic plan = true;
  dynamic subst = true;
  dynamic reminderbeforematch = true;

  @override
  ViewState _state;

  @override
  // TODO: implement viewState
  ViewState get viewState => _state;
  @override
  void onClose() {
    // TODO: implement onClose
    this.onNotificationSave();
    super.onClose();
  }

  @override
  void setSate(ViewState state) {
    // TODO: implement setSate
    _state = state;
    update();
  }

  SettingsViewModel({String notificationId, String fixtureGameId, isSave}) {
    notificationUserId = notificationId;
    fixtureId = fixtureGameId;

    print("NotificationId");
    print(notificationUserId);
    if (isSave == true) {
      onNotificationSave();
    } else {
      getNotification();
    }
    update();
  }

  onCheckBox1Changed(bool val) {
    if (val == true) {
      startgame = true;
      update();
    } else if (val == false) {
      startgame = false;
      update();
    }

    update();
  }

  onCheckBox2Changed(bool val) {
    print("val changed");
    print(val);
    if (val == true) {
      halfgame = true;
      update();
    } else if (val == false) {
      halfgame = false;
      update();
    }

    update();
  }

  onCheckBox3Changed(bool val) {
    if (val == true) {
      fullgame = true;
      update();
    } else if (val == false) {
      fullgame = false;
      update();
    }

    update();
  }

  onCheckBox4Changed(bool val) {
    if (val == true) {
      goals = true;
      update();
    } else if (val == false) {
      goals = false;
      update();
    }

    update();
  }

  onCheckBox5Changed(bool val) {
    if (val == true) {
      redcard = true;
      update();
    } else if (val == false) {
      redcard = false;
      update();
    }

    update();
  }

  onCheckBox6Changed(bool val) {
    if (val == true) {
      yellowcard = true;
      update();
    } else if (val == false) {
      yellowcard = false;
      update();
    }

    update();
  }

  onCheckBox7Changed(bool val) {
    if (val == true) {
      penalty = true;
      update();
    } else if (val == false) {
      penalty = false;
      update();
    }

    update();
  }

  onCheckBox8Changed(bool val) {
    if (val == true) {
      plan = true;
      update();
    } else if (val == false) {
      plan = false;
      update();
    }

    update();
  }

  onCheckBox9Changed(bool val) {
    if (val == true) {
      subst = true;
      update();
    } else if (val == false) {
      subst = false;
      update();
    }

    update();
  }

  onCheckBox10Changed(bool val) {
    if (val == true) {
      reminderbeforematch = true;
      update();
    } else if (val == false) {
      reminderbeforematch = false;
      update();
    }

    update();
  }

  onUnSelectAll() {
    fireid = false;
    startgame = false;
    halfgame = false;
    fullgame = false;
    goals = false;
    redcard = false;
    yellowcard = false;
    penalty = false;
    plan = false;
    subst = false;
    reminderbeforematch = false;
    update();
  }

  onSelectAll() {
    fireid = true;
    startgame = true;
    halfgame = true;
    fullgame = true;
    goals = true;
    redcard = true;
    yellowcard = true;
    penalty = true;
    plan = true;
    subst = true;
    reminderbeforematch = true;
    update();
  }

  addNotificationSelection() async {
    print("here");

    /// print('https://soccer.sportmonks.com/api/v2.0/players/${playerId}?api_token=${Token.fixturesToken}&include=transfers:order(date|asc),transfers.fromTeam,transfers.player,transfers.toTeam,transfers.season');
    print(
        'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/insertselectmatech?FixID=$fixtureId&DeviceID=$notificationUserId&ReciveNewsYesNO=0&NotifiGoal=1&YellowCard=1&RedCard=1&ReminderBeforeMatch=1&ReminderMatchStart=1&ReciveNotificationsubst=1&ReciveNotificationplan=1&ReciveNotificationpenalty=1&halfMatch=1&MatchEnd=1');
    NetworkManager.getDifferentToken(
            url:
                'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/insertselectmatech?FixID=$fixtureId&DeviceID=$notificationUserId&ReciveNewsYesNO=0&NotifiGoal=1&YellowCard=1&RedCard=1&ReminderBeforeMatch=1&ReminderMatchStart=1&ReciveNotificationsubst=1&ReciveNotificationplan=1&ReciveNotificationpenalty=1&halfMatch=1&MatchEnd=1',
            isFormData: true)
        .then((response) {
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });
  }

  getNotification() async {
    //print(_favoriteLeagues.length);
    print("here");

    /// print('https://soccer.sportmonks.com/api/v2.0/players/${playerId}?api_token=${Token.fixturesToken}&include=transfers:order(date|asc),transfers.fromTeam,transfers.player,transfers.toTeam,transfers.season');
    print(
        'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/selectmatcheforDevice?ID=$notificationUserId');
    NetworkManager.getDifferentToken(
            url:
                'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/selectmatcheforDevice?ID=$notificationUserId',
            isFormData: true)
        .then((response) {
      var decodedJSON;
      var subscriptionItems;
      if (response.toString().isNotEmpty) {
        decodedJSON = jsonDecode(response);

        print(decodedJSON);
        var result = decodedJSON;

        subscriptionItems = result
            .where((element) => element['SubID'].toString() == fixtureId)
            .toList();
        // print(fixtureId);
        // print(subscriptionItems);
        if (response.toString().isNotEmpty &&
            subscriptionItems != null &&
            subscriptionItems.length > 0) {
          print("adta");
          var subscriptionItem = subscriptionItems[0];
          fireid = subscriptionItem["ID"];
          startgame = subscriptionItem['ReminderMatchStart'] == 1;
          halfgame = subscriptionItem['halfMatch'] == 1;
          fullgame = subscriptionItem['MatchEnd'] == 1;
          goals = subscriptionItem['NotifiGoal'] == 1;
          redcard = subscriptionItem['RedCard'] == 1;
          yellowcard = subscriptionItem['YellowCard'] == 1;
          penalty = subscriptionItem['ReciveNotificationpenalty'] == 1;
          plan = subscriptionItem['ReciveNotificationplan'] == 1;
          subst = subscriptionItem['ReciveNotificationsubst'] == 1;
          reminderbeforematch = subscriptionItem['ReminderBeforeMatch'] == 1;
          print("Start Game");
          print(startgame);
          update();
        }
      } else {
        addNotificationSelection();
      }

      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });
  }

  onNotificationSave() {
    print("here Start Game");
    print(startgame);

    /// print('https://soccer.sportmonks.com/api/v2.0/players/${playerId}?api_token=${Token.fixturesToken}&include=transfers:order(date|asc),transfers.fromTeam,transfers.player,transfers.toTeam,transfers.season');
    //print('https://www.igoalksa.com/GoalWcfService/WebService1.asmx/insertselectmatech?FixID=${fixtureId}&DeviceID=${notificationUserId}&ReciveNewsYesNO=0&NotifiGoal=1&YellowCard=1&RedCard=1&ReminderBeforeMatch=1&ReminderMatchStart=1&ReciveNotificationsubst=1&ReciveNotificationplan=1&ReciveNotificationpenalty=1&halfMatch=1&MatchEnd=1');
    NetworkManager.getDifferentToken(
            url:
                'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/insertselectmatech?FixID=$fixtureId&DeviceID=$notificationUserId&ReciveNewsYesNO=0&NotifiGoal=${goals == true ? 1 : 0}&YellowCard=${yellowcard == true ? 1 : 0}&RedCard=${redcard == true ? 1 : 0}&ReminderBeforeMatch=${reminderbeforematch == true ? 1 : 0}&ReminderMatchStart=${startgame == true ? 1 : 0}&ReciveNotificationsubst=${subst == true ? 1 : 0}&ReciveNotificationplan=${plan == true ? 1 : 0}&ReciveNotificationpenalty=${penalty == true ? 1 : 0}&halfMatch=${halfgame == true ? 1 : 0}&MatchEnd=${fullgame == true ? 1 : 0}',
            isFormData: true)
        .then((response) {
      print("true");

      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });
  }
}
