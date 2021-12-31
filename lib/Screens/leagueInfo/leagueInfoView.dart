import 'package:app_igoal/Components/TabIndicatorDecoration.dart';
import 'package:app_igoal/Screens/Home_4/home4ViewModel.dart';
import 'package:app_igoal/Screens/leagueInfo/FixturesTeams.dart';
import 'package:app_igoal/Screens/leagueInfo/KnockoutStage.dart';
import 'package:app_igoal/Screens/leagueInfo/LeagueNews.dart';
import 'package:app_igoal/Screens/leagueInfo/LeagueVenue.dart';
import 'package:app_igoal/Screens/leagueInfo/PlayerStatistics.dart';
import 'package:app_igoal/Screens/leagueInfo/SeaonCountry.dart';
import 'package:app_igoal/Screens/leagueInfo/TeamStandings.dart';
import 'package:app_igoal/Screens/leagueInfo/leagueInfoViewModel.dart';
import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/NetworkImage/NetworkImage.dart';
import 'package:app_igoal/Widgets/TeamStandings/TeamStandings.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:get/get.dart';


class LeagueInfoView extends StatefulWidget {
  final String leagueId;

  LeagueInfoView({this.leagueId});

  @override
  _LeagueInfoViewState createState() => _LeagueInfoViewState();
}

class _LeagueInfoViewState extends State<LeagueInfoView> {
  @override
  Widget build(BuildContext context) {
    print("league['id']:"+ widget.leagueId.toString());
    return Scaffold(
        body: GetBuilder<LeagueInfoViewModel>(
            init: LeagueInfoViewModel(leagueId: widget.leagueId),
            builder: (viewModel) {
              return (viewModel.viewState == ViewState.Idle)
                  ? Container(
                color: (ThemeService().theme.toString() == "ThemeMode.dark")
                    ? Colors.black
                    : Colors.white,
                    child: DefaultTabController(
                        length: 6, //7
                        initialIndex: 1,
                        child: NestedScrollView(

                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return <Widget>[
                              SliverAppBar(

                                expandedHeight: 300,
                                backgroundColor:
                                    Theme.of(context).secondaryHeaderColor,
                                elevation: 0.0,
                                iconTheme: IconThemeData(color: Colors.black),
                                leading: IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Icon(Icons.navigate_before),
                                  color: Theme.of(context).buttonColor,
                                ),
                                floating: false,
                                pinned: true,
                                flexibleSpace: FlexibleSpaceBar(
                                    background: (viewModel.leagueData != null)
                                        ? leagueTopItem(context, viewModel)
                                        : Container()),
                              ),
                              SliverPadding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                sliver: SliverPersistentHeader(
                                  delegate: _SliverAppBarDelegate(
                                    TabBar(
                                        isScrollable: true,
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: (ThemeService().theme ==
                                                    ThemeMode.dark)
                                                ? Theme.of(context)
                                                    .secondaryHeaderColor
                                                : Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .color),
                                        indicatorPadding:
                                            EdgeInsets.symmetric(horizontal: 8.0),
                                        indicator: MD2Indicator(
                                            indicatorColor: Colors.red,
                                            indicatorHeight: 5.0,
                                            indicatorSize:
                                                MD2IndicatorSize.normal),
                                        labelColor: (ThemeService().theme ==
                                            ThemeMode.dark)
                                            ? Colors.white
                                            : Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .color,
                                        tabs: [
                                          Tab(text: "الفرق"),
                                           // Tab(text: 'قصا'),
                                          Tab(text: "الترتيب"),
                                          Tab(text: "الاخبار"),
                                          Tab(text: "الملاعب"),
                                          Tab(text: "الهدافين"),
                                          Tab(text: "المباريات"),
                                        ]),
                                  ),
                                  pinned: true,
                                ),
                              ),
                            ];
                          },
                          body: TabBarView(children: [
                            SeasonCountryScreenUI(leagueInfoViewModel: viewModel),

                           // KnockoutStages(leagueInfoViewModel: viewModel),
                            TeamStandingScreenUI(leagueInfoViewModel: viewModel),

                            LeagueNews(leagueInfoViewModel: viewModel),
                            LeagueVenue(leagueInfoViewModel: viewModel),
                            PlayerStatistics(leagueInfoViewModel: viewModel),
                            FixturesTeam(leagueInfoViewModel: viewModel),
                          ]),
                        ),
                      ),
                  )
                  : Center(
                      child: CustomLoader(),
                    );
            }));
  }

  Column leagueTopItem(BuildContext context, LeagueInfoViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SizedBox(
              height: 80,
              width: 80,
              child: appNetworkImage(
                  viewModel.leagueData['logo_path'], BoxFit.contain)),
        ),
        Text(
          viewModel.leagueName[viewModel.leagueData['name']] != null
              ? viewModel.leagueName[viewModel.leagueData['name']]
              : viewModel.leagueData['name'],
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              viewModel.countriesArabic
                          .where((o) =>
                              o['id'].toString() ==
                              viewModel.leagueData['country']['data']['id']
                                  .toString())
                          .toList()
                          .length >
                      0
                  ? viewModel.countriesArabic
                      .where((o) =>
                          o['id'].toString() ==
                          viewModel.leagueData['country']['data']['id']
                              .toString())
                      .toList()[0]['name']
                      .toString()
                  : viewModel.leagueData['country']['data']['name'].toString(),
              //viewModel.countriesArabic.where((o)=>o["id"]==viewModel.leagueData['country']['data']['id']).toList()[0]['name'],
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            SizedBox(
              width: 8,
            ),
            // Container(
            //   height: 50,
            //   width: 50,
            //   color: Colors.transparent,
            //   child: (viewModel.leagueData['country']['data']['image_path'] !=
            //           null)
            //       ? appNetworkImage(
            //           viewModel.leagueData['country']['data']['image_path'],
            //           BoxFit.contain)
            //       : Container(),
            // )
          ],
        )
      ],
    );
  }
  Widget bottomLeague(LeagueInfoViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: InkWell(
          splashColor:Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor:Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          child: Container(
            height: 55 * viewModel.arry.length.toDouble(),
            decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(20)),
            child: Directionality(
              textDirection: TextDirection.rtl,
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
  Padding arrangementsMainItem(BuildContext context, Season seasonMatchModel,
      dynamic dataList, LeagueInfoViewModel viewModel) {
    print("dataList" + dataList.length.toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: (dataList.length > 10)
            ? (57 * dataList.length).toDouble()
            : (70 * dataList.length).toDouble(),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).secondaryHeaderColor,
          // color: Colors.orange
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (seasonMatchModel.groupName == null)
                        ? ''
                        : seasonMatchModel.groupName,
                    style: Theme.of(context).primaryTextTheme.headline1,
                  )
                ],
              ),
              SizedBox(
                height: 5,
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
}



class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
            color: (ThemeService().theme == ThemeMode.dark)
                ? Theme.of(context)
                .secondaryHeaderColor
                : Colors.white,
            padding: EdgeInsets.symmetric(vertical: 3.0),
            child: _tabBar),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
