import 'package:app_igoal/Screens/Home/homeViewModel.dart';
import 'package:app_igoal/Screens/Home_4/home4View.dart';
import 'package:app_igoal/Screens/leagueInfo/leagueInfoView.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/Loader.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  bool isExpanded_1 = false;
  bool isExpanded_2 = false;
  bool isExpanded_3 = false;
  bool isExpanded_4 = false;

  final GlobalKey expansionTileKey = GlobalKey();

  scrollToSelectedContent({GlobalKey expansionTileKey}) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      Future.delayed(Duration(milliseconds: 200)).then((value) {
        Scrollable.ensureVisible(keyContext,
            duration: Duration(milliseconds: 200));
      });
    }
  }

  InkWell backBtn() {
    return InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
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

  DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
  }

  double percent = 60.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(
        init: HomePageViewModel(),
        builder: (viewModel) {
          return Scaffold(
            backgroundColor:
                // Theme.of(context).secondaryHeaderColor,
                (ThemeService().theme.toString() == "ThemeMode.dark")
                    ? Colors.black
                    : Colors.white,
            body: SafeArea(
              bottom: false,
              top: false,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Row(
                    children: [
                      // backBtn(),
                      Expanded(child: topImageLogo()),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        // if (viewModel.viewState == ViewState.Idle)
                        GestureDetector(
                          onHorizontalDragEnd: (DragEndDetails details) {
                            if (details.primaryVelocity > 0) {
                              print("End");

                              if (viewModel.isTabSelected_2 == true) {
                                print("1");
                                // viewModel.onTab3Changed();

                              } else if (viewModel.isTabSelected_3 == true) {
                                print("3");
                                viewModel.onTab2Changed();
                              } else if (viewModel.isTabSelected_4 == true) {
                                print("4");
                                viewModel.onTab3Changed();
                              }
                            }
                            else if (details.primaryVelocity < 0) {
                              if (viewModel.isTabSelected_2 == true) {
                                print("1");
                                viewModel.onTab3Changed();
                              } else if (viewModel.isTabSelected_3 == true) {
                                print("3");
                                viewModel.onTab4Changed();
                              } else if (viewModel.isTabSelected_4 == true) {
                                print("4");
                              }
                            }
                          },
                          child: (viewModel.homeMatchList.length == 0)
                              ? Container(
                                  height: 55,
                                  width:
                                      MediaQuery.of(context).size.width * 0.97,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomTabBarItem(
                                          image:
                                              'assets/images/calendar (1).svg',
                                          isSelected: viewModel.isTabSelected_1,
                                          titleSize: 14,
                                          onTap: () {
                                            showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050),
                                                builder: (BuildContext context,
                                                    Widget child) {
                                                  return Theme(
                                                    data: ThemeData.light()
                                                        .copyWith(
                                                      colorScheme:
                                                          ColorScheme.light(
                                                              primary: Color(
                                                                  0xff262626)),
                                                      buttonTheme:
                                                          ButtonThemeData(
                                                              textTheme:
                                                                  ButtonTextTheme
                                                                      .primary),
                                                      backgroundColor: Theme.of(
                                                              context)
                                                          .secondaryHeaderColor,
                                                      dialogBackgroundColor: Theme
                                                              .of(context)
                                                          .secondaryHeaderColor,
                                                    ),
                                                    child: child,
                                                  );
                                                }).then((value) {
                                              if (value != null) {
                                                var date =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(value);
                                                viewModel
                                                    .onDateTimeSelector(date);
                                                viewModel.onTab1Changed();
                                              }
                                            });
                                          },
                                        ),
                                        CustomTabBarItem(
                                          title: 'غدا ',
                                          isSelected: viewModel.isTabSelected_2,
                                          titleSize: 16,
                                          onTap: () {
                                            viewModel.onTab2Changed();
                                          },
                                        ),
                                        CustomTabBarItem(
                                          title: 'اليوم',
                                          titleSize: 16,
                                          isSelected: viewModel.isTabSelected_3,
                                          onTap: () {
                                            viewModel.onTab3Changed();
                                          },
                                        ),
                                        CustomTabBarItem(
                                          title: 'امس',
                                          titleSize: 16,
                                          isSelected: viewModel.isTabSelected_4,
                                          onTap: () {
                                            viewModel.onTab4Changed();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  child: ListView.builder(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                    controller: viewModel.scrollController,
                                    itemCount: viewModel.homeMatchList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          if (index == 0)
                                            Container(
                                              height: 47,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width ,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CustomTabBarItem(
                                                      image:
                                                          'assets/images/calendar (1).svg',
                                                      isSelected: viewModel
                                                          .isTabSelected_1,
                                                      titleSize: 14,
                                                      onTap: () {
                                                        showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(2050),
                                                            builder:
                                                                (BuildContext
                                                                        context,
                                                                    Widget
                                                                        child) {
                                                              return Theme(
                                                                data: ThemeData
                                                                        .light()
                                                                    .copyWith(
                                                                  colorScheme:
                                                                      ColorScheme.light(
                                                                          primary:
                                                                              Color(0xff262626)),
                                                                  buttonTheme: ButtonThemeData(
                                                                      textTheme:
                                                                          ButtonTextTheme
                                                                              .primary),
                                                                  backgroundColor:
                                                                      Theme.of(
                                                                              context)
                                                                          .secondaryHeaderColor,
                                                                  dialogBackgroundColor:
                                                                      Theme.of(
                                                                              context)
                                                                          .secondaryHeaderColor,
                                                                ),
                                                                child: child,
                                                              );
                                                            }).then((value) {
                                                          if (value != null) {
                                                            var date = DateFormat(
                                                                    'yyyy-MM-dd')
                                                                .format(value);
                                                            viewModel
                                                                .onDateTimeSelector(
                                                                    date);
                                                            viewModel
                                                                .onTab1Changed();
                                                          }
                                                        });
                                                      },
                                                    ),
                                                    CustomTabBarItem(
                                                      title: 'غدا ',
                                                      isSelected: viewModel
                                                          .isTabSelected_2,
                                                      titleSize: 16,
                                                      onTap: () {
                                                        viewModel
                                                            .onTab2Changed();
                                                      },
                                                    ),
                                                    CustomTabBarItem(
                                                      title: 'اليوم',
                                                      titleSize: 16,
                                                      isSelected: viewModel
                                                          .isTabSelected_3,
                                                      onTap: () {
                                                        viewModel
                                                            .onTab3Changed();
                                                      },
                                                    ),
                                                    CustomTabBarItem(
                                                      title: 'امس',
                                                      titleSize: 16,
                                                      isSelected: viewModel
                                                          .isTabSelected_4,
                                                      onTap: () {
                                                        viewModel
                                                            .onTab4Changed();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          mainListItem(
                                              viewModel,
                                              viewModel.homeMatchList[index],
                                              index,
                                              viewModel.homeMatchList),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget mainListItem(HomePageViewModel viewModel, HomeMatchesList homeMatch,
      int mainindex, List<HomeMatchesList> innerList) {
    return new Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        // color: Colors.blueGrey,
        color: (ThemeService().theme.toString() == "ThemeMode.dark")
            ? Theme.of(context).secondaryHeaderColor
            : Colors.white,
        // color: Theme.of(context).secondaryHeaderColor,
        //  border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: (ThemeService().theme.toString() == "ThemeMode.dark")
              ? Theme.of(context).secondaryHeaderColor
              : Colors.white,
        ),
        child: ExpansionTile(
          initiallyExpanded: homeMatch.isExpanded,
          leading: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                print(homeMatch.data[0]['league']['data']['id'].toString());
                Get.to(() => LeagueInfoView(
                      leagueId:
                          homeMatch.data[0]['league']['data']['id'].toString(),
                    ));
              },
              child: Image.network(
                homeMatch.data[0]['league']['data']['logo_path'],
                width: 30,
                height: 30,
              )),
          title: Text(
              viewModel.leagueName[
                  homeMatch.data[0]['league']['data']['id'].toString()],
              style: Theme.of(context).primaryTextTheme.headline1),
          trailing: Container(
            child: Icon(
                homeMatch.isExpanded == false
                    ? Icons.keyboard_arrow_down_sharp
                    : Icons.keyboard_arrow_up_sharp,
                size: 30,
                color: Color(0xffD7191D)),
          ),
          onExpansionChanged: (value) =>
              viewModel.onMainListItemExpansionChanged(mainindex),
          children: [
            Container(
              height: 50.3 *
                  viewModel.homeMatchList[mainindex].data.length.toDouble(),
              // color: Colors.red,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        height: 0.5,
                        color: (ThemeService().theme.toString() ==
                                "ThemeMode.dark")
                            ? Colors.grey.shade800
                            : Colors.green,
                      ),
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: viewModel.homeMatchList[mainindex].data.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print(viewModel.homeMatchList[index].data.length);
                    return innerListItem(
                        viewModel,
                        viewModel.homeMatchList[mainindex].data[index],
                        index,
                        viewModel.homeMatchList[mainindex].data[index]['id']
                            .toString(),
                        viewModel
                            .homeMatchList[mainindex].data[index]['season_id']
                            .toString(),
                        mainindex);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget innerListItem(HomePageViewModel viewModel, dynamic homeMatches,
      int index, String id, String seasonId, int mainindex) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        Get.to(() => new Home4View(
              id: id,
              seasonid: seasonId,
              matchStatus: viewModel
                  .checkstatus(viewModel.statusArray[homeMatches['id']])
                  .toString(),
            ));
        Get.reset();
      },
      child: Container(
        height: 50,
        //color: Colors.blue,
        color: (ThemeService().theme.toString() == "ThemeMode.dark")
            ? Theme.of(context).secondaryHeaderColor
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Container(
            child: Row(
              children: [
                //  Expanded(
                //    child: Container(),
                //   flex: 1,
                //  ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      // startTimer();
                      print(homeMatches);
                    },
                    child: Container(
                      //color: Colors.greenAccent,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0xffD7191D),
                          child: CircleAvatar(
                              radius: 16,
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                              child: Center(
                                  child: AutoSizeText(
                                viewModel
                                    .checkstatus(viewModel
                                        .statusArray[homeMatches['id']])
                                    .toString(),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                minFontSize: 6,
                              )))),
                    ),
                  ),
                ),
                //viewModel.leagueName[homeMatch.data[0]['league']['data']['id'].toString()]
                Expanded(
                    flex: 2,
                    child: Container(

                        // color: Colors.red,
                        child: Row(
                      children: [
                        Expanded(
                            child: AutoSizeText(
                          viewModel.leagueName[homeMatches['localTeam']['data']
                                          ['name']
                                      .toString()] !=
                                  null
                              ? viewModel.leagueName[homeMatches['localTeam']
                                      ['data']['name']
                                  .toString()]
                              : homeMatches['localTeam']['data']['name']
                                  .toString(),
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                          textAlign: TextAlign.center,
                          minFontSize: 15,
                          maxLines: 1,
                        )),
                      ],
                    ))),
                Expanded(
                    flex: 1,
                    child: Container(
                        //color: Colors.orange,
                        color: Colors.transparent,
                        child: homeMatches['localTeam']['data']['logo_path'] !=
                                null
                            ? Image.network(
                                homeMatches['localTeam']['data']['logo_path'],
                                width: 30,
                                height: 30,
                              )
                            : Container(
                                child:
                                    Image.asset("assets/images/noTeam.jpg")))),
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.grey,
                    height: 60,
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(homeMatches['scores']['localteam_score'].toString(), style: Theme.of(context).primaryTextTheme.subtitle1),
                        // Text('-', style:Theme.of(context).primaryTextTheme.subtitle1),
                        // Text(homeMatches['scores']['visitorteam_score'].toString(), style:Theme.of(context).primaryTextTheme.subtitle1),
                        (viewModel
                                    .checkstatus(viewModel
                                        .statusArray[homeMatches['id']])
                                    .toString() ==
                                "LIVE")
                            ? CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 3.0,
                                animation: true,
                                percent:
                                    double.parse(homeMatches['minutes']) / 90,
                                widgetIndicator: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Container(
                                      height: 2,
                                      width: 2,
                                      //   color: Colors.blue,
                                      child: Image.asset(
                                        "assets/images/AppIcon.png",
                                        height: 2,
                                        width: 2,
                                      )),
                                ),
                                center: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        homeMatches['scores']['localteam_score']
                                            .toString(),
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1),
                                    Text('-',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1),
                                    Text(
                                        homeMatches['scores']
                                                ['visitorteam_score']
                                            .toString(),
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1),
                                  ],
                                ),
                                backgroundColor: Colors.grey[300],
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.redAccent,
                              )
                            : Row(
                                children: [
                                  Text(
                                      homeMatches['scores']['localteam_score']
                                          .toString(),
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle1),
                                  Text('-',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle1),
                                  Text(
                                      homeMatches['scores']['visitorteam_score']
                                          .toString(),
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle1),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        // color: Colors.red,
                        width: 30,
                        height: 30,
                        child: Image.network(
                          homeMatches['visitorTeam']['data']['logo_path'],
                          width: 30,
                          height: 30,
                        ))),
                Expanded(
                  flex: 2,
                  child: Container(
                    // alignment: AlignmentDirectional.centerStart,
                    //color: Colors.blue,
                    child: AutoSizeText(
                      viewModel.leagueName[homeMatches['visitorTeam']['data']
                                      ['name']
                                  .toString()] !=
                              null
                          ? viewModel.leagueName[homeMatches['visitorTeam']
                                  ['data']['name']
                              .toString()]
                          : homeMatches['visitorTeam']['data']['name']
                              .toString(),
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                      textAlign: TextAlign.center,
                      minFontSize: 15,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container outerListItem(String image) {
    return Container(
      height: 50,
      color: Color(0xff1F1F1F),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Image.asset(
              'assets/images/image_1.png',
              width: 30,
              height: 30,
            ),
            Spacer(),
            Text('Lorem ipsum dolor',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 35,
              color: Color(0xffD7191D),
            )
          ],
        ),
      ),
    );
  }

  Padding bottomCustomTabBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTabBarItem(image: 'assets/images/icon_calendar.png'),
          CustomTabBarItem(title: 'Header 1'),
          CustomTabBarItem(title: 'Header 2'),
          CustomTabBarItem(title: 'Header 3'),
        ],
      ),
    );
  }

  Padding topImageLogo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
