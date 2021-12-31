import 'package:app_igoal/Screens/ClubPlayers/clubPlayersView.dart';
import 'package:app_igoal/Screens/leagueInfo/leagueInfoViewModel.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

Padding arrangementsMainItem(
    BuildContext context, LeagueInfoViewModel viewModel, int indexlist) {
  // print("seasonList:"+viewModel.seasonList[5].data.toString());
  return Padding(
    padding: const EdgeInsets.only(right: 8,left: 8,bottom: 8),
    child: Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('الفريق',
                            style:
                                Theme.of(context).primaryTextTheme.headline1),
                      ],
                    )),
                Expanded(
                  // flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('ل',
                          style: Theme.of(context).primaryTextTheme.headline1),
                      SizedBox(
                        width: 10,
                      ),
                      Text('ف',
                          style: Theme.of(context).primaryTextTheme.headline1),
                      SizedBox(
                        width: 10,
                      ),
                      Text('ت',
                          style: Theme.of(context).primaryTextTheme.headline1),
                      SizedBox(
                        width: 10,
                      ),
                      Text('خ',
                          style: Theme.of(context).primaryTextTheme.headline1),
                      SizedBox(
                        width: 10,
                      ),
                      Text('نقاط',
                          style: Theme.of(context).primaryTextTheme.headline1),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,0,0),
                        child: Text('اهداف',
                            style: Theme.of(context).primaryTextTheme.headline1),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //viewModel.standings[index] = viewModel.seasonList[index].data
          Column(
            children: List.generate(
                viewModel.seasonList[indexlist].data.length,
              (index) {

              return
                arrangementsInnerItem(
                    context, viewModel.seasonList[indexlist].data[index], viewModel);
              }
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // // if(viewModel.seasonList.length>0)
          // viewModel.arry.length <= 6
          //     ? bottomLeagueInfo(context, viewModel)
          //     : Container(),
        ],
      ),
    ),
  );
}

