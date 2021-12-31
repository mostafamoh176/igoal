import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/LeagueVenue/LeagueVenue.dart';
import 'package:app_igoal/Widgets/ShowError.dart';
import 'package:flutter/material.dart';

import 'leagueInfoViewModel.dart';

class LeagueVenue extends StatefulWidget {
  final LeagueInfoViewModel leagueInfoViewModel;

  const LeagueVenue({this.leagueInfoViewModel});

  @override
  _LeagueVenueState createState() => _LeagueVenueState();
}

class _LeagueVenueState extends State<LeagueVenue>
    with AutomaticKeepAliveClientMixin {
  Future _service;
  LeagueInfoViewModel _leagueInfo;

  @override
  void initState() {
    _leagueInfo = widget.leagueInfoViewModel;
    _service = _leagueInfo.getVenue();
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
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: _leagueInfo.venue.length,
                  itemBuilder: (context, index) {
                    return stadiumWidget(context, _leagueInfo, index);
                  });
            }
            return Container();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
