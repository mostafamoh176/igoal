import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/PlayerStats/PlayerStats.dart';
import 'package:app_igoal/Widgets/ShowError.dart';
import 'package:flutter/material.dart';

import 'leagueInfoViewModel.dart';

class PlayerStatistics extends StatefulWidget {
  final LeagueInfoViewModel leagueInfoViewModel;

  const PlayerStatistics({this.leagueInfoViewModel});

  @override
  _PlayerStatisticsState createState() => _PlayerStatisticsState();
}

class _PlayerStatisticsState extends State<PlayerStatistics>
    with AutomaticKeepAliveClientMixin {
  Future _service, _service2, _service3;
  LeagueInfoViewModel _leagueInfo;

  @override
  void initState() {
    _leagueInfo = widget.leagueInfoViewModel;
    _service = _leagueInfo.topCardScorerPlayer();
    _service2 = _leagueInfo.playerStats();
    _service3 = _leagueInfo.teamSeason();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future:Future.wait([_service]), //Future.wait([_service, _service2, _service3]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CustomLoader(),
            );
          default:
            if (snapshot.hasData) {
              return
              // Container(child: Text(snapshot.toString()),);
               SingleChildScrollView(child: playerStats(context, _leagueInfo));
            }
            return Container();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
