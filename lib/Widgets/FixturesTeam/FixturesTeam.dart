import 'package:app_igoal/Screens/ClubPlayers/clubPlayersView.dart';
import 'package:app_igoal/Screens/Home_4/home4View.dart';
import 'package:app_igoal/Screens/leagueInfo/leagueInfoViewModel.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Widget currentMatchesWidget(
    BuildContext context, LeagueInfoViewModel viewModel, int index) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      padding: EdgeInsets.only(left: 12, right: 12),
      child: InkWell(
        splashColor:Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor:Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          Get.to(()=>Home4View(
            id: viewModel.matchsScore[index]['id'].toString(),
            seasonid: viewModel.matchsScore[index]['seasonid'].toString(),
          ));
        },
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
                      formatDate(
                          DateTime.parse(viewModel.matchsScore[index]['time']
                          ['starting_at']['date']),
                          [DD,', ',MM,' ',dd , ',',yyyy ]) +
                          " " +
                          DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
                              viewModel.matchsScore[index]['time']['starting_at']
                              ['time']
                                  .toString())) ,
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
                padding: EdgeInsets.only(top: 5,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(),
                    Container(),
                    Text(
                      viewModel.matchsScore[index]['venue']['data']['name'].toString()=='null'
                          ?"":viewModel.matchsScore[index]['venue']['data']['name'].toString(),
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
                            teamId: viewModel.matchsScore[index]['localTeam']['data']['id'].toString(),
                          ));
                        },
                        child: Center(
                          child: Text(
                            viewModel.matchsScore[index]['localTeam']['data']['name'].toString(),
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
                            teamId: viewModel.matchsScore[index]['localTeam']['data']['id'].toString(),
                          ));
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(360),child: Image.network(viewModel.matchsScore[index]['localTeam']['data']['logo_path'])),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Center(
                        child: Text(
                          viewModel.matchsScore[index]['scores']['localteam_score'].toString()+":"+viewModel.matchsScore[index]['scores']['visitorteam_score'].toString(),
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
                            teamId: viewModel.matchsScore[index]['visitorTeam']['data']['id'].toString(),
                          ));
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(360),child: Image.network(viewModel.matchsScore[index]['visitorTeam']['data']['logo_path'])),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Center(
                        child: Text(
                          viewModel.matchsScore[index]['visitorTeam']['data']['name'].toString(),
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
          //     Container(
          //       height: 35,
          //       padding: EdgeInsets.only(left: 25, top: 10),
          //
          //       child: Row(
          //         children: [
          //           Text(
          //             formatDate(
          //                 DateTime.parse(viewModel.matchsScore[index]['time']
          //                 ['starting_at']['date']),
          //                 [yyyy, '-', M, '-', dd]) +
          //                 " " +
          //                 DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
          //                     viewModel.matchsScore[index]['time']['starting_at']
          //                     ['time']
          //                         .toString())) ,
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 16,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.93,
          //   child: Divider(
          //     height: 1,
          //     thickness: 0.3,
          //     color: Colors.white,
          //   ),
          // ),
          //
          //     Container(
          //       height: 50,
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //
          //           Expanded(
          //             child: InkWell(
          //               splashColor:Colors.transparent,
          //               hoverColor: Colors.transparent,
          //               focusColor: Colors.transparent,
          //               highlightColor:Colors.transparent,
          //               overlayColor: MaterialStateProperty.all(Colors.transparent),
          //               onTap: () {
          //                 Get.to(()=>ClubPlayersView(
          //                   teamId: viewModel.matchsScore[index]['localTeam']
          //                           ['data']['id']
          //                       .toString(),
          //                 ));
          //               },
          //               child:  Flexible(
          //                 fit: FlexFit.tight,
          //                 flex: 2,
          //                 child: Text(
          //                   viewModel.leagueName[viewModel.matchsScore[index]
          //                               ['localTeam']['data']['name']] !=
          //                           null
          //                       ? viewModel.leagueName[viewModel.matchsScore[index]
          //                           ['localTeam']['data']['name']]
          //                       : viewModel.matchsScore[index]['localTeam']['data']
          //                           ['name'],
          //                   style: Theme.of(context).primaryTextTheme.subtitle1,
          //                   maxLines: 2,
          //                 ),
          //               ),
          //             ),
          //           ),
          //
          //           InkWell(
          //             splashColor:Colors.transparent,
          //             hoverColor: Colors.transparent,
          //             focusColor: Colors.transparent,
          //             highlightColor:Colors.transparent,
          //             overlayColor: MaterialStateProperty.all(Colors.transparent),
          //             onTap: () {
          //               Get.to(()=>ClubPlayersView(
          //                 teamId: viewModel.matchsScore[index]['localTeam']['data']
          //                 ['id']
          //                     .toString(),
          //               ));
          //             },
          //             child:  Flexible(
          //               fit: FlexFit.tight,
          //               flex: 1,
          //               child: Container(
          //                 width: 45,
          //                 height: 45,
          //                 decoration: BoxDecoration(
          //                     shape: BoxShape.circle, color: Colors.grey),
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(360),
          //                   child: (viewModel.matchsScore[index]['localTeam']['data']
          //                   ['logo_path'] !=
          //                       null)
          //                       ? Image.network(viewModel.matchsScore[index]
          //                   ['localTeam']['data']['logo_path'])
          //                       : Container(),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Row(
          //             children: [
          //               Container(
          //                 // height: 20,
          //                 // width: 40,
          //                 // decoration: BoxDecoration(
          //                 //   borderRadius: BorderRadius.circular(20),
          //                 //   color: Theme.of(context).secondaryHeaderColor,
          //                 // ),
          //                 child: Center(
          //                     child: Text(
          //                   viewModel.matchsScore[index]['scores']
          //                           ['localteam_score']
          //                       .toString()+':'+viewModel.matchsScore[index]['scores']
          //                   ['visitorteam_score']
          //                       .toString(),
          //                       style: TextStyle(
          //                         color:  (ThemeService().theme.toString() == "ThemeMode.dark")
          //                             ? Colors.white
          //                             : Color(0xff1a1a1a),
          //                         fontSize: 24,
          //                       ),
          //                 )),
          //               ),
          //
          //
          //             ],
          //           ),
          //           InkWell(
          //             splashColor:Colors.transparent,
          //             hoverColor: Colors.transparent,
          //             focusColor: Colors.transparent,
          //             highlightColor:Colors.transparent,
          //             overlayColor: MaterialStateProperty.all(Colors.transparent),
          //             onTap: () {
          //               Get.to(()=>ClubPlayersView(
          //                 teamId: viewModel.matchsScore[index]['visitorTeam']
          //                 ['data']['id']
          //                     .toString(),
          //               ));
          //             },
          //             child:  Flexible(
          //               fit: FlexFit.tight,
          //               flex: 1,
          //               child: Container(
          //                 width: 45,
          //                 height: 45,
          //                 decoration: BoxDecoration(
          //                     shape: BoxShape.circle, color: Colors.grey),
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(360),
          //                   child: (viewModel.matchsScore[index]['visitorTeam']
          //                   ['data']['logo_path'] !=
          //                       null)
          //                       ? Image.network(viewModel.matchsScore[index]
          //                   ['visitorTeam']['data']['logo_path'])
          //                       : Container(),
          //                 ),
          //               ),
          //             ),
          //           ),
          //
          //           Expanded(
          //             child: InkWell(
          //               splashColor:Colors.transparent,
          //               hoverColor: Colors.transparent,
          //               focusColor: Colors.transparent,
          //               highlightColor:Colors.transparent,
          //               overlayColor: MaterialStateProperty.all(Colors.transparent),
          //               onTap: () {
          //                 Get.to(()=>ClubPlayersView(
          //                   teamId: viewModel.matchsScore[index]['visitorTeam']
          //                           ['data']['id']
          //                       .toString(),
          //                 ));
          //               },
          //               child:  Flexible(
          //                 fit: FlexFit.tight,
          //                 flex: 2,
          //                 child: Text(
          //                   viewModel.leagueName[viewModel.matchsScore[index]
          //                               ['visitorTeam']['data']['name']] !=
          //                           null
          //                       ? viewModel.leagueName[viewModel.matchsScore[index]
          //                           ['visitorTeam']['data']['name']]
          //                       : viewModel.matchsScore[index]['visitorTeam']['data']
          //                           ['name'],
          //                   style: Theme.of(context).primaryTextTheme.subtitle1,
          //                 ),
          //               ),
          //             ),
          //           ),
          //
          //
          //         ],
          //       ),
          //     ),
            ],
          ),
        ),
      ),
    ),
  );
}
