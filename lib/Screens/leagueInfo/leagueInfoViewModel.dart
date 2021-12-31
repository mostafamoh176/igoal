import 'dart:convert';

import 'package:app_igoal/Models/Knockout_Response.dart';
import 'package:app_igoal/Screens/Countries/countriesViewModel.dart';
import 'package:app_igoal/Screens/Home_4/home4ViewModel.dart';
import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import "package:collection/collection.dart";

class LeagueInfoViewModel extends GetxController implements LoaderState {

  KnockoutResponse _knockoutResponse;

  KnockoutResponse get knockoutResponse => _knockoutResponse;

  int pageid = 1;

  var namearr = [
    "عدد الفرق",
    "عدد المباريات",
    "عدد الاهداف",
    "المباريات التي سجل بها الفريقين",
    "عدد الكروت الصفراء",
"عدد الصفراء ثم الحمراء",
    "عدد الكروت الحمراء",
    "متوسط الهدف في المباريات",
    "متوسط الاهداف في المبارة",
    "متوسط الكروت الصفراء في المبارة",
    "متوسط الكروت الحمراء في المبارة",
    "متوسط الكروت الصفراء ثم الحمراء في المبارة"
  ];
  var atrrarr = [
    "number_of_clubs",
    "number_of_matches",
    "number_of_goals",
    "matches_both_teams_scored",
    "number_of_yellowcards",
    "number_of_yellowredcards",
    "number_of_redcards",
    "goal_scored_every_minutes",
    "avg_goals_per_match",
    "avg_yellowcards_per_match",
    "avg_redcards_per_match",
    "avg_yellowredcards_per_match"
  ];

  String _leagueId;

  String get leagueId => _leagueId;

  dynamic _leagueData;

  dynamic get leagueData => _leagueData;

  dynamic _venue;

  dynamic get venue => _venue;

  List<dynamic> _topGoals;

  dynamic get topGoals => _topGoals;

  List<dynamic> _topAssists;

  dynamic get topAssists => _topAssists;

  List<dynamic> _topCardScorer;

  dynamic get topCardScorer => _topCardScorer;

  List<dynamic> _teamsSeason;

  List<dynamic> get teamsSeason => _teamsSeason;

  String get currentSessionId => _currentSeasonId;

  List<dynamic> _seasonCountry= new List<dynamic>();

  List<dynamic> get seasonCountry => _seasonCountry;

  List<Season> _seasonList = List<Season>();

  List<Season> get seasonList => _seasonList;

  List<Countries> _countiesList = List<Countries>();

  List<Countries> get countiesList => _countiesList;

  List<dynamic> _matchsScore = new List<dynamic>();

  List<dynamic> get matchsScore => _matchsScore;

  final databaseReference = FirebaseFirestore.instance;
  var arry = [];
  List<DocumentSnapshot> _newsList;

  List<DocumentSnapshot> get newsList => _newsList;

  dynamic _stats;

  dynamic get stats => _stats;

  String _currentSeasonId;

  dynamic _standings;

  dynamic get standings => _standings;

  dynamic _resource;

  // dynamic get resource => _resource;

  List<String> _resourceArray = List<String>();

  List<String> get resourceArray => _resourceArray;

  ScrollController _scrollController = new ScrollController();

  ScrollController get scrollController => _scrollController;

  @override
  ViewState _state;

  @override
  ViewState get viewState => _state;

  @override
  void setSate(ViewState state) {
    _state = state;
    update();
  }



  var leagueName;
  int seasonListLength = 0;
  String resource = "";