Widget arrangementsInnerItem(
    BuildContext context, dynamic data, LeagueInfoViewModel viewModel) {
  // print("seasonList:"+data.toString());
  return Row(
    children: [
      // Container(child: Text(viewModel.seasonList.length.toString()),),
      // Container(
      //   child: Text(data.length.toString()),
      // ),

      Container(
        height: 50,
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
                viewModel.arry[0] == data['result'].toString())
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
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                            maxLines: 1,
                          ),
                          if (viewModel.arry.length == 1 &&
                              viewModel.arry[0] == data['result'])
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child:Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
                              //                 ? ''
                              //                 : data['result'].toString())
                              //             : '',
                              //         style: TextStyle(
                              //             fontSize: 8.0, color: Colors.green),
                              //         textAlign: TextAlign.center)),
                            ),
                          if (viewModel.arry.length == 2 &&
                              viewModel.arry[0] == data['result'])
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
                              //                 ? ''
                              //                 : data['result'].toString())
                              //             : '',
                              //         style: TextStyle(
                              //             fontSize: 8.0, color: Colors.green),
                              //         textAlign: TextAlign.center)),
                            )
                          else if (viewModel.arry.length == 2 &&
                              viewModel.arry[0] != data['result'])
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child:Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
                              //                 ? ''
                              //                 : data['result'].toString())
                              //             : '',
                              //         style: TextStyle(
                              //             fontSize: 8.0, color: Colors.red),
                              //         textAlign: TextAlign.center)),
                            ),
                          if (viewModel.arry.length == 3 &&
                              viewModel.arry[0] == data['result'])
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
                              //                 ? ''
                              //                 : data['result'].toString())
                              //             : '',
                              //         style: TextStyle(
                              //             fontSize: 8.0, color: Colors.green),
                              //         textAlign: TextAlign.center)),
                            )
                          else if (viewModel.arry.length == 3 &&
                              viewModel.arry[1] == data['result'])
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child:Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child:Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
                              //                 ? ''
                              //                 : data['result'].toString())
                              //             : '',
                              //         style: TextStyle(
                              //             fontSize: 8.0, color: Colors.green),
                              //         textAlign: TextAlign.center),),
                            )
                          else if (viewModel.arry.length == 4 &&
                              viewModel.arry[1] == data['result'])
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(),
                              // Align(
                              //     alignment: AlignmentDirectional.center,
                              //     child: Text(
                              //         data['result'].toString().isNotEmpty
                              //             ? (data['result'].toString() == 'null'
                              //                 ? ''
                              //                 : data['result'].toString())
                              //             : '',
                              //         style: TextStyle(
                              //             fontSize: 8.0, color: Colors.orange),
                              //         textAlign: TextAlign.center)),
                            )
                          else if (viewModel.arry.length == 4 &&
                              viewModel.arry[3] == data['result'])
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child:Container(),
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
                                //         textAlign: TextAlign.center))
                            ),
                          if (viewModel.arry.length == 5 &&
                              viewModel.arry[0] == data['result'])
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(),
                                // Align(
                                //     alignment: AlignmentDirectional.center,
                                //     child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '',
                                //         style: TextStyle(
                                //             fontSize: 8.0, color: Colors.green),
                                //         textAlign: TextAlign.center))
                            )
                          else if (viewModel.arry.length == 5 &&
                              viewModel.arry[1] == data['result'])
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(),
                                // Align(
                                //     alignment: AlignmentDirectional.center,
                                //     child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '',
                                //         style: TextStyle(
                                //             fontSize: 8.0,
                                //             color: Colors.amberAccent),
                                //         textAlign: TextAlign.center))
                            )
                          else if (viewModel.arry.length == 5 &&
                              viewModel.arry[2] == data['result'])
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child:Container()) //Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Color(0xffD2B48C)), textAlign: TextAlign.center)))
                          else if (viewModel.arry.length == 5 && viewModel.arry[3] == data['result'])
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child:
                            Container(),// Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Colors.orange), textAlign: TextAlign.center),),
                            )
                          else if (viewModel.arry.length == 5 && viewModel.arry[4] == data['result'])
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child:
                                Container(),    // Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Colors.black), textAlign: TextAlign.center))
                            ),

                          //6
                          if (viewModel.arry.length == 6 &&
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
                                //             fontSize: 8.0, color: Colors.green),
                                //         textAlign: TextAlign.center))
                            )
                          else if (viewModel.arry.length == 6 &&
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
                                //         textAlign: TextAlign.center))
                            )
                          else if (viewModel.arry.length == 6 &&
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
                                //             color: Color(0xffD2B48C)),
                                //         textAlign: TextAlign.center))
                            )
                          else if (viewModel.arry.length == 6 &&
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
                                //             color: Colors.orange),
                                //         textAlign: TextAlign.center))
                            )
                          else if (viewModel.arry.length == 6 &&
                              viewModel.arry[4] == data['result'])
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
// Widget arrangementsInnerItem(
//     BuildContext context, dynamic data, LeagueInfoViewModel viewModel) {
//   return Row(
//     children: [
//       Container(
//         height: 53,
//         width: MediaQuery.of(context).size.width / 3.0,
//         padding: EdgeInsets.only(top: 6, bottom: 6),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (viewModel.arry.length == 1 &&
//                 viewModel.arry[0] == data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.green,
//               ),
//             if (viewModel.arry.length == 2 &&
//                 viewModel.arry[0] == data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.green,
//               )
//             else if (viewModel.arry.length == 2 &&
//                 viewModel.arry[0] != data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.red,
//               ),
//             if (viewModel.arry.length == 3 &&
//                 viewModel.arry[0] == data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.green,
//               )
//             else if (viewModel.arry.length == 3 &&
//                 viewModel.arry[1] == data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.yellow,
//               )
//             else if (viewModel.arry.length == 3 &&
//                   viewModel.arry[2] == data['result'])
//                 Container(
//                   height: 50,
//                   width: 3,
//                   color: Colors.red,
//                 ),
//             if (viewModel.arry.length == 4 &&
//                 viewModel.arry[0] == data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.green,
//               )
//             else if (viewModel.arry.length == 4 &&
//                 viewModel.arry[1] == data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.yellow,
//               )
//             else if (viewModel.arry.length == 4 &&
//                   viewModel.arry[2] == data['result'])
//                 Container(
//                   height: 50,
//                   width: 3,
//                   color: Colors.orange,
//                 )
//               else if (viewModel.arry.length == 4 &&
//                     viewModel.arry[3] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.red,
//                   ),
//             if (viewModel.arry.length == 5 &&
//                 viewModel.arry[0] == data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.green,
//               )
//             else if (viewModel.arry.length == 5 &&
//                 viewModel.arry[1] == data['result'])
//               Container(
//                 height: 50,
//                 width: 3,
//                 color: Colors.yellow,
//               )
//             else if (viewModel.arry.length == 5 &&
//                   viewModel.arry[2] == data['result'])
//                 Container(
//                   height: 50,
//                   width: 3,
//                   color: Color(0xffD2B48C),
//                 )
//               else if (viewModel.arry.length == 5 &&
//                     viewModel.arry[3] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.orange,
//                   )
//                 else if (viewModel.arry.length == 5 &&
//                       viewModel.arry[4] == data['result'])
//                     Container(
//                       height: 50,
//                       width: 2,
//                       color: Colors.red,
//                     ),
//             SizedBox(width: 4),
//             Expanded(
//               child: Row(
//                 children: [
//                   Text(
//                     ' ',
//                     style: Theme.of(context).primaryTextTheme.subtitle1,
//                   ),
//                   arrangementsClubIconItem(data['team']['data']['logo_path']),
//                   SizedBox(width: 5),
//                   Expanded(
//                     child: Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             viewModel.leagueName[data['team']['data']
//                             ['name']] !=
//                                 null
//                                 ? viewModel
//                                 .leagueName[data['team']['data']['name']]
//                                 : data['team']['data']['name'],
//                             style:
//                             Theme.of(context).primaryTextTheme.subtitle1,
//                             maxLines: 1,
//                           ),
//                           if (viewModel.arry.length == 1 &&
//                               viewModel.arry[0] == data['result'])
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0),
//                               child: Align(
//                                   alignment: AlignmentDirectional.center,
//                                   child: Text(
//                                       data['result'].toString().isNotEmpty
//                                           ? (data['result'].toString() ==
//                                           'null'
//                                           ? ''
//                                           : data['result'].toString())
//                                           : '',
//                                       style: TextStyle(
//                                           fontSize: 8.0, color: Colors.green),
//                                       textAlign: TextAlign.center)),
//                             ),
//                           if (viewModel.arry.length == 2 &&
//                               viewModel.arry[0] == data['result'])
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0),
//                               child: Align(
//                                   alignment: AlignmentDirectional.center,
//                                   child: Text(
//                                       data['result'].toString().isNotEmpty
//                                           ? (data['result'].toString() ==
//                                           'null'
//                                           ? ''
//                                           : data['result'].toString())
//                                           : '',
//                                       style: TextStyle(
//                                           fontSize: 8.0, color: Colors.green),
//                                       textAlign: TextAlign.center)),
//                             )
//                           else if (viewModel.arry.length == 2 &&
//                               viewModel.arry[0] != data['result'])
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0),
//                               child: Align(
//                                   alignment: AlignmentDirectional.center,
//                                   child: Text(
//                                       data['result'].toString().isNotEmpty
//                                           ? (data['result'].toString() ==
//                                           'null'
//                                           ? ''
//                                           : data['result'].toString())
//                                           : '',
//                                       style: TextStyle(
//                                           fontSize: 8.0, color: Colors.red),
//                                       textAlign: TextAlign.center)),
//                             ),
//                           if (viewModel.arry.length == 3 &&
//                               viewModel.arry[0] == data['result'])
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0),
//                               child: Align(
//                                   alignment: AlignmentDirectional.center,
//                                   child: Text(
//                                       data['result'].toString().isNotEmpty
//                                           ? (data['result'].toString() ==
//                                           'null'
//                                           ? ''
//                                           : data['result'].toString())
//                                           : '',
//                                       style: TextStyle(
//                                           fontSize: 8.0, color: Colors.green),
//                                       textAlign: TextAlign.center)),
//                             )
//                           else if (viewModel.arry.length == 3 &&
//                               viewModel.arry[1] == data['result'])
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0),
//                               child: Align(
//                                   alignment: AlignmentDirectional.center,
//                                   child: Text(
//                                       data['result'].toString().isNotEmpty
//                                           ? (data['result'].toString() ==
//                                           'null'
//                                           ? ''
//                                           : data['result'].toString())
//                                           : '',
//                                       style: TextStyle(
//                                           fontSize: 8.0,
//                                           color: Colors.amberAccent),
//                                       textAlign: TextAlign.center)),
//                             )
//                           else if (viewModel.arry.length == 3 &&
//                                 viewModel.arry[2] == data['result'])
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 child: Align(
//                                     alignment: AlignmentDirectional.center,
//                                     child: Text(
//                                         data['result'].toString().isNotEmpty
//                                             ? (data['result'].toString() ==
//                                             'null'
//                                             ? ''
//                                             : data['result'].toString())
//                                             : '',
//                                         style: TextStyle(
//                                             fontSize: 8.0, color: Colors.red),
//                                         textAlign: TextAlign.center)),
//                               ),
//                           if (viewModel.arry.length == 4 &&
//                               viewModel.arry[0] == data['result'])
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0),
//                               child: Align(
//                                   alignment: AlignmentDirectional.center,
//                                   child: Text(
//                                       data['result'].toString().isNotEmpty
//                                           ? (data['result'].toString() ==
//                                           'null'
//                                           ? ''
//                                           : data['result'].toString())
//                                           : '',
//                                       style: TextStyle(
//                                           fontSize: 8.0, color: Colors.green),
//                                       textAlign: TextAlign.center)),
//                             )
//                           else if (viewModel.arry.length == 4 &&
//                               viewModel.arry[1] == data['result'])
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0),
//                               child: Align(
//                                   alignment: AlignmentDirectional.center,
//                                   child: Text(
//                                       data['result'].toString().isNotEmpty
//                                           ? (data['result'].toString() ==
//                                           'null'
//                                           ? ''
//                                           : data['result'].toString())
//                                           : '',
//                                       style: TextStyle(
//                                           fontSize: 8.0,
//                                           color: Colors.amberAccent),
//                                       textAlign: TextAlign.center)),
//                             )
//                           else if (viewModel.arry.length == 4 &&
//                                 viewModel.arry[2] == data['result'])
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 child: Align(
//                                     alignment: AlignmentDirectional.center,
//                                     child: Text(
//                                         data['result'].toString().isNotEmpty
//                                             ? (data['result'].toString() ==
//                                             'null'
//                                             ? ''
//                                             : data['result'].toString())
//                                             : '',
//                                         style: TextStyle(
//                                             fontSize: 8.0,
//                                             color: Colors.orange),
//                                         textAlign: TextAlign.center)),
//                               )
//                             else if (viewModel.arry.length == 4 &&
//                                   viewModel.arry[3] == data['result'])
//                                 Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0),
//                                     child: Align(
//                                         alignment: AlignmentDirectional.center,
//                                         child: Text(
//                                             data['result'].toString().isNotEmpty
//                                                 ? (data['result'].toString() ==
//                                                 'null'
//                                                 ? ''
//                                                 : data['result'].toString())
//                                                 : '',
//                                             style: TextStyle(
//                                                 fontSize: 8.0, color: Colors.red),
//                                             textAlign: TextAlign.center))),
//                           if (viewModel.arry.length == 5 &&
//                               viewModel.arry[0] == data['result'])
//                             Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 child: Align(
//                                     alignment: AlignmentDirectional.center,
//                                     child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '',
//                                         style: TextStyle(
//                                             fontSize: 8.0,
//                                             color: Colors.green),
//                                         textAlign: TextAlign.center)))
//                           else if (viewModel.arry.length == 5 &&
//                               viewModel.arry[1] == data['result'])
//                             Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 child: Align(
//                                     alignment: AlignmentDirectional.center,
//                                     child: Text(
//                                         data['result'].toString().isNotEmpty
//                                             ? (data['result'].toString() == 'null'
//                                             ? ''
//                                             : data['result'].toString())
//                                             : '',
//                                         style: TextStyle(fontSize: 8.0, color: Colors.amberAccent),
//                                         textAlign: TextAlign.center)))
//                           else if (viewModel.arry.length == 5 && viewModel.arry[2] == data['result'])
//                               Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Color(0xffD2B48C)), textAlign: TextAlign.center)))
//                             else if (viewModel.arry.length == 5 && viewModel.arry[3] == data['result'])
//                                 Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Colors.orange), textAlign: TextAlign.center)))
//                               else if (viewModel.arry.length == 5 && viewModel.arry[4] == data['result'])
//                                   Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: Align(alignment: AlignmentDirectional.center, child: Text(data['result'].toString().isNotEmpty ? (data['result'].toString() == 'null' ? '' : data['result'].toString()) : '', style: TextStyle(fontSize: 8.0, color: Colors.black), textAlign: TextAlign.center))),
//
//                           //6
//                           if (viewModel.arry.length == 6 &&
//                               viewModel.arry[0] == data['result'])
//                             Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 child: Align(
//                                     alignment: AlignmentDirectional.center,
//                                     child: Text(
//                                         data['result'].toString().isNotEmpty
//                                             ? (data['result'].toString() ==
//                                             'null'
//                                             ? ''
//                                             : data['result'].toString())
//                                             : '',
//                                         style: TextStyle(
//                                             fontSize: 8.0,
//                                             color: Colors.green),
//                                         textAlign: TextAlign.center)))
//                           else if (viewModel.arry.length == 6 &&
//                               viewModel.arry[1] == data['result'])
//                             Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 child: Align(
//                                     alignment: AlignmentDirectional.center,
//                                     child: Text(
//                                         data['result'].toString().isNotEmpty
//                                             ? (data['result'].toString() ==
//                                             'null'
//                                             ? ''
//                                             : data['result'].toString())
//                                             : '',
//                                         style: TextStyle(
//                                             fontSize: 8.0,
//                                             color: Colors.amberAccent),
//                                         textAlign: TextAlign.center)))
//                           else if (viewModel.arry.length == 6 &&
//                                 viewModel.arry[2] == data['result'])
//                               Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10.0),
//                                   child: Align(
//                                       alignment: AlignmentDirectional.center,
//                                       child: Text(
//                                           data['result'].toString().isNotEmpty
//                                               ? (data['result'].toString() ==
//                                               'null'
//                                               ? ''
//                                               : data['result'].toString())
//                                               : '',
//                                           style: TextStyle(
//                                               fontSize: 8.0,
//                                               color: Color(0xffD2B48C)),
//                                           textAlign: TextAlign.center)))
//                             else if (viewModel.arry.length == 6 &&
//                                   viewModel.arry[3] == data['result'])
//                                 Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0),
//                                     child: Align(
//                                         alignment: AlignmentDirectional.center,
//                                         child: Text(
//                                             data['result'].toString().isNotEmpty
//                                                 ? (data['result'].toString() ==
//                                                 'null'
//                                                 ? ''
//                                                 : data['result'].toString())
//                                                 : '',
//                                             style: TextStyle(
//                                                 fontSize: 8.0,
//                                                 color: Colors.orange),
//                                             textAlign: TextAlign.center)))
//                               else if (viewModel.arry.length == 6 &&
//                                     viewModel.arry[4] == data['result'])
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0),
//                                     child: Align(
//                                       alignment: AlignmentDirectional.center,
//                                       child: Text(
//                                           data['result'].toString().isNotEmpty
//                                               ? (data['result'].toString() == 'null'
//                                               ? ''
//                                               : data['result'].toString())
//                                               : '',
//                                           style: TextStyle(
//                                               fontSize: 8.0, color: Colors.black),
//                                           textAlign: TextAlign.center),
//                                     ),
//                                   )
//                                 else if (viewModel.arry.length == 6 &&
//                                       viewModel.arry[5] == data['result'])
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 10.0),
//                                       child: Align(
//                                         alignment: AlignmentDirectional.center,
//                                         child: Text(
//                                             data['result'].toString().isNotEmpty
//                                                 ? (data['result'].toString() == 'null'
//                                                 ? ''
//                                                 : data['result'].toString())
//                                                 : '',
//                                             style: TextStyle(
//                                                 fontSize: 8.0, color: Colors.black),
//                                             textAlign: TextAlign.center),
//                                       ),
//                                     ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       Expanded(
//         child: Container(
//           padding: EdgeInsets.only(left: 30),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 flex: 1,
//                 fit: FlexFit.tight,
//                 child: Text(data['overall']['games_played'].toString(),
//                     style: Theme.of(context).primaryTextTheme.subtitle1),
//               ),
//               Flexible(
//                 flex: 1,
//                 fit: FlexFit.tight,
//                 child: Text(data['overall']['won'].toString(),
//                     style: Theme.of(context).primaryTextTheme.subtitle1),
//               ),
//               Flexible(
//                 flex: 1,
//                 fit: FlexFit.tight,
//                 child: Text(data['overall']['draw'].toString(),
//                     style: Theme.of(context).primaryTextTheme.subtitle1),
//               ),
//               Flexible(
//                 flex: 1,
//                 fit: FlexFit.tight,
//                 child: Text(data['overall']['lost'].toString(),
//                     style: Theme.of(context).primaryTextTheme.subtitle1),
//               ),
//               Flexible(
//                 flex: 1,
//                 fit: FlexFit.tight,
//                 child: Text(' ' + data['total']['points'].toString(),
//                     style: Theme.of(context).primaryTextTheme.subtitle1),
//               ),
//               Flexible(
//                 flex: 1,
//                 fit: FlexFit.tight,
//                 child: Center(
//                   child: Text(
//                     data['total']['goal_difference'].toString(),
//                     style: Theme.of(context).primaryTextTheme.subtitle1,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
//
// Widget arrangementsInnerItem(BuildContext context, dynamic data,
//     LeagueInfoViewModel viewModel, int index) {
//   return Column(
//     children: [
//       Row(
//         children: [
//           Container(
//             height: 50,
//             //color: Colors.red,
//             width: MediaQuery.of(context).size.width / 2.2,
//             padding: EdgeInsets.only(
//               top: 6,
//               bottom: 6,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (viewModel.arry.length == 1 &&
//                     viewModel.arry[0] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.green,
//                   ),
//                 if (viewModel.arry.length == 2 &&
//                     viewModel.arry[0] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.green,
//                   )
//                 else if (viewModel.arry.length == 2 &&
//                     viewModel.arry[0] != data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.red,
//                   ),
//                 if (viewModel.arry.length == 3 &&
//                     viewModel.arry[0] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.green,
//                   )
//                 else if (viewModel.arry.length == 3 &&
//                     viewModel.arry[1] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.amberAccent,
//                   )
//                 else if (viewModel.arry.length == 3 &&
//                     viewModel.arry[2] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.red,
//                   ),
//                 if (viewModel.arry.length == 4 &&
//                     viewModel.arry[0] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.green,
//                   )
//                 else if (viewModel.arry.length == 4 &&
//                     viewModel.arry[1] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.amberAccent,
//                   )
//                 else if (viewModel.arry.length == 4 &&
//                     viewModel.arry[2] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.orange,
//                   )
//                 else if (viewModel.arry.length == 4 &&
//                     viewModel.arry[3] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.red,
//                   ),
//                 if (viewModel.arry.length == 5 &&
//                     viewModel.arry[0] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.green,
//                   )
//                 else if (viewModel.arry.length == 5 &&
//                     viewModel.arry[1] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.amberAccent,
//                   )
//                 else if (viewModel.arry.length == 5 &&
//                     viewModel.arry[2] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Color(0xffD2B48C),
//                   )
//                 else if (viewModel.arry.length == 5 &&
//                     viewModel.arry[3] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.orange,
//                   )
//                 else if (viewModel.arry.length == 5 &&
//                     viewModel.arry[4] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.red,
//                   ),
//
//                 //6
//                 if (viewModel.arry.length == 6 &&
//                     viewModel.arry[0] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.green,
//                   )
//                 else if (viewModel.arry.length == 6 &&
//                     viewModel.arry[1] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.amberAccent,
//                   )
//                 else if (viewModel.arry.length == 6 &&
//                     viewModel.arry[2] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Color(0xffD2B48C),
//                   )
//                 else if (viewModel.arry.length == 6 &&
//                     viewModel.arry[3] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.orange,
//                   )
//                 else if (viewModel.arry.length == 6 &&
//                     viewModel.arry[4] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.red,
//                   )
//                 else if (viewModel.arry.length == 6 &&
//                     viewModel.arry[5] == data['result'])
//                   Container(
//                     height: 50,
//                     width: 3,
//                     color: Colors.red,
//                   ),
//
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Row(
//                     children: [
//                       Text(
//                         (index + 1).toString(),
//                         style: Theme.of(context).primaryTextTheme.subtitle1,
//                       ),
//                       // Spacer(),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       InkWell(
//                           onTap: () {
//                             Get.to(()=>ClubPlayersView(
//                               teamId: data['team']['data']['id'].toString(),
//                             ));
//                           },
//                           child: arrangementsClubIconItem(
//                               data['team']['data']['logo_path'])),
//                       // Spacer(),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       Expanded(
//                         child: Text(
//                           viewModel.leagueName[data['team']['data']['name']] !=
//                                   null
//                               ? viewModel
//                                   .leagueName[data['team']['data']['name']]
//                               : data['team']['data']['name'],
//                           style: Theme.of(context).primaryTextTheme.subtitle1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(left: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(data['overall']['games_played'].toString(),
//                       style: Theme.of(context).primaryTextTheme.subtitle1),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(data['overall']['won'].toString(),
//                       style: Theme.of(context).primaryTextTheme.subtitle1),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(data['overall']['draw'].toString(),
//                       style: Theme.of(context).primaryTextTheme.subtitle1),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(data['overall']['lost'].toString(),
//                       style: Theme.of(context).primaryTextTheme.subtitle1),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text('     ' + data['total']['points'].toString(),
//                       style: Theme.of(context).primaryTextTheme.subtitle1),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text('      ' + data['total']['goal_difference'].toString(),
//                       style: Theme.of(context).primaryTextTheme.subtitle1),
//                   SizedBox(
//                     width: 10,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       if (viewModel.arry.length == 1 && viewModel.arry[0] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.green),
//                   textAlign: TextAlign.start)),
//         ),
//       if (viewModel.arry.length == 2 && viewModel.arry[0] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.green),
//                   textAlign: TextAlign.start)),
//         )
//       else if (viewModel.arry.length == 2 &&
//           viewModel.arry[0] != data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.red),
//                   textAlign: TextAlign.start)),
//         ),
//       if (viewModel.arry.length == 3 && viewModel.arry[0] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.green),
//                   textAlign: TextAlign.start)),
//         )
//       else if (viewModel.arry.length == 3 &&
//           viewModel.arry[1] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.amberAccent),
//                   textAlign: TextAlign.start)),
//         )
//       else if (viewModel.arry.length == 3 &&
//           viewModel.arry[2] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.red),
//                   textAlign: TextAlign.start)),
//         ),
//       if (viewModel.arry.length == 4 && viewModel.arry[0] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.green),
//                   textAlign: TextAlign.start)),
//         )
//       else if (viewModel.arry.length == 4 &&
//           viewModel.arry[1] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.amberAccent),
//                   textAlign: TextAlign.start)),
//         )
//       else if (viewModel.arry.length == 4 &&
//           viewModel.arry[2] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(data['result'],
//                   style: TextStyle(fontSize: 10.0, color: Colors.orange),
//                   textAlign: TextAlign.start)),
//         )
//       else if (viewModel.arry.length == 4 &&
//           viewModel.arry[3] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Colors.red),
//                     textAlign: TextAlign.start))),
//       if (viewModel.arry.length == 5 && viewModel.arry[0] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Colors.green),
//                     textAlign: TextAlign.start)))
//       else if (viewModel.arry.length == 5 &&
//           viewModel.arry[1] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Colors.amberAccent),
//                     textAlign: TextAlign.start)))
//       else if (viewModel.arry.length == 5 &&
//           viewModel.arry[2] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Color(0xffD2B48C)),
//                     textAlign: TextAlign.start)))
//       else if (viewModel.arry.length == 5 &&
//           viewModel.arry[3] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Colors.orange),
//                     textAlign: TextAlign.start)))
//       else if (viewModel.arry.length == 5 &&
//           viewModel.arry[4] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Colors.black),
//                     textAlign: TextAlign.start))),
//
//       //6
//       if (viewModel.arry.length == 6 && viewModel.arry[0] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Colors.green),
//                     textAlign: TextAlign.start)))
//       else if (viewModel.arry.length == 6 &&
//           viewModel.arry[1] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Colors.amberAccent),
//                     textAlign: TextAlign.start)))
//       else if (viewModel.arry.length == 6 &&
//           viewModel.arry[2] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Color(0xffD2B48C)),
//                     textAlign: TextAlign.start)))
//       else if (viewModel.arry.length == 6 &&
//           viewModel.arry[3] == data['result'])
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text(data['result'],
//                     style: TextStyle(fontSize: 10.0, color: Colors.orange),
//                     textAlign: TextAlign.start)))
//       else if (viewModel.arry.length == 6 &&
//           viewModel.arry[4] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//             alignment: AlignmentDirectional.centerStart,
//             child: Text(data['result'],
//                 style: TextStyle(fontSize: 10.0, color: Colors.black),
//                 textAlign: TextAlign.start),
//           ),
//         )
//       else if (viewModel.arry.length == 6 &&
//           viewModel.arry[5] == data['result'])
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Align(
//             alignment: AlignmentDirectional.centerStart,
//             child: Text(data['result'],
//                 style: TextStyle(fontSize: 10.0, color: Colors.black),
//                 textAlign: TextAlign.start),
//           ),
//         ),
//     ],
//   );
// }

Widget bottomLeagueInfo(BuildContext context, LeagueInfoViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: InkWell(
        child: Container(
          height: 45 * viewModel.arry.length.toDouble(),
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
//6
                if (viewModel.arry.length == 6) {
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
                  } else if (index == 5) {
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

Widget BottomColorItem(BuildContext context, LeagueInfoViewModel viewModel,
    int index, Color color) {
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
              borderRadius: BorderRadius.all(Radius.circular(5)), color: color),
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

Container arrangementsClubIconItem(String path) {
  return Container(
    height: 27,
    width: 27,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey,
    ),
    child: Image.network(path),
  );
}
