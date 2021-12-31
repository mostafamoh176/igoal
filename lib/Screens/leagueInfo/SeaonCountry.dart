import 'package:app_igoal/Widgets/CountrySeason/CountrySeason.dart';
import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/ShowError.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'leagueInfoViewModel.dart';

class SeasonCountryScreenUI extends StatefulWidget {
  final LeagueInfoViewModel leagueInfoViewModel;

  const SeasonCountryScreenUI({this.leagueInfoViewModel});

  @override
  _SeasonCountryScreenUIState createState() => _SeasonCountryScreenUIState();
}

class _SeasonCountryScreenUIState extends State<SeasonCountryScreenUI>
    with AutomaticKeepAliveClientMixin {
  Future _service;
  LeagueInfoViewModel _leagueInfo;

  @override
  void initState() {
    _leagueInfo = widget.leagueInfoViewModel;
    _service = _leagueInfo.getSeasonCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("seasonCountry:" + _leagueInfo.seasonCountry.length.toString());
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
              return (_leagueInfo.seasonCountry.length > 1)
                  ? ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: _leagueInfo.seasonCountry.length,
                      itemBuilder: (context, index) =>
                          theDifferenceItem(context, _leagueInfo, index))
                  : ListView(
                      children: [
                        ...theDifferenceItemLoop(context, _leagueInfo, 0)
                      ],
                    );
            }
            return Container();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