  getseasonStandings(
      String seasonId,
      ) async {
    print("here");
    print(seasonId);

    var result;
    // setSate(ViewState.Busy);
    NetworkManager.getDifferentToken(
        url:
        'https://soccer.sportmonks.com/api/v2.0/standings/season/$_currentSeasonId?api_token=${Token.fixturesToken}&include=standings.team',
        isFormData: true)
        .then((response) {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      print(decodedJSON);
      if (decodedJSON.containsKey('data')) {
        if (decodedJSON['data'].length == 1) {
          print("here");
          print(decodedJSON);

          if (decodedJSON['data'].length == 1) {
            result = decodedJSON['data'][0]['standings']['data'] as List;
            resource = decodedJSON['data'][0]['resource'].toString();

            result.forEach((val) => {
              if (val['result'] != null)
                {this.addtoarrdescription(val['result'])}
            });
            var seasonList = groupBy(result, (obj) => obj['group_name']);

            print("Season list keys length");
            print(seasonList.keys.length);
            _seasonList = new List<Season>();
            for (var seasonGroup in seasonList.keys) {
              var seasonData = Season();
              seasonData.groupName = seasonGroup;
              seasonData.data = seasonList[seasonGroup];
              _seasonList.add(seasonData);
            }
          }
        } else {
          result = decodedJSON['data'] as List;
          resource = decodedJSON['data'][0]['resource'].toString();
          _seasonList = new List<Season>();
          Season _season;
          for (var i = 0; i < result.length; i++) {
            _season = new Season();
            _season.groupName =
                result[i]['standings']['data'][0]['group_name'].toString();
            _season.data = result[i]['standings']['data'] as List;
            _seasonList.add(_season);
          }
          print("Total groups: ${_seasonList.length}");
          (decodedJSON['data']).forEach((val) => {
            val['standings']['data'].forEach((element) => {
              if (element['result'] != null)
                {this.addtoarrdescription(element['result'])}
            })
          });
        }
        seasonListLength = 0;
        for (int i = 0; i < _seasonList.length; i++) {
          for (int j = 0; j < _seasonList[i].data.length; j++) {
            seasonListLength = seasonListLength + _seasonList[j].data.length;
            print("inner arranggement");
            print(_seasonList[i].data.length);
          }
        }

        print("Season list length $seasonListLength");
        print("Season list length: ");
        print(_seasonList.length);
        //_seasonMatchList=result.map<SeasonMatchModel>((json) => SeasonMatchModel.fromJson(json)).toList();

        // //_matchSortedList
        // print(_finalYearData[0].data[0]);
        update();
      } else {
        //showToast(decodedJSON['responseException'].toString());
        setSate(ViewState.Idle);
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);

      // showToast('Something went wrong');
    });
  }
  LeagueInfoViewModel({String leagueId}) {
    _leagueId = leagueId;
    getLeagueInfo(_leagueId);
    leagueName = [];
    loadJsonData();
    update();
  }

  var countriesArabic;

  loadJsonData() async {
    leagueName =
        jsonDecode(await rootBundle.loadString('assets/files/ar.json'));
    countriesArabic =
        jsonDecode(await rootBundle.loadString('assets/files/countriesList'))
            as List;
    update();
  }

  changeDateToArabic(String date) {
    initializeDateFormatting("ar_SA", null);
    var formatter = DateFormat.yMMMd('ar_SA');
    String formatted = formatter.format(DateTime.parse(date));
    return formatted;
  }

  getLeagueInfo(String leagueId) async {
    setSate(ViewState.Busy);
    NetworkManager.getDifferentToken(
            url:
                'https://soccer.sportmonks.com/api/v2.0/leagues/$_leagueId?api_token=djQl5NtCDphBbqcBXX5VbVplKYOlEt8rqjvOZ9374YQXuVgyhD6doaFtAdtg&include=country',
            isFormData: true)
        .then((response) {
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        _leagueData = result;
        _currentSeasonId = result['current_season_id'].toString();
        getSeasonCountryData();
        setSate(ViewState.Idle);
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });
  }

  Future<dynamic> getVenue() async {
    var response = await NetworkManager.getDifferentToken(
        url:
            'https://soccer.sportmonks.com/api/v2.0/venues/season/${_leagueData['current_season_id'].toString()}?api_token=${Token.fixturesToken}',
        isFormData: true);
    Map<String, dynamic> decodedJSON = jsonDecode(response);
    if (decodedJSON.containsKey('data')) {
      var result = decodedJSON['data'];
      _venue = result;
    }
    update();
    return _venue;
  }

