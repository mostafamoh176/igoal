import 'package:app_igoal/Screens/ClubPlayers/clubPlayersView.dart';
import 'package:app_igoal/Screens/leagueInfo/leagueInfoViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

Widget theDifferenceItem(
    BuildContext context, LeagueInfoViewModel viewModel, int index) {
  print("viewModel.seasonCountry[index]"+viewModel.seasonCountry[index].toString());
  return
    InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
    onTap: () {
      Get.to(() => ClubPlayersView(
            teamId:
                viewModel.seasonCountry[index]['team']['data']['id'].toString(),
            countryNameId:
                viewModel.leagueData['country']['data']['id'].toString(),
          ));
    },
     child:
     // Container(child: Text(viewModel.seasonCountry[index][0]['team']['data']['name'].toString()),)
    Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).secondaryHeaderColor),
          child: Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child:
                    Image.network(viewModel.seasonCountry[index]['team']
                                ['data']['logo_path']
                            .toString() ??
                        ''),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                    viewModel.seasonCountry[index]['team']['data']['name']
                            .toString() ??
                        '',
                    style: Theme.of(context).primaryTextTheme.subtitle1),
              ],
            ),
          )),
    ) ,
  );
}


List<Widget> theDifferenceItemLoop(
    BuildContext context, LeagueInfoViewModel viewModel, int index) {
  List<Widget> lwstanding = List<Widget>();
  for( var post in viewModel.seasonCountry){
    print("post:"+post.toString());
    for( var team in post)
    lwstanding.add(  InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        Get.to(() => ClubPlayersView(
          teamId:
          team['team']['data']['id'].toString(),
          countryNameId:
          viewModel.leagueData['country']['data']['id'].toString(),
        ));
      },
      child:
      // Container(child: Text(viewModel.seasonCountry[index][0]['team']['data']['name'].toString()),)
      Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 2),
        child: Container(
            height: 33,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).secondaryHeaderColor),
            child: Directionality(
              textDirection: ui.TextDirection.rtl,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child:
                      Image.network(team['team']
                      ['data']['logo_path']
                          .toString() ??
                          ''),
                    ),
                  ),
                  // SizedBox(
                  //   width: 8,
                  // ),
                  Text(
                      team['team']['data']['name']
                          .toString() ??
                          '',
                      style: Theme.of(context).primaryTextTheme.subtitle1),
                ],
              ),
            )),
      ) ,
    ));
  }

  return  lwstanding;

}