import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:app_igoal/Widgets/LeagueNews/LeagueNews.dart';
import 'package:app_igoal/Widgets/ShowError.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:flutter/material.dart';
import 'leagueInfoViewModel.dart';

class LeagueNews extends StatefulWidget {
  final LeagueInfoViewModel leagueInfoViewModel;

  const LeagueNews({this.leagueInfoViewModel});

  @override
  _LeagueNewsState createState() => _LeagueNewsState();
}

class _LeagueNewsState extends State<LeagueNews>
    with AutomaticKeepAliveClientMixin {
  Future _service;
  LeagueInfoViewModel _leagueInfo;

  @override
  void initState() {
    _leagueInfo = widget.leagueInfoViewModel;
    _service = _leagueInfo.getNewsPost();
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
              return _leagueInfo.newsList.length == 0
                  ? Center(
                      child: Text(
                        '',
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _leagueInfo.newsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return newsItem(context, _leagueInfo, index);
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
