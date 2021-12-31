import 'package:app_igoal/Models/Knockout_Response.dart';
import 'package:app_igoal/Widgets/NetworkImage/NetworkImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../const.dart';

class Knockout extends StatelessWidget {
  final KnockoutResponse knockoutResponse;

  const Knockout({Key key, @required this.knockoutResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Quarter Finals
              Expanded(
                  flex: 2,
                  child: QuarterFinals(
                      responseData: knockoutResponse.responseData)),
              Expanded(
                child: Row(
                  children: [
                    TeamDivider(),
                    TeamDivider(),
                  ],
                ),
              ),

              ///Semi Finals
              Expanded(
                  flex: 2,
                  child:
                      SemiFinals(responseData: knockoutResponse.responseData)),
              Expanded(
                  child: Column(
                children: [
                  TeamDivider(),
                ],
              )),

              ///Finals
              Expanded(
                  flex: 2,
                  child: Finals(responseData: knockoutResponse.responseData)),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      width: 2,
                      color: grey,
                    ),
                    Spacer(),
                  ],
                ),
              )),

              ///Results
              Expanded(
                  flex: 2,
                  child: Results(responseData: knockoutResponse.responseData)),
              Spacer(
                flex: 2,
              ),
            ],
          ),

          ///Don't alter
          Column(
            children: [
              Spacer(
                flex: 3,
              ),
              Center(
                  child: Text(
                'Quarter Finals',
                style: Theme.of(context).textTheme.subtitle1,
              )),
              Spacer(
                flex: 3,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  ' Semi  Finals',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              )),
              Spacer(
                flex: 3,
              ),
              Align(
                  alignment: Alignment(0.2, 4.0),
                  child: Text(
                    'Finals',
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
              Spacer(
                flex: 5,
              )
            ],
          )
        ],
      ),
    );
  }
}

class Results extends StatelessWidget {
  final List<ResponseData> responseData;

