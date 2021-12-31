import 'package:app_igoal/Screens/leagueInfo/leagueInfoViewModel.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';

Widget playerStats(BuildContext context, LeagueInfoViewModel viewModel) {
  return Column(
    children: [
      if (viewModel.topGoals != null && viewModel.topGoals.isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (ThemeService().theme.toString() == "ThemeMode.dark")
                  ? Colors.black
                  : Theme.of(context).secondaryHeaderColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  "الهدافين",
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: List.generate(
                    viewModel.topGoals.length > 3 ? 1 : 1,
                    (index) => Container(
                      width: 375,
                      height: 231,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 375,
                            height: 231,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (ThemeService().theme.toString() ==
                                      "ThemeMode.dark")
                                  ? Colors.black
                                  : Theme.of(context).secondaryHeaderColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 120,
                                  top: 193,
                                  child: Text(
                                    ' مشاهدة الجميع',
                                    style: TextStyle(
                                      color: Color(0xffd41a1a),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 270,
                                  top: 3,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: (viewModel.topGoals[0]['player']
                                                ['data']['image_path'] !=
                                            null)
                                        ? ClipRRect(
                                            child: Image.network(
                                                viewModel.topGoals[0]['player']
                                                    ['data']['image_path']),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          )
                                        : Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 11,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: (viewModel.topGoals[0]['team']
                                                ['data']['logo_path'] !=
                                            null)
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            child: Image.network(
                                                viewModel.topGoals[0]['team']
                                                    ['data']['logo_path']),
                                          )
                                        : Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 48,
                                  top: 13,
                                  child: Text(
                                    viewModel.leagueName[viewModel.topGoals[0]
                                                ['team']['data']['name']] !=
                                            null
                                        ? viewModel.leagueName[
                                            viewModel.topGoals[0]['team']
                                                ['data']['name']]
                                        : viewModel.topGoals[0]['team']['data']
                                            ['name'],
                                    // style: Theme.of(context)
                                    //     .primaryTextTheme
                                    //     .headline1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff505050),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 82,
                                  top: 42,
                                  child: Text(
                                    viewModel.leagueName[viewModel.topGoals[0]
                                                    ['player']['data']
                                                ['display_name']] !=
                                            null
                                        ? viewModel.leagueName[
                                            viewModel.topGoals[0]['player']
                                                ['data']['display_name']]
                                        : viewModel.topGoals[0]['player']
                                            ['data']['display_name'],
                                    style: TextStyle(
                                      color: (ThemeService().theme.toString() ==
                                              "ThemeMode.dark")
                                          ? Colors.white
                                          : Color(0xff505050),
                                      fontSize: 13,
                                      fontFamily: "Circular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 39,
                                  child: Text(
                                    viewModel.topGoals[0]['goals'].toString(),
                                    style: TextStyle(
                                      color: (ThemeService().theme.toString() ==
                                              "ThemeMode.dark")
                                          ? Colors.white
                                          : Color(0xff505050),
                                      fontSize: 24,
                                      fontFamily: "Circular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 101,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                viewModel.topGoals[1]['goals']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: (ThemeService()
                                                              .theme
                                                              .toString() ==
                                                          "ThemeMode.dark")
                                                      ? Colors.white
                                                      : Color(0xff505050),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topGoals[1]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topGoals[1]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topGoals[1]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topGoals[1]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topGoals[1]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topGoals[1]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topGoals[1]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topGoals[
                                                                              1]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // --- index 2
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                viewModel.topGoals[2]['goals']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: (ThemeService()
                                                              .theme
                                                              .toString() ==
                                                          "ThemeMode.dark")
                                                      ? Colors.white
                                                      : Color(0xff505050),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topGoals[2]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topGoals[2]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topGoals[2]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topGoals[2]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topGoals[2]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topGoals[2]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topGoals[2]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topGoals[
                                                                              2]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // --- index 3
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                viewModel.topGoals[3]['goals']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: (ThemeService()
                                                              .theme
                                                              .toString() ==
                                                          "ThemeMode.dark")
                                                      ? Colors.white
                                                      : Color(0xff505050),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topGoals[3]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topGoals[3]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topGoals[3]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topGoals[3]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topGoals[3]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topGoals[3]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topGoals[3]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topGoals[
                                                                              3]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 219,
                                  top: 195,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.red,
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
                    // Row(
                    //     children: [
                    //       Expanded(
                    //         flex: 1,
                    //         child: Container(
                    //           height: 80,
                    //           child: Row(
                    //             children: [
                    //               Text(
                    //                 viewModel.topGoals[index]['goals']
                    //                     .toString(),
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         flex: 2,
                    //         child: Container(
                    //           height: 100,
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 height: 50,
                    //                 width: 50,
                    //                 decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: Colors.white),
                    //                 child: (viewModel.topGoals[index]
                    //                                 ['player']['data']
                    //                             ['image_path'] !=
                    //                         null)
                    //                     ? Image.network(viewModel
                    //                             .topGoals[index]['player']
                    //                         ['data']['image_path'])
                    //                     : Container(),
                    //               ),
                    //               SizedBox(
                    //                 height: 8,
                    //               ),
                    //               Text(
                    //                 viewModel.leagueName[
                    //                             viewModel.topGoals[index]
                    //                                     ['player']['data']
                    //                                 ['display_name']] !=
                    //                         null
                    //                     ? viewModel.leagueName[viewModel
                    //                             .topGoals[index]['player']
                    //                         ['data']['display_name']]
                    //                     : viewModel.topGoals[index]
                    //                             ['player']['data']
                    //                         ['display_name'],
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //           height: 80,
                    //           width: 110,
                    //           child: Row(
                    //             children: [
                    //               Expanded(
                    //                   child: Text(
                    //                 viewModel.leagueName[viewModel
                    //                                 .topGoals[index]['team']
                    //                             ['data']['name']] !=
                    //                         null
                    //                     ? viewModel.leagueName[
                    //                         viewModel.topGoals[index]
                    //                             ['team']['data']['name']]
                    //                     : viewModel.topGoals[index]['team']
                    //                         ['data']['name'],
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),),
                    //               SizedBox(
                    //                 width: 8,
                    //               ),
                    //               Container(
                    //                 height: 25,
                    //                 width: 25,
                    //                 decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: Colors.white),
                    //                 child: (viewModel.topGoals[index]
                    //                                 ['team']['data']
                    //                             ['logo_path'] !=
                    //                         null)
                    //                     ? Image.network(viewModel
                    //                             .topGoals[index]['team']
                    //                         ['data']['logo_path'])
                    //                     : Container(),
                    //               ),
                    //             ],
                    //           )),
                    //     ],
                    //   );
                  ),
                ),
                // SizedBox(
                //   height: 8,
                // ),
                // Text(
                //   ' مشاهدة الجميع',
                //   style: TextStyle(fontSize: 13, color: Colors.red),
                // ),
                // SizedBox(
                //   height: 8,
                // ),
              ],
            ),
          ),
        )
      else
        Container(),
      (viewModel.topAssists != null && viewModel.topAssists.length > 0)
          ? 
            Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (ThemeService().theme.toString() == "ThemeMode.dark")
                  ? Colors.black
                  : Theme.of(context).secondaryHeaderColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                   "صناعة اهداف",
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: List.generate(
                    viewModel.topAssists.length > 3 ? 1 : 1,
                    (index) => Container(
                      width: 375,
                      height: 231,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 375,
                            height: 231,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (ThemeService().theme.toString() ==
                                      "ThemeMode.dark")
                                  ? Colors.black
                                  : Theme.of(context).secondaryHeaderColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 120,
                                  top: 193,
                                  child: Text(
                                    ' مشاهدة الجميع',
                                    style: TextStyle(
                                      color: Color(0xffd41a1a),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 270,
                                  top: 3,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: (viewModel.topAssists[0]['player']
                                                ['data']['image_path'] !=
                                            null)
                                        ? ClipRRect(
                                            child: Image.network(
                                                viewModel.topAssists[0]['player']
                                                    ['data']['image_path']),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          )
                                        : Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 11,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: (viewModel.topAssists[0]['team']
                                                ['data']['logo_path'] !=
                                            null)
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            child: Image.network(
                                                viewModel.topAssists[0]['team']
                                                    ['data']['logo_path']),
                                          )
                                        : Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 48,
                                  top: 13,
                                  child: Text(
                                    viewModel.leagueName[viewModel.topAssists[0]
                                                ['team']['data']['name']] !=
                                            null
                                        ? viewModel.leagueName[
                                            viewModel.topAssists[0]['team']
                                                ['data']['name']]
                                        : viewModel.topAssists[0]['team']['data']
                                            ['name'],
                                    // style: Theme.of(context)
                                    //     .primaryTextTheme
                                    //     .headline1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff505050),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 82,
                                  top: 42,
                                  child: Text(
                                    viewModel.leagueName[viewModel.topAssists[0]
                                                    ['player']['data']
                                                ['display_name']] !=
                                            null
                                        ? viewModel.leagueName[
                                            viewModel.topAssists[0]['player']
                                                ['data']['display_name']]
                                        : viewModel.topAssists[0]['player']
                                            ['data']['display_name'],
                                    style: TextStyle(
                                      color: (ThemeService().theme.toString() ==
                                              "ThemeMode.dark")
                                          ? Colors.white
                                          : Color(0xff505050),
                                      fontSize: 13,
                                      fontFamily: "Circular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 39,
                                  child: Text(
                                    viewModel.topAssists[0]['assists'].toString(),
                                    style: TextStyle(
                                      color: (ThemeService().theme.toString() ==
                                              "ThemeMode.dark")
                                          ? Colors.white
                                          : Color(0xff505050),
                                      fontSize: 24,
                                      fontFamily: "Circular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 101,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                viewModel.topAssists[1]['assists']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: (ThemeService()
                                                              .theme
                                                              .toString() ==
                                                          "ThemeMode.dark")
                                                      ? Colors.white
                                                      : Color(0xff505050),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topAssists[1]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topAssists[1]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topAssists[1]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topAssists[1]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topAssists[1]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topAssists[1]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topAssists[1]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topAssists[
                                                                              1]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // --- index 2
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                viewModel.topAssists[2]['assists']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: (ThemeService()
                                                              .theme
                                                              .toString() ==
                                                          "ThemeMode.dark")
                                                      ? Colors.white
                                                      : Color(0xff505050),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topAssists[2]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topAssists[2]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topAssists[2]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topAssists[2]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topAssists[2]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topAssists[2]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topAssists[2]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topAssists[
                                                                              2]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // --- index 3
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                viewModel.topAssists[3]['assists']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: (ThemeService()
                                                              .theme
                                                              .toString() ==
                                                          "ThemeMode.dark")
                                                      ? Colors.white
                                                      : Color(0xff505050),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topAssists[3]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topAssists[3]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topAssists[3]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topAssists[3]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topAssists[3]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topAssists[3]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topAssists[3]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topAssists[
                                                                              3]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 219,
                                  top: 195,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.red,
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
                    // Row(
                    //     children: [
                    //       Expanded(
                    //         flex: 1,
                    //         child: Container(
                    //           height: 80,
                    //           child: Row(
                    //             children: [
                    //               Text(
                    //                 viewModel.topAssists[index]['goals']
                    //                     .toString(),
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         flex: 2,
                    //         child: Container(
                    //           height: 100,
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 height: 50,
                    //                 width: 50,
                    //                 decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: Colors.white),
                    //                 child: (viewModel.topAssists[index]
                    //                                 ['player']['data']
                    //                             ['image_path'] !=
                    //                         null)
                    //                     ? Image.network(viewModel
                    //                             .topAssists[index]['player']
                    //                         ['data']['image_path'])
                    //                     : Container(),
                    //               ),
                    //               SizedBox(
                    //                 height: 8,
                    //               ),
                    //               Text(
                    //                 viewModel.leagueName[
                    //                             viewModel.topAssists[index]
                    //                                     ['player']['data']
                    //                                 ['display_name']] !=
                    //                         null
                    //                     ? viewModel.leagueName[viewModel
                    //                             .topAssists[index]['player']
                    //                         ['data']['display_name']]
                    //                     : viewModel.topAssists[index]
                    //                             ['player']['data']
                    //                         ['display_name'],
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //           height: 80,
                    //           width: 110,
                    //           child: Row(
                    //             children: [
                    //               Expanded(
                    //                   child: Text(
                    //                 viewModel.leagueName[viewModel
                    //                                 .topAssists[index]['team']
                    //                             ['data']['name']] !=
                    //                         null
                    //                     ? viewModel.leagueName[
                    //                         viewModel.topAssists[index]
                    //                             ['team']['data']['name']]
                    //                     : viewModel.topAssists[index]['team']
                    //                         ['data']['name'],
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),),
                    //               SizedBox(
                    //                 width: 8,
                    //               ),
                    //               Container(
                    //                 height: 25,
                    //                 width: 25,
                    //                 decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: Colors.white),
                    //                 child: (viewModel.topAssists[index]
                    //                                 ['team']['data']
                    //                             ['logo_path'] !=
                    //                         null)
                    //                     ? Image.network(viewModel
                    //                             .topAssists[index]['team']
                    //                         ['data']['logo_path'])
                    //                     : Container(),
                    //               ),
                    //             ],
                    //           )),
                    //     ],
                    //   );
                  ),
                ),
                // SizedBox(
                //   height: 8,
                // ),
                // Text(
                //   ' مشاهدة الجميع',
                //   style: TextStyle(fontSize: 13, color: Colors.red),
                // ),
                // SizedBox(
                //   height: 8,
                // ),
              ],
            ),
          ),
        )
          : Container(),

      (viewModel.topCardScorer != null)
          ? 
            Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (ThemeService().theme.toString() == "ThemeMode.dark")
                  ? Colors.black
                  : Theme.of(context).secondaryHeaderColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                   "الكروت",
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: List.generate(
                    viewModel.topCardScorer.length > 3 ? 1 : 1,
                    (index) => Container(
                      width: 375,
                      height: 231,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 375,
                            height: 231,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (ThemeService().theme.toString() ==
                                      "ThemeMode.dark")
                                  ? Colors.black
                                  : Theme.of(context).secondaryHeaderColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 120,
                                  top: 193,
                                  child: Text(
                                    ' مشاهدة الجميع',
                                    style: TextStyle(
                                      color: Color(0xffd41a1a),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 270,
                                  top: 3,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: (viewModel.topCardScorer[0]['player']
                                                ['data']['image_path'] !=
                                            null)
                                        ? ClipRRect(
                                            child: Image.network(
                                                viewModel.topCardScorer[0]['player']
                                                    ['data']['image_path']),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          )
                                        : Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 11,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: (viewModel.topCardScorer[0]['team']
                                                ['data']['logo_path'] !=
                                            null)
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            child: Image.network(
                                                viewModel.topCardScorer[0]['team']
                                                    ['data']['logo_path']),
                                          )
                                        : Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 48,
                                  top: 13,
                                  child: Text(
                                    viewModel.leagueName[viewModel.topCardScorer[0]
                                                ['team']['data']['name']] !=
                                            null
                                        ? viewModel.leagueName[
                                            viewModel.topCardScorer[0]['team']
                                                ['data']['name']]
                                        : viewModel.topCardScorer[0]['team']['data']
                                            ['name'],
                                    // style: Theme.of(context)
                                    //     .primaryTextTheme
                                    //     .headline1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff505050),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 82,
                                  top: 42,
                                  child: Text(
                                    viewModel.leagueName[viewModel.topCardScorer[0]
                                                    ['player']['data']
                                                ['display_name']] !=
                                            null
                                        ? viewModel.leagueName[
                                            viewModel.topCardScorer[0]['player']
                                                ['data']['display_name']]
                                        : viewModel.topCardScorer[0]['player']
                                            ['data']['display_name'],
                                    style: TextStyle(
                                      color: (ThemeService().theme.toString() ==
                                              "ThemeMode.dark")
                                          ? Colors.white
                                          : Color(0xff505050),
                                      fontSize: 13,
                                      fontFamily: "Circular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 39,
                                  child: Row(
                                    mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                              viewModel.topCardScorer[0]
                                                      ['yellowcards']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.yellow),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(width: 5,),
                                            Text(
                                              viewModel.topCardScorer[0]
                                                      ['redcards']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.red),
                                              textAlign: TextAlign.center,
                                            ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 101,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child:  Row(
                                    mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                              viewModel.topCardScorer[1]
                                                      ['yellowcards']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.yellow),
                                              textAlign: TextAlign.center,
                                            ),
                                             SizedBox(width: 5,),
                                            Text(
                                              viewModel.topCardScorer[1]
                                                      ['redcards']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.red),
                                              textAlign: TextAlign.center,
                                            ),
                                    ],
                                  ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topCardScorer[1]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topCardScorer[1]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topCardScorer[1]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topCardScorer[1]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topCardScorer[1]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topCardScorer[1]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topCardScorer[1]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topCardScorer[
                                                                              1]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // --- index 2
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                    mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                              viewModel.topCardScorer[2]
                                                      ['yellowcards']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.yellow),
                                              textAlign: TextAlign.center,
                                            ),
                                             SizedBox(width: 5,),
                                            Text(
                                              viewModel.topCardScorer[2]
                                                      ['redcards']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.red),
                                              textAlign: TextAlign.center,
                                            ),
                                    ],
                                  ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topCardScorer[2]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topCardScorer[2]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topCardScorer[2]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topCardScorer[2]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topCardScorer[2]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topCardScorer[2]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topCardScorer[2]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topCardScorer[
                                                                              2]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // --- index 3
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                    mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                              viewModel.topCardScorer[3]
                                                      ['yellowcards']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.yellow),
                                              textAlign: TextAlign.center,
                                            ),
                                             SizedBox(width: 5,),
                                            Text(
                                              viewModel.topCardScorer[3]
                                                      ['redcards']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.red),
                                              textAlign: TextAlign.center,
                                            ),
                                    ],
                                  ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  viewModel.leagueName[viewModel.topCardScorer[3]
                                                                  ['player']['data'][
                                                              'display_name']] !=
                                                          null
                                                      ? viewModel.leagueName[
                                                          viewModel.topCardScorer[3]
                                                                      ['player']
                                                                  ['data']
                                                              ['display_name']]
                                                      : viewModel.topCardScorer[3]
                                                              ['player']['data']
                                                          ['display_name'],
                                                  // viewModel.leagueName[viewModel
                                                  //                     .topCardScorer[3]
                                                  //                 ['team']['data']
                                                  //             ['name']] !=
                                                  //         null
                                                  //     ? viewModel.leagueName[
                                                  //         viewModel.topCardScorer[3]
                                                  //                 ['team']['data']
                                                  //             ['name']]
                                                  //     : viewModel.topCardScorer[3]
                                                  //         ['team']['data']['name'],
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: (ThemeService()
                                                                .theme
                                                                .toString() ==
                                                            "ThemeMode.dark")
                                                        ? Colors.white
                                                        : Color(0xff505050),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: (viewModel.topCardScorer[3]
                                                                      ['team']
                                                                  ['data']
                                                              ['logo_path'] !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          child: Image.network(
                                                              viewModel.topCardScorer[
                                                                              3]
                                                                          [
                                                                          'team']
                                                                      ['data'][
                                                                  'logo_path']),
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 219,
                                  top: 195,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.red,
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
                    // Row(
                    //     children: [
                    //       Expanded(
                    //         flex: 1,
                    //         child: Container(
                    //           height: 80,
                    //           child: Row(
                    //             children: [
                    //               Text(
                    //                 viewModel.topCardScorer[index]['goals']
                    //                     .toString(),
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         flex: 2,
                    //         child: Container(
                    //           height: 100,
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 height: 50,
                    //                 width: 50,
                    //                 decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: Colors.white),
                    //                 child: (viewModel.topCardScorer[index]
                    //                                 ['player']['data']
                    //                             ['image_path'] !=
                    //                         null)
                    //                     ? Image.network(viewModel
                    //                             .topCardScorer[index]['player']
                    //                         ['data']['image_path'])
                    //                     : Container(),
                    //               ),
                    //               SizedBox(
                    //                 height: 8,
                    //               ),
                    //               Text(
                    //                 viewModel.leagueName[
                    //                             viewModel.topCardScorer[index]
                    //                                     ['player']['data']
                    //                                 ['display_name']] !=
                    //                         null
                    //                     ? viewModel.leagueName[viewModel
                    //                             .topCardScorer[index]['player']
                    //                         ['data']['display_name']]
                    //                     : viewModel.topCardScorer[index]
                    //                             ['player']['data']
                    //                         ['display_name'],
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //           height: 80,
                    //           width: 110,
                    //           child: Row(
                    //             children: [
                    //               Expanded(
                    //                   child: Text(
                    //                 viewModel.leagueName[viewModel
                    //                                 .topCardScorer[index]['team']
                    //                             ['data']['name']] !=
                    //                         null
                    //                     ? viewModel.leagueName[
                    //                         viewModel.topCardScorer[index]
                    //                             ['team']['data']['name']]
                    //                     : viewModel.topCardScorer[index]['team']
                    //                         ['data']['name'],
                    //                 style: Theme.of(context)
                    //                     .primaryTextTheme
                    //                     .headline1,
                    //                 textAlign: TextAlign.center,
                    //               ),),
                    //               SizedBox(
                    //                 width: 8,
                    //               ),
                    //               Container(
                    //                 height: 25,
                    //                 width: 25,
                    //                 decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: Colors.white),
                    //                 child: (viewModel.topCardScorer[index]
                    //                                 ['team']['data']
                    //                             ['logo_path'] !=
                    //                         null)
                    //                     ? Image.network(viewModel
                    //                             .topCardScorer[index]['team']
                    //                         ['data']['logo_path'])
                    //                     : Container(),
                    //               ),
                    //             ],
                    //           )),
                    //     ],
                    //   );
                  ),
                ),
                // SizedBox(
                //   height: 8,
                // ),
                // Text(
                //   ' مشاهدة الجميع',
                //   style: TextStyle(fontSize: 13, color: Colors.red),
                // ),
                // SizedBox(
                //   height: 8,
                // ),
              ],
            ),
          ),
        )
          : Container(),

      ////////Ball Posession///////////////////////

      // (viewModel.teamsSeason != null)
      //     ? Padding(
      //   padding: const EdgeInsets.only(
      //       top: 8, bottom: 8),
      //   child: Container(
      //     height: (250 + (60 * 3)).toDouble(),
      //     width: MediaQuery
      //         .of(context)
      //         .size
      //         .width,
      //     padding: EdgeInsets.only(
      //         left: 12, right: 12),
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius
      //             .circular(20),
      //         color: Theme
      //             .of(context)
      //             .secondaryHeaderColor
      //     ),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(height: 16,),
      //         Text("نسبة استحواذ الكرة",
      //           style: Theme
      //               .of(context)
      //               .primaryTextTheme
      //               .headline6,),
      //         SizedBox(height: 8),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: List.generate(
      //                 viewModel.teamsSeason
      //                     .length >= 3
      //                     ? 3
      //                     : viewModel
      //                     .teamsSeason
      //                     .length, (index) =>
      //                 Padding(
      //                   padding: const EdgeInsets
      //                       .symmetric(
      //                       vertical: 8.0),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment
      //                         .center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Text(viewModel
      //                           .teamsSeason[index]['stats'] !=
      //                           null &&
      //                           viewModel
      //                               .teamsSeason[index]['stats']['data']
      //                               .isNotEmpty
      //                           ? viewModel
      //                           .teamsSeason[index]['stats']['data'][0]['avg_ball_possession_percentage']
      //                           : '-',
      //                           style: Theme
      //                               .of(
      //                               context)
      //                               .primaryTextTheme
      //                               .headline1),
      //                       Spacer(),
      //                       Center(
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Container(
      //                               height: 50,
      //                               width: 50,
      //                               decoration: BoxDecoration(
      //                                   shape: BoxShape
      //                                       .circle,
      //                                   color: Colors
      //                                       .grey
      //                               ),
      //                               child: (viewModel
      //                                   .teamsSeason[index]['logo_path'] !=
      //                                   null)
      //                                   ? Image
      //                                   .network(
      //                                   viewModel
      //                                       .teamsSeason[index]['logo_path'])
      //                                   : Container(),
      //                             ),
      //                             SizedBox(
      //                               height: 8,),
      //                                 () {
      //                               print(
      //                                   "Team Season: ${viewModel
      //                                       .teamsSeason}");
      //                               // print("League Name: ${viewModel.leagueName[viewModel.teamsSeason[0]['name']]}");
      //                               return (viewModel
      //                                   .teamsSeason !=
      //                                   null &&
      //                                   viewModel
      //                                       .teamsSeason
      //                                       .length >
      //                                       0)
      //                                   ? Text(
      //                                 viewModel
      //                                     .leagueName[viewModel
      //                                     .teamsSeason[index]['name']] !=
      //                                     null
      //                                     ? viewModel
      //                                     .leagueName[viewModel
      //                                     .teamsSeason[index]['name']]
      //                                     : viewModel
      //                                     .teamsSeason[index]['name'],
      //                                 style: Theme
      //                                     .of(
      //                                     context)
      //                                     .primaryTextTheme
      //                                     .headline1,)
      //                                   : Text(
      //                                   "");
      //                             }()
      //
      //                           ],
      //                         ),
      //                       ),
      //                       Spacer(),
      //                     ],
      //                   ),
      //                 ),
      //             ),),
      //         Text(' مشاهدة الجميع',
      //           style: TextStyle(fontSize: 13,
      //               color: Colors.red),),
      //
      //       ],
      //
      //     ),
      //   ),
      // )
      //     : Container(),
      ///////Bottom   List////////
      (viewModel.namearr != null)
          ? Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                 color:  (ThemeService().theme.toString() ==
                                      "ThemeMode.dark")
                                  ? Colors.black
                                  : Theme.of(context).secondaryHeaderColor,),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                  
                      viewModel.namearr.length,
                      (index) =>
                          scoresSecondListItem(context, viewModel, index))),
            )
          : Container(),
    ],
  );
}

Widget scoresSecondListItem(
    BuildContext context, LeagueInfoViewModel viewModel, int index) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Container(
      height: 50,
        //  color:  Theme.of(context).bottomAppBarColor,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 8, right: 8),
        // decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             color: Color(0xff1a1a1a),
        //         ),
      child: Row(
        children: [
          Text(
            viewModel.stats != null
                ? (viewModel.stats[viewModel.atrrarr[index]].toString() !=
                            null &&
                        viewModel.atrrarr[index].length > 0
                    ? (viewModel.stats[viewModel.atrrarr[index]].toString() ==
                            "null"
                        ? "0"
                        : viewModel.stats[viewModel.atrrarr[index]].toString())
                    : "")
                : "",
            style: Theme.of(context).primaryTextTheme.headline1,
            textAlign: TextAlign.start,
          ),
          Spacer(),
          Text(
            viewModel.namearr[index] != null ? viewModel.namearr[index] : "",
            style: Theme.of(context).primaryTextTheme.headline1,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}
