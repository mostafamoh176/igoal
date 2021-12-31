import 'dart:convert';

import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlayersInfoViewModel extends GetxController implements LoaderState{


  bool _isTabSelected_1 = true;
  bool _isTabSelected_2 = false;
  bool _isTabSelected_3 = false;


  bool get isTabSelected_1=>_isTabSelected_1;
  bool get isTabSelected_2=>_isTabSelected_2;
  bool get isTabSelected_3=>_isTabSelected_3;

  String _playerId;

  dynamic _playerInfo;
  dynamic get playerInfo=>_playerInfo;

  dynamic _transfer;
  dynamic get transfer=>_transfer;


  List<DocumentSnapshot> _newsList;
  List<DocumentSnapshot> get newsList=>_newsList;


  final databaseReference = FirebaseFirestore.instance;

  dynamic transferData;


  PlayersInfoViewModel({String playerId}){

    _playerId=playerId;
    print("Player Id");
    print(_playerId);
    getPlayerInfo(playerId);
    loadJsonData();

  }

  var leagueName;
  loadJsonData()async{

    leagueName=jsonDecode(await rootBundle.loadString(
        'assets/files/ar.json'));

    print(leagueName);

  }

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

  onTab1Selected(){
    _isTabSelected_1 = true;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    getNewsList(_playerId);
    update();
  }

  onTab2Selected(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = true;
    _isTabSelected_3 = false;
    getTransferDetal(_playerId);
    update();
  }

  onTab3Selected(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = true;
    // getPlayerInfo(_playerId);
    update();
  }

  // dateConversation(String date){
  //   DateTime dob = (DateFormat('yy/MM/dd').format(DateTime.parse(date))) as DateTime;
  //   //DateTime  dob=DateFormat('yy/MM/dd').format(DateTime.parse(DateTime.parse(date))) as DateTime;
  //    //Duration dur =  DateTime.now().difference(dob);
  //   // String differenceInYears = (dur.inDays/365).floor().toString();
  //   print(dob);
  // }

  getPlayerInfo(String playerId){
    //
     setSate(ViewState.Busy);
    print("Player ");
    //print(_favoriteLeagues.length);
    print("https://soccer.sportmonks.com/api/v2.0/players/$playerId?api_token=${Token.fixturesToken}&include=position,country,lineups'");
    NetworkManager.getDifferentToken(url: 'https://soccer.sportmonks.com/api/v2.0/players/$playerId?api_token=${Token.fixturesToken}&include=position,country,lineups', isFormData: true).then((response) {
      //setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        _playerInfo=result;
        print("Line ups");
        print(result);
        getNewsList(_playerId);
       update();
      }
      else {
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });

  }

  getTransferDetal(String playerId){
    //
    // setSate(ViewState.Busy);
    //print(_favoriteLeagues.length);
    print("here");
   /// print('https://soccer.sportmonks.com/api/v2.0/players/${playerId}?api_token=${Token.fixturesToken}&include=transfers:order(date|asc),transfers.fromTeam,transfers.player,transfers.toTeam,transfers.season');
    NetworkManager.getDifferentToken(url: 'https://soccer.sportmonks.com/api/v2.0/players/$playerId?api_token=${Token.fixturesToken}&include=transfers:order(date|asc),transfers.fromTeam,transfers.player,transfers.toTeam,transfers.season', isFormData: true).then((response) {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data']['transfers']['data'];
        _transfer=result;
        print(_transfer);
       // print(result);



      }
      else {
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });

  }

  getteamObject(String id){

    if(id==null){
      return 'NoName';
    }
    else{
      print("Object testing");
      print(id);
      //print(_transfer[0]['toTeam']);
      print(_transfer.where((element)=>(element['fromTeam'] != null ? element['fromTeam']['data']['id'].toString() : "").toString()==id));
      dynamic team =_transfer.where((element) =>(element['toTeam'] != null ? element['toTeam']['data']['id'].toString() : "").toString() == id).toList().length == 0?
      _transfer.where((element)=>(element['fromTeam'] != null ? element['fromTeam']['data']['id'].toString() : "").toString() == id).toList()[0]['fromTeam']['data']['name']:
      _transfer.where((element)=>(element['toTeam'] != null ? element['toTeam']['data']['id'].toString() : "").toString() == id)[0]['toTeam']['data']['name'].toList();

       return team;
    }

  }

  getteamImageObject(String id){

    if(id==null){
      return 'assets/images/noTeam.jpg';
    }
    else{
      print("Object testing");
      print(id);
      //print(_transfer[0]['toTeam']);
      print(_transfer.where((element)=>(element['fromTeam'] != null ? element['fromTeam']['data']['id'].toString() : "").toString()==id));
      dynamic team =_transfer.where((element) =>(element['toTeam'] != null ? element['toTeam']['data']['id'].toString() : "").toString() == id).toList().length == 0?
      _transfer.where((element)=>(element['fromTeam'] != null ? element['fromTeam']['data']['id'].toString() : "").toString() == id).toList()[0]['fromTeam']['data']['logo_path']:
      _transfer.where((element)=>(element['toTeam'] != null ? element['toTeam']['data']['id'].toString() : "").toString() == id)[0]['toTeam']['data']['logo_path'].toList();

      return team;
    }

  }

  getNewsList(String playerId){
    //
    //
    // setSate(ViewState.Busy);
    _newsList = new List<DocumentSnapshot>();
    databaseReference
        .collection("IgoalNews").where('playerid', isEqualTo:int.parse(playerId) )
        .where('newsid',isEqualTo: '1').orderBy('newsdate',descending:true).limit(20)
        .get()
        .then((QuerySnapshot snapshot) {
      setSate(ViewState.Idle);
      snapshot.docs.forEach((f) => _newsList.add(f));
      print(_newsList.length);
      update();
    });
  }

}