  const Results({Key key, @required this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ResponseData> finalFixtures =
        responseData.where((element) => element.name == 'Final').toList();
    List<Fixtures> finalFix = finalFixtures.first.fixtures.fixturesData;
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: grey,
              ),
            ),
            child: Row(
              children: [
                iGoalLogo(),
                Expanded(
                    child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(

                            child: SvgPicture.asset('assets/images/Cup.svg'))),
                    Expanded(
                      child: Text(
                        DateFormat.jm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                finalFix.first.time.startingAt.timestamp *
                                    1000)),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      DateFormat('dd MMM').format(
                          DateTime.parse(finalFix.first.time.startingAt.date)),
                      style: Theme.of(context).textTheme.bodyText1,
                    ))
                  ],
                )),
                iGoalLogo(),
              ],
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class Finals extends StatelessWidget {
  final List<ResponseData> responseData;

  const Finals({Key key, @required this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ResponseData> finalFixtures =
        responseData.where((element) => element.name == 'Final').toList();
    List<Fixtures> finalFix = finalFixtures.first.fixtures.fixturesData;
    return Row(
      children: [
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 2,
          child: Match(
            nameTeamOne: finalFix.first.localTeam.localTeamData.shortCode,
            nameTeamTwo: finalFix.first.visitorTeam.visitorTeamData.shortCode,
            isTeamOneWinner: finalFix.first.scores.localteamScore >
                    finalFix.first.scores.visitorteamScore
                ? true
                : false,
            isTeamTwoWinner: finalFix.first.scores.visitorteamScore >
                    finalFix.first.scores.localteamScore
                ? true
                : false,
            imageTeamOne: finalFix.first.localTeam.localTeamData.logoPath,
            imageTeamTwo: finalFix.first.visitorTeam.visitorTeamData.logoPath,
            teamOneScore: finalFix.first.scores.localteamScore,
            teamTwoScore: finalFix.first.scores.visitorteamScore,
          ),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}

class SemiFinals extends StatelessWidget {
  final List<ResponseData> responseData;

  const SemiFinals({Key key, @required this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ResponseData> semifinalFix =
        responseData.where((element) => element.name == 'Semi-finals').toList();
    List<Fixtures> semiFinalFixtures = semifinalFix.first.fixtures.fixturesData;
    return Row(
      children: [
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 6,
          child: Match(
            nameTeamOne:
                semiFinalFixtures.first.localTeam.localTeamData.shortCode,
            nameTeamTwo:
                semiFinalFixtures.first.visitorTeam.visitorTeamData.shortCode,
            isTeamOneWinner: semiFinalFixtures.first.scores.localteamScore >
                    semiFinalFixtures.first.scores.visitorteamScore
                ? true
                : false,
            isTeamTwoWinner: semiFinalFixtures.first.scores.visitorteamScore >
                    semiFinalFixtures.first.scores.localteamScore
                ? true
                : false,
            imageTeamOne:
                semiFinalFixtures.first.localTeam.localTeamData.logoPath,
            imageTeamTwo:
                semiFinalFixtures.first.visitorTeam.visitorTeamData.logoPath,
            teamOneScore: semiFinalFixtures.first.scores.localteamScore,
            teamTwoScore: semiFinalFixtures.first.scores.visitorteamScore,
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 6,
          child: Match(
            nameTeamOne: semiFinalFixtures[2].localTeam.localTeamData.shortCode,
            nameTeamTwo:
                semiFinalFixtures[2].visitorTeam.visitorTeamData.shortCode,
            isTeamOneWinner: semiFinalFixtures[2].scores.localteamScore >
                    semiFinalFixtures[2].scores.visitorteamScore
                ? true
                : false,
            isTeamTwoWinner: semiFinalFixtures[2].scores.visitorteamScore >
                    semiFinalFixtures[2].scores.localteamScore
                ? true
                : false,
            imageTeamOne: semiFinalFixtures[2].localTeam.localTeamData.logoPath,
            imageTeamTwo:
                semiFinalFixtures[2].visitorTeam.visitorTeamData.logoPath,
            teamOneScore: semiFinalFixtures[2].scores.localteamScore,
            teamTwoScore: semiFinalFixtures[2].scores.visitorteamScore,
          ),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}

class QuarterFinals extends StatelessWidget {
  final List<ResponseData> responseData;

  const QuarterFinals({Key key, @required this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ResponseData> quarterFinals = responseData
        .where((element) => element.name == 'Quarter-finals')
        .toList();
    List<Fixtures> quarterFinalFix = quarterFinals.first.fixtures.fixturesData;
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 10,
          child: Match(
            nameTeamOne:
                quarterFinalFix.first.localTeam.localTeamData.shortCode,
            nameTeamTwo:
                quarterFinalFix.first.visitorTeam.visitorTeamData.shortCode,
            isTeamOneWinner: quarterFinalFix.first.scores.localteamScore >
                    quarterFinalFix.first.scores.visitorteamScore
                ? true
                : false,
            isTeamTwoWinner: quarterFinalFix.first.scores.visitorteamScore >
                    quarterFinalFix.first.scores.localteamScore
                ? true
                : false,
            imageTeamOne:
                quarterFinalFix.first.localTeam.localTeamData.logoPath,
            imageTeamTwo:
                quarterFinalFix.first.visitorTeam.visitorTeamData.logoPath,
            teamOneScore: quarterFinalFix.first.scores.localteamScore,
            teamTwoScore: quarterFinalFix.first.scores.visitorteamScore,
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 10,
          child: Match(
            nameTeamOne: quarterFinalFix[4].localTeam.localTeamData.shortCode,
            nameTeamTwo:
                quarterFinalFix[4].visitorTeam.visitorTeamData.shortCode,
            isTeamOneWinner: quarterFinalFix[4].scores.localteamScore >
                    quarterFinalFix[4].scores.visitorteamScore
                ? true
                : false,
            isTeamTwoWinner: quarterFinalFix[4].scores.visitorteamScore >
                    quarterFinalFix[4].scores.localteamScore
                ? true
                : false,
            imageTeamOne: quarterFinalFix[4].localTeam.localTeamData.logoPath,
            imageTeamTwo:
                quarterFinalFix[4].visitorTeam.visitorTeamData.logoPath,
            teamOneScore: quarterFinalFix[4].scores.localteamScore,
            teamTwoScore: quarterFinalFix[4].scores.visitorteamScore,
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 10,
          child: Match(
            nameTeamOne: quarterFinalFix[2].localTeam.localTeamData.shortCode,
            nameTeamTwo:
                quarterFinalFix[2].visitorTeam.visitorTeamData.shortCode,
            isTeamOneWinner: quarterFinalFix[2].scores.localteamScore >
                    quarterFinalFix[2].scores.visitorteamScore
                ? true
                : false,
            isTeamTwoWinner: quarterFinalFix[2].scores.visitorteamScore >
                    quarterFinalFix[2].scores.localteamScore
                ? true
                : false,
            imageTeamOne: quarterFinalFix[2].localTeam.localTeamData.logoPath,
            imageTeamTwo:
                quarterFinalFix[2].visitorTeam.visitorTeamData.logoPath,
            teamOneScore: quarterFinalFix[2].scores.localteamScore,
            teamTwoScore: quarterFinalFix[2].scores.visitorteamScore,
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 10,
          child: Match(
            nameTeamOne: quarterFinalFix[6].localTeam.localTeamData.shortCode,
            nameTeamTwo:
                quarterFinalFix[6].visitorTeam.visitorTeamData.shortCode,
            isTeamOneWinner: quarterFinalFix[6].scores.localteamScore >
                    quarterFinalFix[6].scores.visitorteamScore
                ? true
                : false,
            isTeamTwoWinner: quarterFinalFix[6].scores.visitorteamScore >
                    quarterFinalFix[6].scores.localteamScore
                ? true
                : false,
            imageTeamOne: quarterFinalFix[6].localTeam.localTeamData.logoPath,
            imageTeamTwo:
                quarterFinalFix[6].visitorTeam.visitorTeamData.logoPath,
            teamOneScore: quarterFinalFix[6].scores.localteamScore,
            teamTwoScore: quarterFinalFix[6].scores.visitorteamScore,
          ),
        ),
        Spacer(),
      ],
    );
  }
}

// ignore: must_be_immutable
class Match extends StatelessWidget {
  final int teamOneScore, teamTwoScore;
  bool isTeamOneWinner, isTeamTwoWinner;
  final String matchTime, title;
  final String nameTeamOne, imageTeamOne;
  final String nameTeamTwo, imageTeamTwo;

  Match(
      {this.teamOneScore,
      this.teamTwoScore,
      this.title = 'Agg',
      this.isTeamOneWinner,
      this.isTeamTwoWinner,
      this.imageTeamOne,
      this.imageTeamTwo,
      this.nameTeamOne,
      this.nameTeamTwo,
      this.matchTime});

  bool isMatchComing = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(fontSize: 14, color: grey);
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: size,
            // width: size,
            decoration:
                BoxDecoration(border: Border.all(color: grey, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Team(
                          isOneWinner: isTeamOneWinner,
                          image: imageTeamOne,
                          name: nameTeamOne,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: SizedBox(),
                        ),
                        Expanded(
                            child: Team(
                          name: nameTeamTwo,
                          image: imageTeamTwo,
                          isOneWinner: isTeamTwoWinner,
                        )),
                      ],
                    ),
                  ),
                  isMatchComing
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Center(
                            child: Text(
                              matchTime,
                              style: style,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                teamOneScore.toString(),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                              ),
                              Text(
                                '-',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                              ),
                              Text(
                                teamTwoScore.toString(),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                              )
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -15,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                  border: Border.all(color: grey, width: 2),
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(60), right: Radius.circular(60))),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Team extends StatelessWidget {
  final String name, image;
  final bool isOneWinner;

  const Team({this.name, this.image, this.isOneWinner});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          size: 18,
          color: isOneWinner ? blue : Colors.transparent,
        ),
        Expanded(
          child: appNetworkImage(image, BoxFit.contain),
        ),
        Center(
            child: Text(
          name,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ))
      ],
    );
  }
}

class TeamDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 12),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Spacer(),
                Container(
                  color: grey,
                  width: 2,
                ),
                Spacer(
                  flex: 2,
                ),
                Container(
                  color: grey,
                  width: 2,
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
              flex: 8,
              child: Row(
                children: [
                  Spacer(),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: grey, width: 2),
                          right: BorderSide(color: grey, width: 2)),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: grey, width: 2),
                      ),
                    ),
                  )),
                  Spacer()
                ],
              )),
        ],
      ),
    );
  }
}

Widget iGoalLogo() {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: grey,
          ),
          shape: BoxShape.circle),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/images/app_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}