  Future<dynamic> topCardScorerPlayer() async {
    var response = await NetworkManager.getDifferentToken(
        url:
            'https://soccer.sportmonks.com/api/v2.0/topscorers/season/${leagueData['current_season_id'].toString()}?api_token=${Token.fixturesToken}&include=goalscorers.player,goalscorers.team,assistscorers.player,assistscorers.team,cardscorers.team,cardscorers.player',
        isFormData: true);
    Map<String, dynamic> decodedJSON = jsonDecode(response);
    if (decodedJSON.containsKey('data')) {
      try {
         var result = decodedJSON['data'];
      _topGoals = (result['goalscorers']['data'] as List);
      _topGoals.sort((a, b) => b['goals'].compareTo(a['goals']));
      // print("_topGoals"+_topGoals.toString());
      _topAssists = (result['assistscorers']['data'] as List);
      _topAssists.sort((a, b) => b['assists'].compareTo(a['assists']));
      _topCardScorer = (result['cardscorers']['data'] as List);
      _topCardScorer.sort();
       print("topCardScorer"+_topCardScorer.toString());
      // _topCardScorer.sort((a, b) => b['redcards'].compareTo(a['redcards']));
      //  print(_topCardScorer);
      } catch (e) {
         print(e);
      }
     
    }
    update();
    return _topCardScorer;
  }

  Future<dynamic> playerStats() async {
    var response = await NetworkManager.getDifferentToken(
        url:
            'https://soccer.sportmonks.com/api/v2.0/seasons/${_leagueData['current_season_id'].toString()}?api_token=${Token.fixturesToken}&include=stats,stats.mostcleansheetsteam,stats.mostgoalsteam,stats.assisttopscorer,stats.mostgoalspermatchteam,stats.mostconcededgoalsteam,stats.topscorer,stats.mostcleansheetsgoalkeeperteam,stats.mostcornersteam',
        isFormData: true);

  print('url:https://soccer.sportmonks.com/api/v2.0/seasons/${_leagueData['current_season_id'].toString()}?api_token=${Token.fixturesToken}&include=stats,stats.mostcleansheetsteam,stats.mostgoalsteam,stats.assisttopscorer,stats.mostgoalspermatchteam,stats.mostconcededgoalsteam,stats.topscorer,stats.mostcleansheetsgoalkeeperteam,stats.mostcornersteam');

    Map<String, dynamic> decodedJSON = jsonDecode(response);
    if (decodedJSON.containsKey('data')) {
        print("leagueInfoViewModel:"+response);
      var result = decodedJSON['data'];
      _stats = result['stats']['data'];
    }
    update();
    return _stats;
  }

  Future<dynamic> teamSeason() async {
    var response = await NetworkManager.getDifferentToken(
        url:
            'https://soccer.sportmonks.com/api/v2.0/teams/season/${_leagueData['current_season_id'].toString()}?api_token=${Token.fixturesToken}&include=squad.player,stats:filter(stage_id|${_leagueData['current_stage_id'].toString()})',
        isFormData: true);
    Map<String, dynamic> decodedJSON = jsonDecode(response);
    //&& decodedJSON.containsKey('avg_ball_possession_percentage')
    if (decodedJSON.containsKey('data')  ) {
      try {
         var result = decodedJSON['data'];

      _teamsSeason = (result as List);
    
      _teamsSeason.sort((a, b) => 
      b['avg_ball_possession_percentage']
      .compareTo(a['avg_ball_possession_percentage']));
      } catch ( e) {
        print(e);
      }
     
    }
    update();
    return _teamsSeason;
  }

