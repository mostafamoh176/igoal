import 'package:app_igoal/Screens/KnockoutScreen/KnockoutScreen.dart';
import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/ShowError.dart';
import 'package:flutter/material.dart';

import 'leagueInfoViewModel.dart';

class KnockoutStages extends StatefulWidget {
  final LeagueInfoViewModel leagueInfoViewModel;

  const KnockoutStages({this.leagueInfoViewModel});

  @override
  _KnockoutStagesState createState() => _KnockoutStagesState();
}

class _KnockoutStagesState extends State<KnockoutStages>
    with AutomaticKeepAliveClientMixin {
  Future _service;
  LeagueInfoViewModel _leagueInfo;

  @override
  void initState() {
    _leagueInfo = widget.leagueInfoViewModel;
    _service = _leagueInfo.getKnockoutData();
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
                      Knockout(knockoutResponse: _leagueInfo.knockoutResponse));
            }
            return Container();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
