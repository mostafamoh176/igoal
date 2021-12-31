import 'package:app_igoal/Screens/Home_4/home4ViewModel.dart';
import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/TeamStandings/TeamStandings.dart';
import 'package:app_igoal/helpers/importFiles.dart';
// import 'package:app_igoal/Widgets/TeamStandings/TeamStandings.dart';

import 'package:flutter/material.dart';

import 'leagueInfoViewModel.dart';

class TeamStandingScreenUI extends StatefulWidget {
  final LeagueInfoViewModel leagueInfoViewModel;

  const TeamStandingScreenUI({this.leagueInfoViewModel});

  @override
  _TeamStandingScreenUIState createState() => _TeamStandingScreenUIState();
}

class _TeamStandingScreenUIState extends State<TeamStandingScreenUI>
    with AutomaticKeepAliveClientMixin {
  Future _service;

  @override
  void initState() {
    _service = widget.leagueInfoViewModel.getStandings();
    // _service = _leagueInfo.getKnockoutData();
    widget.leagueInfoViewModel.getseasonStandings(widget.leagueInfoViewModel.currentSessionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<dynamic>(
      future: _service,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CustomLoader(),
            );
          default:
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child:
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // primary: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.leagueInfoViewModel.seasonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            arrangementsMainItem(
                                context,
                                widget.leagueInfoViewModel,index),
                            if((widget.leagueInfoViewModel.seasonList.length-1)==index)
                              widget.leagueInfoViewModel.arry.length <= 6
                                  ? bottomLeagueInfo(context, widget.leagueInfoViewModel)
                                  : Container(),
                          ],
                        );
                      })
                // child: arrangementsMainItem(context, widget.leagueInfoViewModel),
              );
                  // );
            }
            return Container();
          // Container();

        }
      },
    );


  }


  // Padding arrangementsMainItem(BuildContext context, Season seasonMatchModel,
  //     dynamic dataList, LeagueInfoViewModel viewModel) {
  //   print("dataList" + dataList.length.toString());
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       height: (dataList.length > 10)
  //           ? (57 * dataList.length).toDouble()
  //           : (70 * dataList.length).toDouble(),
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         color: Theme.of(context).secondaryHeaderColor,
  //         // color: Colors.orange
  //       ),
  //       child: Directionality(
  //         textDirection: TextDirection.rtl,
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: 1,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   (seasonMatchModel.groupName == null)
  //                       ? ''
  //                       : seasonMatchModel.groupName,
  //                   style: Theme.of(context).primaryTextTheme.headline1,
  //                 )
  //               ],
  //             ),
  //             SizedBox(
  //               height: 5,
  //             ),
  //             Row(
  //               children: [
  //                 Flexible(
  //                   flex: 2,
  //                   fit: FlexFit.tight,
  //                   child: Text(' ',
  //                       style: Theme.of(context).primaryTextTheme.headline1),
  //                 ),
  //                 Flexible(
  //                   flex: 3,
  //                   fit: FlexFit.tight,
  //                   child: Text('الفريق',
  //                       style: Theme.of(context).primaryTextTheme.headline1),
  //                 ),
  //                 Flexible(
  //                   flex: 1,
  //                   fit: FlexFit.tight,
  //                   child: Text('ل',
  //                       style: Theme.of(context).primaryTextTheme.headline1),
  //                 ),
  //                 SizedBox(
  //                   width: 9,
  //                 ),
  //                 Flexible(
  //                   flex: 1,
  //                   fit: FlexFit.tight,
  //                   child: Text('ف',
  //                       style: Theme.of(context).primaryTextTheme.headline1),
  //                 ),
  //                 SizedBox(
  //                   width: 9,
  //                 ),
  //                 Flexible(
  //                   flex: 1,
  //                   fit: FlexFit.tight,
  //                   child: Text('ت',
  //                       style: Theme.of(context).primaryTextTheme.headline1),
  //                 ),
  //                 SizedBox(
  //                   width: 9,
  //                 ),
  //                 Flexible(
  //                   flex: 1,
  //                   fit: FlexFit.tight,
  //                   child: Text('خ',
  //                       style: Theme.of(context).primaryTextTheme.headline1),
  //                 ),
  //                 SizedBox(
  //                   width: 9,
  //                 ),
  //                 Center(
  //                   child: Flexible(
  //                     flex: 3,
  //                     fit: FlexFit.tight,
  //                     child: Text('نقاط',
  //                         style: Theme.of(context).primaryTextTheme.headline1),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 9,
  //                 ),
  //                 Center(
  //                   child: Flexible(
  //                     flex: 3,
  //                     fit: FlexFit.tight,
  //                     child: Text('اهداف',
  //                         style: Theme.of(context).primaryTextTheme.headline1),
  //                   ),
  //                 ),
  //                 Flexible(
  //                   flex: 1,
  //                   fit: FlexFit.tight,
  //                   child: Text(' ',
  //                       style: Theme.of(context).primaryTextTheme.headline1),
  //                 ),
  //               ],
  //             ),
  //             Expanded(
  //               // height: (dataList.length * 60).toDouble(),
  //               child: Container(
  //                 child: ListView.builder(
  //                   itemCount: dataList.length,
  //                   physics: NeverScrollableScrollPhysics(),
  //                   itemBuilder: (BuildContext context, int index) {
  //                     print('inner List');
  //                     print("dataList:" + dataList.length.toString());
  //
  //                     return arrangementsInnerItem(
  //                         context, dataList[index], viewModel);
  //                   },
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget arrangementsInnerItem(
      BuildContext context, dynamic data, LeagueInfoViewModel viewModel) {
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
                    arrangementsClubIconItem(data['team']['data']['logo_path']),
                    SizedBox(width: 5),
                    Expanded(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              viewModel.leagueName[data['team']['data']
                              ['name']] !=
                                  null
                                  ? viewModel
                                  .leagueName[data['team']['data']['name']]
                                  : data['team']['data']['name'],
                              style:
                              Theme.of(context).primaryTextTheme.subtitle1,
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
                                            fontSize: 8.0, color: Colors.green),
                                        textAlign: TextAlign.center)),
                              ),
                            if (viewModel.arry.length == 2 &&
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
                                            fontSize: 8.0, color: Colors.green),
                                        textAlign: TextAlign.center)),
                              )
                            else if (viewModel.arry.length == 2 &&
                                viewModel.arry[0] != data['result'])
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
                                            fontSize: 8.0, color: Colors.red),
                                        textAlign: TextAlign.center)),
                              ),
                            if (viewModel.arry.length == 3 &&
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
                                            fontSize: 8.0, color: Colors.green),
                                        textAlign: TextAlign.center)),
                              )
                            else if (viewModel.arry.length == 3 &&
                                viewModel.arry[1] == data['result'])
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
                                            color: Colors.amberAccent),
                                        textAlign: TextAlign.center)),
                              )
                            else if (viewModel.arry.length == 3 &&
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
                                              fontSize: 8.0, color: Colors.red),
                                          textAlign: TextAlign.center)),
                                ),
                            if (viewModel.arry.length == 4 &&
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
                                            fontSize: 8.0, color: Colors.green),
                                        textAlign: TextAlign.center)),
                              )
                            else if (viewModel.arry.length == 4 &&
                                viewModel.arry[1] == data['result'])
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
                                            color: Colors.amberAccent),
                                        textAlign: TextAlign.center)),
                              )
                            else if (viewModel.arry.length == 4 &&
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
                                              color: Colors.orange),
                                          textAlign: TextAlign.center)),
                                )
                              else if (viewModel.arry.length == 4 &&
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
                                                  fontSize: 8.0, color: Colors.red),
                                              textAlign: TextAlign.center))),
                            if (viewModel.arry.length == 5 &&
                                viewModel.arry[0] == data['result'])
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '',
                                          style: TextStyle(
                                              fontSize: 8.0,
                                              color: Colors.green),
                                          textAlign: TextAlign.center)))
                            else if (viewModel.arry.length == 5 &&
                                viewModel.arry[1] == data['result'])
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                          data['result'].toString().isNotEmpty
                                              ? (data['result'].toString() == 'null'
                                              ? ''
                                              : data['result'].toString())
                                              : '',
                                          style: TextStyle(fontSize: 8.0, color: Colors.amberAccent),
                                          textAlign: TextAlign.center)))
                            else if (viewModel.arry.length == 5 && viewModel.arry[2] == data['result'])
                                Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Color(0xffD2B48C)), textAlign: TextAlign.center)))
                              else if (viewModel.arry.length == 5 && viewModel.arry[3] == data['result'])
                                  Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Colors.orange), textAlign: TextAlign.center)))
                                else if (viewModel.arry.length == 5 && viewModel.arry[4] == data['result'])
                                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Colors.black), textAlign: TextAlign.center))),

                            //6
                            if (viewModel.arry.length == 6 &&
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
                                          textAlign: TextAlign.center)))
                            else if (viewModel.arry.length == 6 &&
                                viewModel.arry[1] == data['result'])
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
                                              color: Colors.amberAccent),
                                          textAlign: TextAlign.center)))
                            else if (viewModel.arry.length == 6 &&
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
                              else if (viewModel.arry.length == 6 &&
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
                                else if (viewModel.arry.length == 6 &&
                                      viewModel.arry[4] == data['result'])
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: Text(
                                            data['result'].toString().isNotEmpty
                                                ? (data['result'].toString() == 'null'
                                                ? ''
                                                : data['result'].toString())
                                                : '',
                                            style: TextStyle(
                                                fontSize: 8.0, color: Colors.black),
                                            textAlign: TextAlign.center),
                                      ),
                                    )
                                  else if (viewModel.arry.length == 6 &&
                                        viewModel.arry[5] == data['result'])
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Align(
                                          alignment: AlignmentDirectional.center,
                                          child: Text(
                                              data['result'].toString().isNotEmpty
                                                  ? (data['result'].toString() == 'null'
                                                  ? ''
                                                  : data['result'].toString())
                                                  : '',
                                              style: TextStyle(
                                                  fontSize: 8.0, color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
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

  @override
  bool get wantKeepAlive => true;
}


