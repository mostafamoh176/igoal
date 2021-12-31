import 'package:app_igoal/Screens/ClubPlayers/clubPlayersViewModel.dart';
import 'package:app_igoal/Screens/Description/descriptionView.dart';
import 'package:app_igoal/Screens/Home_4/home4View.dart';
import 'package:app_igoal/Screens/leagueInfo/leagueInfoView.dart';
import 'package:app_igoal/Screens/playerInfo/playerInfoView.dart';
import 'package:app_igoal/Widgets/button.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/main.dart';
import 'package:app_igoal/serivces/networks/Loader.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class ClubPlayersView extends StatefulWidget {
  String teamId;
  String countryNameId;

  ClubPlayersView({this.teamId, this.countryNameId});
  @override
  _ClubPlayersViewState createState() => _ClubPlayersViewState();
}

class _ClubPlayersViewState extends State<ClubPlayersView> {
  //
  // bool isTabSelected_1 = false;
  // bool isTabSelected_2 = false;
  // bool isTabSelected_3 = true;
  // bool isTabSelected_4 = false;
  // bool isTabSelected_5 = false;

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();

    return GetBuilder<ClubPlayersViewModel>(
        init: ClubPlayersViewModel(teamid: widget.teamId),
        builder: (viewModel) {
          return Stack(
            children: [
              if (viewModel.viewState == ViewState.Idle)
                SafeArea(
                  bottom: false,
                  top: false,
                  child: Scaffold(
                    backgroundColor:
                        (ThemeService().theme.toString() == "ThemeMode.dark")
                            ? Colors.black
                            : Colors.white,
                    body: SingleChildScrollView(
                      child: Container(
                        color: (ThemeService().theme.toString() ==
                                "ThemeMode.dark")
                            ? Colors.black
                            : Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).padding.top,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              child: Container(
                                height: 40,
                                color: Theme.of(context).secondaryHeaderColor,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(top: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 12),
                                    Icon(
                                      Icons.navigate_before,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Get.back();
                              },
                            ),
                            clubPlayersTopItem(context, viewModel),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.98,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  //color: Colors.grey
                                  color: (ThemeService().theme.toString() ==
                                          "ThemeMode.dark")
                                      ? Theme.of(context).secondaryHeaderColor
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    top: 0, left: 25, right: 10),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  controller: _controller,
                                  children: [
                                    CustomTabBarItem(
                                      title: ' معلومات',
                                      isSelected: viewModel.isTabSelected_1,
                                      titleSize: 18,
                                      onTap: () {
                                        viewModel.onTab1Changed();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomTabBarItem(
                                      title: 'المباريات الحالية',
                                      titleSize: 18,
                                      isSelected: viewModel.isTabSelected_6,
                                      onTap: () {
                                        viewModel.onTab6Changed();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomTabBarItem(
                                      title: 'اخبار',
                                      isSelected: viewModel.isTabSelected_2,
                                      titleSize: 18,
                                      onTap: () {
                                        viewModel.onTab2Changed();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomTabBarItem(
                                      title: 'اللاعبين',
                                      titleSize: 5,
                                      isSelected: viewModel.isTabSelected_3,
                                      onTap: () {
                                        viewModel.onTab3Changed();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomTabBarItem(
                                      title: 'الانتقالات',
                                      titleSize: 18,
                                      isSelected: viewModel.isTabSelected_4,
                                      onTap: () {
                                        viewModel.onTab4Changed();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomTabBarItem(
                                      title: 'مشاركات',
                                      titleSize: 18,
                                      isSelected: viewModel.isTabSelected_5,
                                      onTap: () {
                                        viewModel.onTab5Changed();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            if (viewModel.isTabSelected_1 == true)
                              (viewModel.trophies != null)
                                  ? GestureDetector(
                                      onHorizontalDragEnd:
                                          (DragEndDetails details) {
                                        if (details.primaryVelocity > 0) {
                                          // User swiped Left
                                          print("left");
                                        } else if (details.primaryVelocity <
                                            0) {
                                          // User swiped Right
                                          print("right");
                                          viewModel.onTab2Changed();
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          InkWell(
                                              splashColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              onTap: () {
                                                print((viewModel
                                                        .teamData['country']
                                                    ['data']['id']));
                                              },
                                              child: playerBasicInfo(
                                                  context, viewModel)),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          btnCallToAction(),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          widget.countryNameId == "35376"
                                              ? Container()
                                              : playersMainItem(viewModel),
                                        ],
                                      ),
                                    )
                                  : Container()
                            else if (viewModel.isTabSelected_3 == true)
                              (viewModel.players != null)
                                  ? GestureDetector(
                                      onHorizontalDragEnd:
                                          (DragEndDetails details) {
                                        if (details.primaryVelocity > 0) {
                                          // User swiped Left
                                          print("left");

                                          _controller.jumpTo(_controller
                                              .position.minScrollExtent);
                                          viewModel.onTab2Changed();
                                        } else if (details.primaryVelocity <
                                            0) {
                                          // User swiped Right
                                          print("right");
                                          _controller.jumpTo(_controller
                                              .position.maxScrollExtent);
                                          viewModel.onTab4Changed();
                                        }
                                      },
                                      child: Container(
                                          height:
                                              (100 * viewModel.players.length)
                                                  .toDouble(),
                                          // color: Colors.white,
                                          child: ListView.builder(
                                            padding: EdgeInsets.only(top: 0),
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: viewModel.players.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return playersWidget(
                                                  context,
                                                  viewModel.players[index],
                                                  viewModel.teamData['name'],
                                                  viewModel);
                                            },
                                          )),
                                    )
                                  : Container()
                            else if (viewModel.isTabSelected_6 == true)
                              (viewModel.currentGames != null)
                                  ? GestureDetector(
                                      onHorizontalDragEnd:
                                          (DragEndDetails details) {
                                        if (details.primaryVelocity > 0) {
                                          // User swiped Left
                                          print("left");
                                          viewModel.onTab5Changed();
                                        } else if (details.primaryVelocity <
                                            0) {
                                          // User swiped Right
                                          print("right");
                                        }
                                      },
                                      child: Container(
                                        height: (117 *
                                                viewModel.currentGames.length)
                                            .toDouble(),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                          padding: EdgeInsets.only(top: 0),
                                          itemCount:
                                              viewModel.currentGames.length,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return currentMatchesWidget(
                                                context, viewModel, index);
                                          },
                                        ),
                                      ),
                                    )
                                  : Container()
                            else if (viewModel.isTabSelected_4 == true)
                              (viewModel.transfers != null)
                                  ? GestureDetector(
                                      onHorizontalDragEnd:
                                          (DragEndDetails details) {
                                        if (details.primaryVelocity > 0) {
                                          // User swiped Left
                                          print("left");
                                          viewModel.onTab3Changed();
                                        } else if (details.primaryVelocity <
                                            0) {
                                          // User swiped Right
                                          print("right");
                                          viewModel.onTab5Changed();
                                        }
                                      },
                                      child: Container(
                                        height: (MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.12 *
                                                viewModel.transfers.length)
                                            .toDouble(),
                                        child: ListView.builder(
                                            padding: EdgeInsets.only(top: 0),
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                viewModel.transfers.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return transferItem(
                                                  context,
                                                  viewModel,
                                                  index,
                                                  (viewModel.teamData[
                                                              'logo_path'] !=
                                                          null)
                                                      ? viewModel
                                                          .teamData['logo_path']
                                                      : viewModel.teamData[
                                                              'team']['data']
                                                          ['logo_path']);
                                            }),
                                      ),
                                    )
                                  : Container()
                            else if (viewModel.isTabSelected_5 == true)
                              (viewModel.leagues != null)
                                  ? GestureDetector(
                                      onHorizontalDragEnd:
                                          (DragEndDetails details) {
                                        if (details.primaryVelocity > 0) {
                                          // User swiped Left
                                          print("left");
                                          viewModel.onTab4Changed();
                                        } else if (details.primaryVelocity <
                                            0) {
                                          // User swiped Right
                                          print("right");
                                          viewModel.onTab6Changed();
                                        }
                                      },
                                      child: Container(
                                        height: (110 * viewModel.leagues.length)
                                            .toDouble(),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                          padding: EdgeInsets.only(top: 0),
                                          itemCount: viewModel.leagues.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return postListItem(
                                                context, viewModel, index);
                                          },
                                        ),
                                      ),
                                    )
                                  : Container()
                            else if (viewModel.isTabSelected_2)
                              (viewModel.newsList != null)
                                  ? GestureDetector(
                                      onHorizontalDragEnd:
                                          (DragEndDetails details) {
                                        if (details.primaryVelocity > 0) {
                                          // User swiped Left
                                          print("left");
                                          viewModel.onTab1Changed();
                                        } else if (details.primaryVelocity <
                                            0) {
                                          // User swiped Right
                                          print("right");
                                          viewModel.onTab3Changed();
                                        }
                                      },
                                      child: Container(
                                          height: (337 * 3).toDouble(),
                                          child: ListView.builder(
                                            itemCount:
                                                viewModel.newsList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return postItem(
                                                  context, viewModel, index);
                                            },
                                          )),
                                    )
                                  : Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              else
                (viewModel.viewState == ViewState.Busy
                    ? Positioned.fill(child: Loading())
                    : Container()),
            ],
          );
        });
  }

  Widget postListItem(
      BuildContext context, ClubPlayersViewModel viewModel, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          Get.to(() => LeagueInfoView(
                leagueId:
                    viewModel.leagues[index]['league']['data']['id'].toString(),
              ));
          // print(viewModel.leagues[index]['league']['data']['name'].toString());
        },
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).secondaryHeaderColor),
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                viewModel.leagueName[viewModel.leagues[index]['league']['data']
                                ['name']
                            .toString()] !=
                        null
                    ? viewModel.leagueName[viewModel.leagues[index]['league']
                            ['data']['name']
                        .toString()]
                    : viewModel.leagues[index]['league']['data']['name']
                        .toString(),
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent),
                child: Image.network(viewModel.leagues[index]['league']['data']
                        ['logo_path'] ??
                    ""),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget currentMatchesWidget(
      BuildContext context, ClubPlayersViewModel viewModel, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        padding: EdgeInsets.only(left: 12, right: 12),
        child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            Get.to(() => Home4View(
                  seasonid:
                      viewModel.currentGames[index]['season_id'].toString(),
                  id: viewModel.currentGames[index]['id'].toString(),
                ));
          },
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(viewModel.currentGames[index]['time']['starting_at']['date'],
                  style: Theme.of(context).primaryTextTheme.subtitle1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 70,
                        child: Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  viewModel.leagueName[viewModel
                                                  .currentGames[index]
                                              ['localTeam']['data']['name']] !=
                                          null
                                      ? viewModel.leagueName[
                                          viewModel.currentGames[index]
                                              ['localTeam']['data']['name']]
                                      : viewModel.currentGames[index]
                                          ['localTeam']['data']['name'],
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1,
                                  maxLines: 3,
                                  //overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                onTap: () {
                                  print(widget.teamId);
                                  print(viewModel.currentGames[index]
                                      ["localTeam"]["data"]['id']);
                                  Get.offAll(ClubPlayersView(
                                    teamId: viewModel.currentGames[index]
                                            ['localTeam']['data']['id']
                                        .toString(),
                                  ));
                                },
                                child: Container(
                                  height: 60,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(360),
                                    child: Image.network(
                                        viewModel.currentGames[index]
                                            ['localTeam']['data']['logo_path']),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              child: Center(
                                  child: Text(
                                viewModel.currentGames[index]['scores']
                                        ['localteam_score']
                                    .toString(),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                              )),
                            ),
                            Text(':',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              child: Center(
                                  child: Text(
                                viewModel.currentGames[index]['scores']
                                        ['visitorteam_score']
                                    .toString(),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                              )),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 70,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                onTap: () {
                                  // Get.to(()=>MainScreen());
                                  // ClubPlayersView(teamId: viewModel.currentGames[index]['visitorTeam']['data']['id'].toString(),);

                                  Get.off(ClubPlayersView(
                                    teamId: viewModel.currentGames[index]
                                            ['visitorTeam']['data']['id']
                                        .toString(),
                                  ));
                                  // Get.to(()=>ClubPlayersView(teamId: viewModel.currentGames[index]['visitorTeam']['data']['id'].toString(),));
                                  // print(viewModel.currentGames[index]['visitorTeam']['data']['id']);
                                  // Get.to(()=>ClubPlayersView(teamId:viewModel.currentGames[index]['visitorTeam']['data']['id'].toString(),));
                                },
                                child: Text(
                                  viewModel.leagueName[
                                              viewModel.currentGames[index]
                                                      ['visitorTeam']['data']
                                                  ['name']] !=
                                          null
                                      ? viewModel.leagueName[
                                          viewModel.currentGames[index]
                                              ['visitorTeam']['data']['name']]
                                      : viewModel.currentGames[index]
                                          ['visitorTeam']['data']['name'],
                                  //viewModel.currentGames[index]['visitorTeam']['data']['name'],
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1,
                                  //overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              height: 60,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                onTap: () {
                                  Get.offAll(ClubPlayersView(
                                    teamId: viewModel.currentGames[index]
                                            ['visitorTeam']['data']['id']
                                        .toString(),
                                  ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(360),
                                  child: Image.network(
                                      viewModel.currentGames[index]
                                          ['visitorTeam']['data']['logo_path']),
                                ),
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
      ),
    );
  }

  Widget playersWidget(BuildContext context, dynamic player, String clubName,
      ClubPlayersViewModel viewModel) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        Get.to(() => PlayerInfoView(
              playerId: player['player']['data']['player_id'].toString(),
            ));
        // print(player['player']['data']['player_id']);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.transparent),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: (player['player']['data']['image_path'] != null)
                        ? Image.network(player['player']['data']['image_path'])
                        : Image.asset('assets/images/noimagesPlayer.png'),
                  )),
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.leagueName[player['player']['data']
                                    ['display_name']
                                .toString()] !=
                            null
                        ? viewModel.leagueName[
                            player['player']['data']['display_name'].toString()]
                        : player['player']['data']['display_name'].toString(),
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                  Text(
                    viewModel.leagueName[clubName.toString()] != null
                        ? viewModel.leagueName[clubName.toString()]
                        : clubName.toString(),
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container clubPlayersTopItem(
      BuildContext context, ClubPlayersViewModel viewModel) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          // topRight: Radius.circular(20.0),
          // topLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.transparent, shape: BoxShape.circle),
            child: (viewModel.teamData['logo_path'] != null)
                ? Image.network(
                    viewModel.teamData['logo_path'],
                    fit: BoxFit.fill,
                  )
                : Image.network(
                    viewModel.teamData['team']['data']['logo_path'],
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          (viewModel.teamData['name'] != null)
              ? Text(
                  viewModel.leagueName[viewModel.teamData['name'].toString()] !=
                          null
                      ? viewModel
                          .leagueName[viewModel.teamData['name'].toString()]
                      : viewModel.teamData['name'].toString(),
                  style: Theme.of(context).primaryTextTheme.headline6,
                )
              : Text(
                  viewModel.leagueName[viewModel.teamData['team']['data']
                                  ['name']
                              .toString()] !=
                          null
                      ? viewModel.leagueName[
                          viewModel.teamData['team']['data']['name'].toString()]
                      : viewModel.teamData['team']['data']['name'].toString(),
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
          SizedBox(
            height: 6,
          ),
          // Text(
          //   'Club Barcelona',
          //   style: TextStyle(fontSize: 16, color: Color(0xff5F5F5F)),
          // )
        ],
      ),
    );
  }

  Widget transferItem(BuildContext context, ClubPlayersViewModel viewModel,
      int index, String teamLogo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Container(
        //height: MediaQuery.of(context).size.height*0.1,
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).secondaryHeaderColor),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.67,
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          (viewModel.transfers[index]['team']['data']['name']
                                      .toString() !=
                                  null)
                              ? viewModel.leagueName[viewModel.transfers[index]
                                              ['team']['data']['name']
                                          .toString()] !=
                                      null
                                  ? viewModel.leagueName[viewModel
                                      .transfers[index]['team']['data']['name']
                                      .toString()]
                                  : viewModel.transfers[index]['team']['data']
                                          ['name']
                                      .toString()
                              : "No Name",
                          //viewModel.transfers[index]['team']['data']['name'],
                          maxLines: 1,
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.transparent),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: (viewModel.transfers[index]['team']['data']
                                      ['logo_path'] ==
                                  null)
                              ? Image.asset("assets/images/noTeam.jpg")
                              : Image.network(viewModel.transfers[index]['team']
                                  ['data']['logo_path']),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      (viewModel.transfers[index]['type'] == "IN")
                          ? Image.asset(
                              "assets/images/arrow_in.png",
                              height: 20,
                              width: 20,
                            )
                          : Image.asset(
                              "assets/images/arrow_out.png",
                              height: 20,
                              width: 20,
                            ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: Image.network(teamLogo),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          viewModel.leagueName[
                                      viewModel.teamData['name'].toString()] !=
                                  null
                              ? viewModel.leagueName[
                                  viewModel.teamData['name'].toString()]
                              : viewModel.teamData['name'].toString(),
                          // viewModel.teamData['name'],
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                        ),
                      ),

                      // Container(
                      //   height: 18,
                      //   width: 18,
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.circle, color: Colors.grey),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(360),
                      //     child: Image.network(['player']['data']['image_path']),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    print(String.fromCharCodes((viewModel
                            .transfers[index]['player']['data']['birthdate']
                            .runes
                            .toList())
                        .reversed));
                    print((viewModel.transfers[index]['player']['data']
                            ['birthdate']
                        .toString()
                        .replaceAll("/", "-")));
                    // print(DateFormat("dd-MM-yyyy").format(DateTime.parse(viewModel.transfers[index]['player']['data']['birthdate'].toString().replaceAll("/", "-"))));
                  },
                  //viewModel.transfers[index]['player']['data']['birthdate']
                  child: Text(
                    //formatDate(DateTime.parse(viewModel.transfers[index]['player']['data']['birthdate']), [yyyy, '/', MM, '/', dd]).toString(),
                    "date" +
                        " " +
                        viewModel.transfers[index]['date']
                            .toString()
                            .replaceAll("/", "-"),
                    //(DateFormat('yyyy-MM-d').parse(viewModel.transfers[index]['player']['data']['birthdate'])).toString(),
                    style: TextStyle(fontSize: 13, color: Color(0xff6B6B6B)),
                  ),
                ),
              ],
            ),
            // Spacer(),
            InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                print(
                    viewModel.transfers[index]['player']['data']['player_id']);

                Get.to(() => PlayerInfoView(
                      playerId: viewModel.transfers[index]['player']['data']
                              ['player_id']
                          .toString(),
                    ));
                //  Get.to(()=>PlayerInfoView(playerId:viewModel.transfers[index]['player']['data']['id'].toString(),));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.23,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: Image.network(viewModel.transfers[index]
                              ['player']['data']['image_path'])),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            viewModel.leagueName[viewModel.transfers[index]
                                            ['player']['data']['fullname']
                                        .toString()] !=
                                    null
                                ? viewModel.leagueName[
                                    viewModel.transfers[index]['player']['data']
                                        ['fullname']]
                                : viewModel.transfers[index]['player']['data']
                                    ['fullname'],
                            //viewModel.transfers[index]['player']['data']['fullname'],
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container teamImageItem(dynamic image) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: Image.network(image),
      ),
    );
  }

  Container playerImageItem(dynamic teamData) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: (teamData['logo_path'] != null)
            ? Image.network(
                teamData['logo_path'],
                fit: BoxFit.cover,
              )
            : Image.network(
                teamData['team']['data']['logo_path'],
                fit: BoxFit.cover,
              ));
  }

  Widget informationListItem(
      dynamic trophies, int index, ClubPlayersViewModel viewModel) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        print("Here");
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Container(
          //height: 105,
          //height: 105+(14*(trophies['non_sportmonk_seasons'].length/4).toDouble()),
          //height: 105+(25*trophies['non_sportmonk_seasons'].length).toDouble(),
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {
              // print(105+(25*(trophies['non_sportmonk_seasons'].length/4)));
              print((trophies['non_sportmonk_seasons'].length / 4) * 10);
              print((trophies['non_sportmonk_seasons'].length));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (trophies['non_sportmonk_seasons'].length > 0)
                    ? Container(
                        padding: EdgeInsets.all(8),
                        // color: Colors.red,
                        height: ((trophies['non_sportmonk_seasons'].length < 4)
                            ? 50
                            : 42 *
                                (trophies['non_sportmonk_seasons'].length / 4)
                                    .toDouble()),
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: trophies['non_sportmonk_seasons'].length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 3 / 1),
                            padding: EdgeInsets.only(top: 4, bottom: 4),
                            itemBuilder: (context, index) {
                              return Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Container(
                                  // color: Colors.blue,
                                  height: 10,
                                  // padding: EdgeInsets.only(top: 2,bottom: 2),
                                  child: (trophies['non_sportmonk_seasons']
                                          .toString()
                                          .isEmpty)
                                      ? (trophies['non_sportmonk_seasons']
                                                  [index]['name']
                                              .toString()
                                              .isEmpty)
                                          ? Text(
                                              trophies['non_sportmonk_seasons']
                                                          [index]['name']
                                                      .toString() ??
                                                  "",
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .subtitle1,
                                            )
                                          : Container()
                                      : Container(),
                                ),
                              );
                            }),
                      )
                    : Container(),
                (trophies['status'] == 'Winner')
                    ? Text(
                        'المركز الثاني' ?? "",
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      )
                    : Text(
                        'فاز باللقب' ?? "",
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                Container(
                  height: 30,
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            trophies['times'].toString() ?? "",
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                          Text(
                            viewModel.leagueName[
                                    trophies['league'].toString() ?? ""] ??
                                "",
                            //trophies['league'],
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffc4c4c4),
                            ),
                            child: Image.asset("assets/images/app_logo.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: (ThemeService().theme.toString() == "ThemeMode.dark")
                      ? Colors.white
                      : Colors.grey,
                  thickness: 0.3,
                ),
                // Container(
                //   color: Colors.white,
                //   width: 335,
                //   height: 1,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container playerBasicInfo(
      BuildContext context, ClubPlayersViewModel viewModel) {
    return Container(
      height: 157,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: (ThemeService().theme.toString() == "ThemeMode.dark")
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(
        left: 25,
        right: 20,
      ),
      child: Row(
        children: [
          playerImageItem(viewModel.teamData),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 17,
                ),
                playerInfoItem(
                    title: 'النادي :',
                    value: viewModel
                        .leagueName[viewModel.teamData['name'].toString()]),
                playerInfoItem(
                  title: 'الدولة :',
                  // value: viewModel.teamData['country']['data']['id'].toString()
                  value: viewModel.countriesArabic
                              .where((o) =>
                                  o['id'].toString() ==
                                  viewModel.teamData['country']['data']['id']
                                      .toString())
                              .toList()
                              .length >
                          0
                      ? viewModel.countriesArabic
                          .where((o) =>
                              o['id'].toString() ==
                              viewModel.teamData['country']['data']['id']
                                  .toString())
                          .toList()[0]['name']
                          .toString()
                      : viewModel.teamData['country']['data']['name']
                          .toString(),
                ),
                playerInfoItem(
                    title: ' تاريخ التأسيس :',
                    value: (viewModel.teamData['founded'] != null)
                        ? (viewModel.teamData['founded'].toString())
                        : "No Data"),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget playersMainItem(ClubPlayersViewModel viewModel) {
    print("viewModel.trophies.length" + viewModel.trophies.length.toString());
    return viewModel.trophies.length > 0
        ? Container(
            padding: EdgeInsets.all(10),
            height: viewModel.trophies.length * 105.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: viewModel.trophies.length,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                viewModel.trophies[index]['times'].toString() !=
                                        'null'
                                    ? viewModel.trophies[index]['times']
                                        .toString()
                                    : "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Circular",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 125),
                              child: Text(
                                viewModel.trophies[index]['league']
                                            .toString() !=
                                        'null'
                                    ? viewModel.trophies[index]['league']
                                        .toString()
                                    : "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Circular",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffc4c4c4),
                                ),
                                child:
                                    Image.asset("assets/images/football.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Divider(
                          height: 2,
                          color: (ThemeService().theme.toString() ==
                                  "ThemeMode.dark")
                              ? Colors.white
                              : Colors.grey,
                          thickness: 0.3,
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 14),
                                  width:
                                      MediaQuery.of(context).size.width * .95,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: (ThemeService().theme.toString() ==
                                            "ThemeMode.dark")
                                        ? Colors.black
                                        : Colors.white, //Color(0xff1b1b1b),
                                  ),
                                  child: Text(
                                    (viewModel.trophies[0]['status'] ==
                                            'Winner')
                                        ? 'المركز الثاني'
                                        : 'فاز باللقب',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Circular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i <= 2)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                                  .isBlank
                                              ? ""
                                              : viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString(),
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 2 && i <= 5)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 5 && i <= 8)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 8 && i <= 11)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 11 && i <= 14)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 14 && i <= 17)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 17 && i <= 20)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 20 && i <= 23)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 23 && i <= 26)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 26 && i <= 29)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 29 && i <= 32)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 32 && i <= 35)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 35 && i <= 38)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 38 && i <= 41)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 41 && i <= 44)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 44 && i <= 47)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  for (int i = 0;
                                      viewModel
                                              .trophies[index]
                                                  ['non_sportmonk_seasons']
                                              .length >
                                          i;
                                      i++)
                                    if (i > 47 && i <= 50)
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          viewModel.trophies[index][
                                                          'non_sportmonk_seasons']
                                                          [i]['name']
                                                      .toString() !=
                                                  'null'
                                              ? viewModel.trophies[index]
                                                      ['non_sportmonk_seasons']
                                                      [i]['name']
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                            color: Color(0xff6b6b6b),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          )
        : Container();
    //   Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     color: (ThemeService().theme.toString() == "ThemeMode.dark")
    //         ? Colors.black
    //         : Colors.white,
    //   ),
    //   // color: (ThemeService().theme.toString() == "ThemeMode.dark")
    //   //     ? Colors.black
    //   //     : Colors.white,
    //   height: MediaQuery.of(context).size.height * 0.5,
    //   child: ListView.builder(
    //     padding: EdgeInsets.zero,
    //     itemCount: viewModel.trophies.length,
    //     // physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (BuildContext, int index) {
    //       print("Trophy");
    //       print(viewModel.trophies[index]['non_sportmonk_seasons']);
    //       return informationListItem(
    //           viewModel.trophies[index], index, viewModel);
    //     },
    //   ),
    // );
  }

  Widget playerDetailItem(
      BuildContext context, ClubPlayersViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9, top: 9),
      child: Container(
        height: 271,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(0xff1B1B1B), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.only(left: 21, right: 21, top: 12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  '7',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
                Text(
                  'Martin',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
            SizedBox(
              height: 8,
            ),
            playerTenureInfo(playerName: 'Messi'),
            playerTenureInfo(playerName: 'Martin'),
          ],
        ),
      ),
    );
  }

  Widget playerTenureInfo({String playerName, ClubPlayersViewModel viewModel}) {
    return Padding(
      padding: const EdgeInsets.only(top: 9, bottom: 9),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '(7) $playerName',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                '1998/1999',
                style: TextStyle(fontSize: 14, color: Color(0xff5F5F5F)),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }

  Padding playerInfoItem(
      {String title, String value, ClubPlayersViewModel viewModel}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(0xff262626),
        ),
        height: 25,
        width: 200,
        // color: Theme.of(context).secondaryHeaderColor,
        child: Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Row(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 5,
                      color: Color(0xffD41A1A),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 17,
              ),
              Text(
                title ?? "",
                style: TextStyle(fontSize: 14, color: Color(0xffD41A1A)),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Text(
                value ?? "",
                style: Theme.of(context).primaryTextTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
        ),
      ),
    );
  }

  // Container playerImageItem() {
  //   return Container(
  //     height: 90,
  //     width: 90,
  //     decoration: BoxDecoration(
  //         color: Colors.grey,
  //         shape: BoxShape.circle
  //     ),
  //   );
  // }

  Widget btnCallToAction() {
    return Container(
      color: Color.fromRGBO(38, 38, 38, 1),
      child: iGoalButton(
        title: "البطولات",
        onTap: () {},
      ),
    );
  }

  Widget postItem(
      BuildContext context, ClubPlayersViewModel viewModel, int index) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        Get.to(() => DescriptionView(
              newsDetail: viewModel.newsList[index],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Container(
          height: 250.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Stack(children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.5, 0.5, 1],
                    ),
                  ),
                  decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    // begin: FractionalOffset.topCenter,
                    // end: FractionalOffset.bottomCenter,
                    // colors: [
                    //   Colors.black,
                    //   Colors.white,
                    // ],
                    // stops: [
                    //   0.5,
                    //   1.0
                    // ]),
                    image: DecorationImage(
                        image: NetworkImage(
                            viewModel.newsList[index]['nesimgurl']),
                        fit: BoxFit.cover),
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  height: 202,
                  width: MediaQuery.of(context).size.width,
                  // child: Image.network(viewModel.newsList[index]['nesimgurl'],fit: BoxFit.contain,),
                ),
                SizedBox(
                  height: 23,
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  viewModel.newsList[index]['newstitle'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ]),

              // SizedBox(
              //   height: 8,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Text(
              //     DateFormat.yMMMd()
              //         .format(DateTime.fromMicrosecondsSinceEpoch(viewModel
              //                 .newsList[index]['newsdate']
              //                 .millisecondsSinceEpoch *
              //             1000))
              //         .toString(),
              //     style: TextStyle(fontSize: 16, color: Color(0xff5F5F5F)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
