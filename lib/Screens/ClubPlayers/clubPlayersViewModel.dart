
import 'dart:convert';

import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:intl/date_symbol_data_local.dart';

class ClubPlayersViewModel extends GetxController implements LoaderState{



  bool _isTabSelected_1 = false;
  bool _isTabSelected_2 = false;
  bool _isTabSelected_3 = false;
  bool _isTabSelected_4 = false;
  bool _isTabSelected_5 = false;
  bool _isTabSelected_6 = true;

  bool get isTabSelected_1=>_isTabSelected_1;
  bool get isTabSelected_2=>_isTabSelected_2;
  bool get isTabSelected_3=>_isTabSelected_3;
  bool get isTabSelected_4=>_isTabSelected_4;
  bool get isTabSelected_5=>_isTabSelected_5;
  bool get isTabSelected_6=>_isTabSelected_6;

  String _teamId;
  String get teamId=>_teamId;

  dynamic _teamData;
  dynamic get teamData=>_teamData;

  dynamic _countryId;
  dynamic get countryId=>_countryId;

  dynamic _transfers;
  dynamic get transfers=>_transfers;

  dynamic _trophies;
  dynamic get trophies=>_trophies;

  dynamic _players;
  dynamic get players=>_players;

  dynamic _leagues;
  dynamic get leagues=>_leagues;

  dynamic _currentGames;
  dynamic get currentGames=>_currentGames;


  SessionManager _sessionManager=SessionManager();


  final databaseReference = FirebaseFirestore.instance;

  List<DocumentSnapshot> _newsList;
  List<DocumentSnapshot> get newsList=>_newsList;

  String seasomId;

  @override
  ViewState _state;

  @override
  // TODO: implement viewState
  ViewState get viewState => _state;

  @override
  void setSate(ViewState state) {
    // TODO: implement setSate
    _state = state;
    update();
  }

  ClubPlayersViewModel({String teamid})  {
    print(teamid);
    _teamId=teamid;
    print(_teamId);
      getInformation(_teamId);

    loadJsonData();

    onTab6Changed();
  }

  onTab1Changed(){
    _isTabSelected_1 = true;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    _isTabSelected_5=false;
    _isTabSelected_6=false;
    getInformation(_teamId);

    update();

  }
  onTab2Changed(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = true;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    _isTabSelected_5=false;
    _isTabSelected_6=false;
    getNewsPost(_teamId);
    update();

  }
  onTab3Changed(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = true;
    _isTabSelected_4 = false;
    _isTabSelected_5=false;
    _isTabSelected_6=false;
    getClubPlayers(seasomId,_teamId);
    update();

  }
  onTab4Changed(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = true;
    _isTabSelected_5=false;
    _isTabSelected_6=false;
    update();
  }
  onTab5Changed(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    _isTabSelected_5 = true;
    _isTabSelected_6 = false;
    getPostData();
    update();
  }
  onTab6Changed(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    _isTabSelected_5 = false;
    _isTabSelected_6 = true;
    getCurrentGamesData();
    update();
  }


  var leagueName;
  var countriesArabic;
  loadJsonData()async{

    leagueName=jsonDecode(await rootBundle.loadString(
        'assets/files/ar.json'));

    countriesArabic= jsonDecode(await rootBundle.loadString(
        'assets/files/countriesList')) as List;
    print("Arabic List");
    print(leagueName);

  }

  onDateArabic(String datetime){
    initializeDateFormatting("ar_KW", null);
    var now = DateTime.parse(datetime);
    var formatter = DateFormat.yMMMd('ar_KW');
    // print(formatter.locale);
    String formatted = formatter.format(now);
    // print(formatted);
    return formatted;
  }


  getInformation(String teamid){

    setSate(ViewState.Busy);
    //print(_favoriteLeagues.length);
    //print("https://soccer.sportmonks.com/api/v2.0/teams/${teamid}?api_token=${Token.fixturesToken}&include=country'");
     NetworkManager.getDifferentToken(url: 'https://soccer.sportmonks.com/api/v2.0/teams/$teamid?api_token=${Token.fixturesToken}&include=country', isFormData: true).then((response) {
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        //print(result['name']);
       // print("season");
        _teamData=result;
        seasomId=result['current_season_id'].toString();
        getTrophyList(teamid);
        update();
        //print(seasomId);
      }
      else {
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });


  }

