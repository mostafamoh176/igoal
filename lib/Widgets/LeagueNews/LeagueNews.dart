import 'package:app_igoal/Screens/Description/descriptionView.dart';
import 'package:app_igoal/Screens/leagueInfo/leagueInfoViewModel.dart';
import 'package:app_igoal/Widgets/NetworkImage/NetworkImage.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:intl/intl.dart';

// Widget newsItem(
//     BuildContext context, LeagueInfoViewModel viewModel, int index) {
//   return InkWell(
//     splashColor:Colors.transparent,
//     hoverColor: Colors.transparent,
//     focusColor: Colors.transparent,
//     highlightColor:Colors.transparent,
//     overlayColor: MaterialStateProperty.all(Colors.transparent),
//     onTap: () {
//       Get.to(()=>DescriptionView(
//         newsDetail: viewModel.newsList[index],
//       ));
//     },
//     child: Padding(
//       padding: const EdgeInsets.only(bottom: 0),
//       child: Container(
//         height: 337.0,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 8,
//             ),
//             Container(
//               height: 202,
//               width: MediaQuery.of(context).size.width,
//               child: appNetworkImage(
//                   viewModel.newsList[index]['nesimgurl'], BoxFit.contain),
//             ),
//             SizedBox(
//               height: 23,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Directionality(
//                     textDirection: ui.TextDirection.rtl,
//                     child: Row(
//                       children: [
//                         Expanded(
//                             child: Text(
//                           viewModel.newsList[index]['newstitle'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: Theme.of(context).primaryTextTheme.headline6,
//                         )),
//                       ],
//                     ),
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Text(
//                 DateFormat.yMMMd()
//                     .format(DateTime.fromMicrosecondsSinceEpoch(viewModel
//                             .newsList[index]['newsdate']
//                             .millisecondsSinceEpoch *
//                         1000))
//                     .toString(),
//                 style: TextStyle(fontSize: 16, color: Color(0xff5F5F5F)),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }

Widget newsItem(
    BuildContext context, LeagueInfoViewModel viewModel, int index) {
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