  Future<dynamic> getMatchesRecord({List<dynamic> matchesRecord}) async {
    var startdate = DateTime.now().year.toString() + '-01-01';
    var enddate = DateTime.now().year.toString() + '-12-31';
    var response = await NetworkManager.getDifferentToken(
        url:
            'https://soccer.sportmonks.com/api/v2.0/fixtures/between/$startdate/$enddate?api_token=djQl5NtCDphBbqcBXX5VbVplKYOlEt8rqjvOZ9374YQXuVgyhD6doaFtAdtg&leagues=$_leagueId&tz=${TZ.kuwaitTimeZone}&include=localTeam,visitorTeam,venue&per_page=150&page$pageid}',
        isFormData: true);
    Map<String, dynamic> decodedJSON = jsonDecode(response);
    if (decodedJSON.containsKey('data')) {
      var result = decodedJSON['data'];
      var meta = decodedJSON['meta'];
      if (pageid == 1) {
        _matchsScore = new List<dynamic>();
      }
      _matchsScore.addAll(result);
      _scrollController.addListener(() {
        if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          if (pageid < (meta['pagination']['total_pages'])) {
            pageid = pageid + 1;
            getMatchesRecord(matchesRecord: _matchsScore);
          }
        }
      });
    }
    update();
    return _matchsScore;
  }

  Future<dynamic> getSeasonCountryData() async {
    var response = await NetworkManager.getDifferentToken(
        url:
            'https://soccer.sportmonks.com/api/v2.0/standings/season/$_currentSeasonId?api_token=${Token.fixturesToken}&include=standings.team',

        isFormData: true);
    Map<String, dynamic> decodedJSON = jsonDecode(response);
    if (decodedJSON.containsKey('data')) {
      var result = decodedJSON['data'];
      print("sportmonks:"+result.toString());
      _seasonCountry =[];
      // if ((result as List).length == 1) {
      //   _seasonCountry = result[0]['standings']['data'];
      //   _seasonCountry.forEach((val) => {
      //         if (val['result'] != null)
      //           {this.addtoarrdescription(val['result'])}
      //       });
      // } else {
      //   _seasonCountry = (result as List);
      if ((result as List).length == 1) {
        (result as List).forEach((val)=> _seasonCountry.add(val['standings']['data']));
      }else {
        (result as List).forEach((val)
        {
          print("['standings']['data']"+val['standings']['data'].length.toString());
          return (val['standings']['data'] as List).forEach((element) =>
              _seasonCountry.add(element)
          );

        });
      }


      update();
    }
    print("_seasonCountry:"+_seasonCountry.length.toString());
    return _seasonCountry;
  }

  Future<dynamic> getStandings() async {

    var response = await NetworkManager.getDifferentToken(
        url:
            'https://soccer.sportmonks.com/api/v2.0/standings/season/$_currentSeasonId?api_token=${Token.fixturesToken}&include=standings.team',
        isFormData: true);
    Map<String, dynamic> decodedJSON = jsonDecode(response);
    if (decodedJSON.containsKey('data')) {
      var result = decodedJSON['data'];
      print("Current Standings");
      if (result.length > 0) {
        _standings = result[0]['standings']['data'];
        _resource = result[0]['resource'];
        for (int i = 0; i < _standings.length; i++) {
          if (_standings[i]['result'] != null) {
            if (_standings[i]['result'] != '' &&
                _resourceArray.indexOf(_standings[i]['result']) == -1 &&
                _standings[i]['result'] != null) {
              _resourceArray.add(_standings[i]['result']);
            }
          }
        }
      }
      update();
    }
    return _standings;
  }

  addtoarrdescription(value) {
    if (value != '' && this.arry.contains(value) == false && value != 'None') {
      arry.add(value);
    }
    update();
  }

  Future<dynamic> getNewsPost() async {
    _newsList = new List<DocumentSnapshot>();
    QuerySnapshot snapshot = await databaseReference
        .collection("IgoalNews")
        .where('leagueid', isEqualTo: int.parse(_leagueId))
        .where('newsid', isEqualTo: '1')
        .orderBy('newsdate', descending: true)
        .limit(10)
        .get();
    snapshot.docs.forEach((element) => _newsList.add(element));
    update();
    return _newsList;
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getCurrentDate(String datetime) {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }

  Future<KnockoutResponse> getKnockoutData() async {
    var response = await NetworkManager.getDifferentToken(
        url:
            'https://soccer.sportmonks.com/api/v2.0/stages/season/17299?api_token=${Token.fixturesToken}&include=fixtures.localTeam,fixtures.visitorTeam,results,season,league',
        isFormData: true);
    Map<String, dynamic> decodedJSON = jsonDecode(response);
    _knockoutResponse = KnockoutResponse.fromJson(decodedJSON);
    update();
    return _knockoutResponse;
  }
}