  var _transfers1;
  getTrophyList(String id){
    print("Club Id $id");
    //setSate(ViewState.Busy);
    //print(_favoriteLeagues.length);
    print("Trophy api call");
    print('https://soccer.sportmonks.com/api/v2.0/teams/$id?api_token=${Token.fixturesToken}&include=transfers.player,transfers.team,trophies, transfers.data:order(date|desc)');
    NetworkManager.getDifferentToken(url: 'https://soccer.sportmonks.com/api/v2.0/teams/$id?api_token=${Token.fixturesToken}&include=transfers.player,transfers.team,trophies', isFormData: true).then((response) {
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      setSate(ViewState.Idle);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        _countryId=result['country_id'];
        _trophies=result['trophies']['data'];
       // var sportsMonk=result['trophies']['data']['non_sportmonk_seasons'];
        var tempTransefer=result['transfers']['data'] as List<dynamic>;
        print("Before sorting");
        print(tempTransefer[0]);
         tempTransefer.sort((objA, objB) => (DateTime.parse(objB['date'])).compareTo(DateTime.parse(objA['date'])));
        tempTransefer = tempTransefer.sublist(0, 15);
        //tempTransefer = tempTransefer.sublist(6, 15);
        print("aFTER sorting");
        print(tempTransefer[0]);
        _transfers = tempTransefer;
         update();
         print("trop");
         //print(_trophies[8]['non_sportmonk_seasons']);

      }
      else {
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });
  }


  getClubPlayers(String seasonId,String teamid){

   // setSate(ViewState.Busy);
    //print(_favoriteLeagues.length);
    print("here");
    NetworkManager.getDifferentToken(url: 'https://soccer.sportmonks.com/api/v2.0/squad/season/$seasonId/team/$teamid?api_token=${Token.fixturesToken}&include=player', isFormData: true).then((response) {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        _players=result;
        update();
       // print(_players[0]['player_id']);

      }
      else {
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });

  }

  getPostData()async{
   // setSate(ViewState.Busy);
    //print(_favoriteLeagues.length);
    print("here");
    NetworkManager.getDifferentToken(url: 'https://soccer.sportmonks.com/api/v2.0/teams/$_teamId/current?api_token=${Token.fixturesToken}', isFormData: true).then((response) {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        _leagues=result;
      }
      else {
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });

  }

  getCurrentGamesData()async{

    var date=DateFormat('yyyy-MM-dd').format(DateTime.now());
    //setSate(ViewState.Busy);
    //print(_favoriteLeagues.length);
    var startdate = DateTime.now().year.toString()+'-01-01';
    var enddate = DateTime.now().year.toString()+'-12-31';
    print("here");
    print('https://soccer.sportmonks.com/api/v2.0/fixtures/between/$startdate/$enddate/$_teamId?api_token=${Token.fixturesToken}&include=localTeam,visitorTeam,league&tz=${TZ.kuwaitTimeZone}}');

    NetworkManager.getDifferentToken(url: 'https://soccer.sportmonks.com/api/v2.0/fixtures/between/$startdate/$enddate/$_teamId?api_token=${Token.fixturesToken}&include=localTeam,visitorTeam,league,venue&tz=${TZ.kuwaitTimeZone}', isFormData: true).then((response) {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        _currentGames=result;
        print(result);
      }
      else {
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });

  }

  getNewsPost(String teamid ){


   // setSate(ViewState.Busy);
    _newsList = <DocumentSnapshot>[];
    databaseReference
        .collection("IgoalNews").where('teadmid', isEqualTo: int.parse(_teamId.toString()))
        .where('newsid', isEqualTo:'1' ).orderBy('newsdate',descending:true).limit(10)
        .get()
        .then((QuerySnapshot snapshot) {
      setSate(ViewState.Idle);
      snapshot.docs.forEach((f) => _newsList.add(f));
     // print(_newsList[0]);
      update();
    });
  }



}