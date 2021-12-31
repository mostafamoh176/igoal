import 'package:app_igoal/Screens/leagueInfo/leagueInfoViewModel.dart';
import 'package:app_igoal/Widgets/NetworkImage/NetworkImage.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

Widget stadiumWidget(
    BuildContext context, LeagueInfoViewModel viewModel, int index) {
  return Padding(
    padding: const EdgeInsets.only(top: 0, bottom: 0),
    child: Container(
      color:(ThemeService().theme.toString() == "ThemeMode.dark")
          ? Colors.black
          : Colors.white, // Theme.of(context).secondaryHeaderColor,
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: appNetworkImage(viewModel.venue[index]['image_path'], BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Column(
              children: [
                Text(
                  "التفاصيل",
                  style: Theme.of(context).primaryTextTheme.headline1,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "الاسم",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Text(
                      (viewModel.venue[index]['name'] != null)
                          ? viewModel.leagueName[viewModel.venue[index]
                                      ['name']] !=
                                  null
                              ? viewModel
                                  .leagueName[viewModel.venue[index]['name']]
                              : viewModel.venue[index]['name']
                          : "No Name",
                      style: Theme.of(context).primaryTextTheme.headline1,
                    )),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "العنوان",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Text(
                      (viewModel.venue[index]['address'] != null)
                          ? viewModel.leagueName[viewModel.venue[index]
                                      ['address']] !=
                                  null
                              ? viewModel
                                  .leagueName[viewModel.venue[index]['address']]
                              : viewModel.venue[index]['address']
                          : "No address",
                      style: Theme.of(context).primaryTextTheme.headline1,
                    )),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "المدينة",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      (viewModel.venue[index]['city'] != null)
                          ? viewModel.leagueName[viewModel.venue[index]
                                      ['city']] !=
                                  null
                              ? viewModel
                                  .leagueName[viewModel.venue[index]['city']]
                              : viewModel.venue[index]['city']
                          : "No city",
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "المساحة",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      (viewModel.venue[index]['capacity'] != null)
                          ? viewModel.venue[index]['capacity'].toString()
                          : "No capacity",
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  splashColor:Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor:Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    viewModel.launchURL(
                        "https://www.google.com/maps/search/?api=1&query=" +
                            viewModel.venue[index]['coordinates']);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "الموقع",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Spacer(),
                      Expanded(
                          child: Text(
                        "اضغط هنا ",
                        style: Theme.of(context).primaryTextTheme.headline1,
                      )),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
