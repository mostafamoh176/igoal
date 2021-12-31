import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/FixturesTeam/FixturesTeam.dart';
import 'package:app_igoal/Widgets/ShowError.dart';
import 'package:flutter/material.dart';

import 'leagueInfoViewModel.dart';

class FixturesTeam extends StatefulWidget {
  final LeagueInfoViewModel leagueInfoViewModel;

  const FixturesTeam({this.leagueInfoViewModel});

  @override
  _FixturesTeamState createState() => _FixturesTeamState();
}

class _FixturesTeamState extends State<FixturesTeam>
    with AutomaticKeepAliveClientMixin {
  Future _service;
  LeagueInfoViewModel _leagueInfo;

  @override
  void initState() {
    _leagueInfo = widget.leagueInfoViewModel;
    _service = _leagueInfo.getMatchesRecord();
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
              return ListView.builder(
                padding: EdgeInsets.zero,
                  itemCount: _leagueInfo.matchsScore.length,
                  itemBuilder: (context, index) {
                    return currentMatchesWidget(context, _leagueInfo, index);
                  });
            }
            return Container();
              //Container();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
