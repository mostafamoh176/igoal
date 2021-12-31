import 'dart:convert';

import 'package:app_igoal/Models/TeamLineUp_Response.dart';
import 'package:app_igoal/Screens/HomeScreen/homeScreenModel.dart';
import 'package:app_igoal/Screens/Home_4/home4Model.dart';
import 'package:app_igoal/Screens/TabBarController/tabBarControllerViewModel.dart';
import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/main.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import "package:collection/collection.dart";

import 'dart:collection';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home4ViewModel extends GetxController implements LoaderState {
  bool _isTabSelected_1 = false;
  bool _isTabSelected_2 = false;
  bool _isTabSelected_3 = false;
  bool _isTabSelected_4 = false;
  bool _isTabSelected_5 = false;
  bool _isTabSelected_6 = true;
  bool _isLoading = false;
TabBarControllerViewModel tbvm =new TabBarControllerViewModel();
  TeamLineUpResponse _teamLineUpResponse;

  bool get isTabSelected_1 => _isTabSelected_1;

  bool get isTabSelected_2 => _isTabSelected_2;

  bool get isTabSelected_3 => _isTabSelected_3;

  bool get isTabSelected_4 => _isTabSelected_4;

  bool get isTabSelected_5 => _isTabSelected_5;

  bool get isTabSelected_6 => _isTabSelected_6;

  TeamLineUpResponse get teamLineUpResponse => _teamLineUpResponse;

  ScrollController scrollController = ScrollController();

  bool _isExpanded_1 = true;
  bool _isExpanded_2 = false;

  bool get isExpanded_1 => _isExpanded_1;

  bool get isExpanded_2 => _isExpanded_2;

  CurrentMatchesData _currentMatchesData = CurrentMatchesData();

  CurrentMatchesData get currentMatchData => _currentMatchesData;

  List<CurrentMatchesData> _matchList = List<CurrentMatchesData>();

  List<CurrentMatchesData> get matchList => _matchList;

  List<CurrentMatchesData> _matchSortedList = List<CurrentMatchesData>();

  List<CurrentMatchesData> get matchSortedList => _matchSortedList;

  List<BroadCasting> _broadCasting = List<BroadCasting>();

  List<BroadCasting> get broadCasting => _broadCasting;

  List<YearData> _finalYearData = new List<YearData>();

  List<YearData> get finalYearData => _finalYearData;

  String _seasonId;

  List<SeasonMatchModel> _seasonMatchList = List<SeasonMatchModel>();

  List<SeasonMatchModel> get seasonMatchList => _seasonMatchList;

  List<Season> _seasonList = List<Season>();

  List<Season> get seasonList => _seasonList;

  List<PossesionList> possesionList = List<PossesionList>();

  int tab = 0;

  bool get isLoading => _isLoading;

  dynamic dataMatch;
  dynamic leaguedata;
  dynamic id;
  dynamic lid;
  dynamic lname;
  dynamic localname;
  dynamic visitname;
  dynamic localid;
  dynamic planteam;
  dynamic visiid;
  dynamic extratime;
  dynamic resultarr;
  dynamic stats;
  dynamic Formations;
  dynamic events;
  dynamic tvstations;

  var arry = [];

  String idParam;

  double progress = 0.0;
  InAppWebViewController webViewController;
  String url = "";

  String urlPath;

  String _matchStatus;

  SessionManager sessionManager = SessionManager();

  String arrangementId;

  Home4ViewModel({String id, String seasonId, String matchStatus}) {
    // if(timer!=null){
    //   timer.cancel();
    // }
    print("id: $id");
    _matchStatus = matchStatus;

    print("SeasonId");
    print(seasonId);
    arrangementId = id;
    setSate(ViewState.Busy);
    getMatchDetailData(param: id);

    if (_matchStatus == "FT") {
      startTimer(_currentMatchesData.id.toString());
    }

    _seasonId = seasonId;
    print(_seasonId);
    print("team Id");
    print("team Id");
    idParam = id;
    print(idParam);
    print("Get themeMode from SharedPreference");


   
    // var theme=sessionManager.getThemeData();
    //
    //    print(ThemeService().theme);
    // urlPath =
    //     "http://localhost:8080/assets/igoal/current-game/${idParam}?theme=" +
    //         ((ThemeService().theme == ThemeMode.dark) ? "1" : "0") +
    //         "&&tab=detail";

    // urlPath =
    //     "https://igoalplan3.excelorithm.com/current-game/${idParam}?theme=" +
    //         ((ThemeService().theme == ThemeMode.dark) ? "1" : "0") +
    //         "&&tab=detail";
    //urlPath = "http://localhost:8080/assets/igoal/index.html";
    //webViewController.loadUrl(url: urlPath);
    getArabic();
    getMatchDetailData(param: idParam);
    update();
  }

  double tabHeight = 300;

  Timer  time;


  void startTimer(String id) {
 
    getstatus(id);
    time= Timer.periodic(Duration(seconds: 35), (timer) => getstatus(id));
    update();
  }
  @override
  void dispose() {
       print("league['id']## dispose" );
     time.cancel();
    super.dispose();
  }
  getstatus(String id) async {
    // print("id.toString()="+arrangementId.toString());
    final response = await http
        .get(Uri.parse("https://limitless-sierra-19130.herokuapp.com/"));
    List<dynamic> status = <dynamic>[];
    if (response.statusCode == 200) {
      status = json.decode(response.body);
      if (status.length > 0)
        for (var league in status) {
          // print("league['id']##" + league['time'].toString());
          if (league['id'].toString() == _currentMatchesData.id.toString()) {
            try {
              print("league['id']##" + league['time'].toString());
              _currentMatchesData.time.status = league['time']['status']??"" ;
              _currentMatchesData.time.minute = league['time']['minute']??0 ;
              _currentMatchesData.scores.localteamScore = league['scores']['localteam_score']??0 ;
              _currentMatchesData.scores.visitorteamScore = league['scores']['visitorteam_score']??0 ;
              _currentMatchesData.scores.localteamPenScore = league['scores']['localteam_pen_score']??0 ;
              _currentMatchesData.scores.visitorteamPenScore = league['scores']['visitorteam_pen_score']??0 ;
              update();
            } catch (e) {
              print("catch:" + e.toString());
            }
          }
        }
    }
    
    
  }

  getTabHeight(double height) {
    tabHeight = height;
    update();
  }

  onProgressStart() {
    progress = 0.0;
    print("Progress" + {progress}.toString());
    update();
  }

  onProgressEnd() {
    progress = 1.0;
    print("Progress" + {progress}.toString());
    update();
  }

  @override
  ViewState _state;

  @override
  // TODO: implement viewState
  ViewState get viewState => _state;

  @override
  void setSate(ViewState state) {
    // TODO: implement setSate
     print("league['id']## state" );
    _state = state;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    // await localhostServer.start();
    super.onInit();
  }

  getTeamLineUpResponse(String fixturesId) {
    NetworkManager.getDifferentToken(
            url:
                'https://soccer.sportmonks.com/api/v2.0/fixtures/$fixturesId?api_token=${Token.fixturesToken}&include=league,localTeam,visitorTeam,events.player,lineup.player,stats',
            isFormData: true)
        .then((response) {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      _teamLineUpResponse = TeamLineUpResponse.fromJson(decodedJSON);
      print("getTeamLineUpResponse");
      print(_teamLineUpResponse);
      _isLoading = false;
      update();
    }, onError: (error) {
      _isLoading = false;
      setSate(ViewState.Idle);
    });
  }

  @override
  void onClose() {
    //localhostServer.close();
    print("Timer Cancled");
    
    time.cancel();
    // if (start != 10) {
    //   // called just before the Controller is deleted from memory
    //   time.cancel();
    // }
    update();
    super.onClose();
  }

  onTab1Selected() {
    onProgressStart();
    if (tab != 1) {
      print("highlights");
      //webViewController.clearCache();
      // webViewController.clearCache();
      // update();
    }
    _isTabSelected_1 = true;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    _isTabSelected_5 = false;
    _isTabSelected_6 = false;
    // webViewController.clearCache();
    //
    // webViewController.clearFocus();
    urlPath =
        "https://igoalplan3.excelorithm.com/current-game/$idParam?theme=" +
            ((ThemeService().theme == ThemeMode.dark) ? "1" : "0") +
            "&&tab=videohighlights";
    //
    if (tab != 1) {
      print("reload");
      // webViewController.loadUrl( urlRequest:URLRequest(url: Uri.parse(urlPath)));

    }

    //
    // webViewController.clearCache();
    // webViewController.loadUrl(url: urlPath);
    tab = 0;
    update();
  }

  // setState(() => widget.updatematchstatus = status);
  // }

  // }

  onTab2Selected() {
    _isTabSelected_1 = false;
    _isTabSelected_2 = true;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    _isTabSelected_5 = false;
    _isTabSelected_6 = false;
    tab = 1;
    //  webViewController.reload();

    update();
  }

  onTab3Selected() {
    _isLoading = true;
    update();
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = true;
    _isTabSelected_4 = false;
    _isTabSelected_5 = false;
    _isTabSelected_6 = false;
    getTeamLineUpResponse(arrangementId);
  }

  onTab4Selected() {
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = true;
    _isTabSelected_5 = false;
    _isTabSelected_6 = false;
    tab = 1;
    // webViewController.reload();

    update();
  }

  onTab5Selected() {
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    _isTabSelected_5 = true;
    _isTabSelected_6 = false;
    tab = 1;
    getseasonStandings(idParam);
    update();
  }

  onTab6selected() {
    progress = 0.0;
    onProgressStart();
    if (tab != 1) {
      print("reload");
      //webViewController.clearCache();
      // webViewController.clearCache();
      update();
    }

    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    _isTabSelected_5 = false;
    _isTabSelected_6 = true;
    //print(ThemeService().theme);
    // webViewController.clearCache();
    // webViewController.clearFocus();
    urlPath =
        "https://igoalplan3.excelorithm.com/current-game/$idParam?theme=" +
            ((ThemeService().theme == ThemeMode.dark) ? "1" : "0") +
            "&&tab=detail";
    //
    if (tab != 1) {
      print("reload");
      //webViewController.clearCache();
      //webViewController.loadUrl(url: urlPath);
    }
    tab = 0;
    update();
  }

  var leagueName;
  var countriesArabic;

  getArabic() async {
    countriesArabic =
        jsonDecode(await rootBundle.loadString('assets/files/countriesList'))
            as List;

    leagueName =
        jsonDecode(await rootBundle.loadString('assets/files/ar.json'));
  }

  removeLastCharacter(String str) {
    String result;
    if ((str != null) && (str.length > 3)) {
      result = str.substring(0, str.length - 3);
    }

    return result;
  }

  onTeamDetailsExpansionChanged() {
    if (_isExpanded_1 == false) {
      _isExpanded_1 = true;
    } else if (_isExpanded_1 == true) {
      _isExpanded_1 = false;
    }

    update();
  }

  onPlayersExpansionChanged() {
    if (_isExpanded_2 == false) {
      _isExpanded_2 = true;
    } else if (_isExpanded_2 == true) {
      _isExpanded_2 = false;
    }
    update();
  }

  onYearExpansionItem(int index) {
    if (_finalYearData[index].isExpanded == false) {
      _finalYearData[index].isExpanded = true;
      update();
    } else if (_finalYearData[index].isExpanded == true) {
      _finalYearData[index].isExpanded = false;
      update();
    }
  }

  changeDateToArabic(String date) async {
    await initializeDateFormatting("ar_SA", null);
    var formatter = DateFormat.yMMMd('ar_SA');
    print(formatter.locale);
    String formatted = formatter.format(DateTime.parse(date));
    return formatted;
  }

  calculateItemHeigth(dynamic arrayLength) {
    int height;
    for (int i = 0; i < arrayLength.length; i++) {}
  }

  // @override
  // void close(){
  //
  //   super.onClose();
  //
  // }

  var Definitions = [
    'NS',
    'LIVE',
    'HT',
    'FT',
    'FT_PEN',
    'ET',
    'PEN_LIVE',
    'AET',
    'BREAK',
    'FT_PE',
    'CANCL',
    'POSTP',
    'INT',
    'ABAN',
    'SUSP',
    'AWARDED',
    'DELAYED',
    'TBA',
    'WO',
    'AU',
    'Deleted'
  ];

  checkstatus(Time status) {
    print("I ma working");
    if (this.Definitions.indexOf(status.status.toString()) > -1 &&
        status.status == 'FT') {
      return status.status;
    } else if (this.Definitions.indexOf(status.status.toString()) > -1 &&
        (status.status == 'FT' ||
            status.status == 'HT' ||
            status.status == 'FT_PEN')) {
      return status.status;
    } else if (status.minute != null) {
      return status.minute; //+':'+status?.second;
    } else {
      // print("2021-03-02 "+status['starting_at']['time']);
      var date = DateTime.fromMillisecondsSinceEpoch(
          status.startingAt.timestamp * 1000);
      // print( DateFormat.Hm().format(date));
      return DateFormat.jm().format(date);
      // return status.startingAt.time.toString().replaceRange(5, 8,"");
    }
  }

  var tempCollpaseList = <dynamic>[];
  var statusArray = new Map<int, dynamic>();
  var resultArray = new Map<int, dynamic>();

  getMatchDetailData({String param}) async {
    //if(start<0){

    //}
    // setSate(ViewState.Idle);

    print("Live Api");
    print(
        'https://soccer.sportmonks.com/api/v2.0/fixtures/$param?api_token=${Token.fixturesToken}&include=league,localTeam,visitorTeam,tvstations,events.player,lineup,stats,highlights');

    //'https://soccer.sportmonks.com/api/v2.0/fixtures/'+'16924707'+ '?api_token=' + Token.fixturesToken+ '&tz=' + TZ.kuwaitTimeZone+ '&include=league,localTeam,visitorTeam,tvstations,events.player,lineup,stats'
    NetworkManager.getDifferentToken(
            url: //'https://limitless-sierra-19130.herokuapp.com',
                'https://soccer.sportmonks.com/api/v2.0/fixtures/$param?api_token=${Token.fixturesToken}&include=league,localTeam,visitorTeam,tvstations,events.player,lineup,stats,highlights',
            isFormData: true)
        .then((response) {
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        var broadCastingData =
            BroadCastingModel.fromJson(decodedJSON['data']['tvstations']);
        //print(result['time']['starting_at']['date']);
        _currentMatchesData = CurrentMatchesData.fromJson(result);
        //print(_currentMatchesData.visitorTeam.data.name);
        for (int i = 0; i < broadCastingData.data.length; i++) {
          _broadCasting.add(broadCastingData.data[i]);
          update();
        }
        update();
        // setSate(ViewState.Idle);
        // print(_broadCasting.length);
        print("Current Match Data");
        print(_currentMatchesData.time.status);

        getMatchList(_currentMatchesData.localTeam.data.id.toString(),
            _currentMatchesData.visitorTeam.data.id.toString());
        getLiveMatchDetail();

        if (_currentMatchesData.time.status == "LIVE") {
          startTimer(id);
        }
        // print(_currentMatchesDataList[3].scores.visitorteamScore);
      } else {
        showToast(decodedJSON['responseException'].toString());
        setSate(ViewState.Idle);
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
      //showToast('Something went wrong');
    });
  }

  int itemlength = 0;

  getMatchList(String localTeamId, String visitorTeamId) async {
    NetworkManager.getDifferentToken(
            url:
                'https://soccer.sportmonks.com/api/v2.0/head2head/$localTeamId/$visitorTeamId?api_token=${Token.fixturesToken}&include=localTeam,visitorTeam,venue',
            isFormData: true)
        .then((response) {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'] as List;
        var yearlyData = decodedJSON['data'] as List;
        //print(yearlyData[0]['time']['starting_at']['date']);
        _matchList = result
            .map<CurrentMatchesData>(
                (json) => CurrentMatchesData.fromJson(json))
            .toList();
        // print(_matchList[0].time.startingAt.date);
        var yearByData = groupBy(
            yearlyData,
            (obj) => DateFormat('yyyy')
                .format(DateTime.parse(obj['time']['starting_at']['date']))
                .toString());
        for (var year in yearByData.keys) {
          var yearData = new YearData();
          yearData.year = year;
          yearData.data = yearByData[year] ;
          yearData.isExpanded = true;
          _finalYearData.add(yearData);
          update();
        }
        print("Year by Data");
        print(_finalYearData);
        for (int i = 0; i < _finalYearData.length; i++) {
          for (int j = 0; j < _finalYearData[i].data.length; j++) {
            itemlength = itemlength + _finalYearData[i].data.length;
            update();
            print(_finalYearData[i].data.length);
          }
        }
        print("inner length");
        print(itemlength);
        update();
        // //_matchSortedList
        // print(_finalYearData[0].data[0]);
        update();
      } else {
        showToast(decodedJSON['responseException'].toString());
        setSate(ViewState.Idle);
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);

      //showToast('Something went wrong');
    });
  }

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
                'https://soccer.sportmonks.com/api/v2.0/standings/season/$_seasonId?api_token=${Token.fixturesToken}&include=standings.team',
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
            seasonListLength = (seasonListLength??0 + _seasonList[j].data.length??0)??0;
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

  addtoarrdescription(value) {
    if (value != '' && this.arry.contains(value) == false && value != 'None') {
      arry.add(value);
      print(arry.length);
      update();
    }
    // print("Array length: ${arry.length}");
    // update();
  }

  getLiveMatchDetail() async {
    String param = '16924707';
    // setSate(ViewState.Busy);
    NetworkManager.getDifferentToken(
            url: 'https://soccer.sportmonks.com/api/v2.0/fixtures/$idParam?api_token=' +
                Token.fixturesToken +
                '&tz=' +
                TZ.kuwaitTimeZone +
                '&include=league,localTeam,visitorTeam,tvstations,events.player,lineup,stats,highlights',
            isFormData: true)
        .then((response) {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data'];
        print("Live Match Detail");
        dataMatch = result;
        leaguedata = dataMatch['league']['data'];
        id = param;
        lid = dataMatch['league']['data']['id'];
        lname = dataMatch['league']['data']['name'];
        localname = dataMatch['localTeam']['data']['name'];
        visitname = dataMatch['visitorTeam']['data']['name'];
        localid = dataMatch['localTeam']['data']['id'];
        visiid = dataMatch['visitorTeam']['data']['id'];
        planteam = dataMatch['localTeam']['data']['id'];
        print("Tv stations");
        tvstations = dataMatch['tvstations']['data'];
        print(tvstations);

        if (dataMatch['events'] != null) {
          events = dataMatch['events']['data'].reversed.toList();
          print("events");
          var broadCastingData =
              BroadCastingModel.fromJson(decodedJSON['data']['tvstations']);
          //print(result['time']['starting_at']['date']);
          //print(_currentMatchesData.visitorTeam.data.name);
          for (int i = 0; i < broadCastingData.data.length; i++) {
            _broadCasting.add(broadCastingData.data[i]);
            update();
          }
          // events.sort((elementA, elementB) => double.parse(elementA['id'].toString()).compareTo(double.parse(elementB.toString())));
        }
        print(dataMatch['scores']);
        //resultarr[id]=dataMatch['scores'];
        stats = (dataMatch['stats']['data'] != null)
            ? dataMatch['stats']['data']
            : null;
        print('stats');
        print(dataMatch['stats']['data']);
        Formations = dataMatch['formations']['localteam_formation'];
      } else {
        showToast(decodedJSON['responseException'].toString());
        setSate(ViewState.Idle);
      }
      update();
    }, onError: (error) {
      setSate(ViewState.Idle);

      //showToast('Something went wrong');
    });
  }
}

class YearData {
  bool isExpanded = false;
  String year = "";

  List<dynamic> data;

  YearData({this.data, this.year, this.isExpanded});
}

class Season {
  String groupName = '';
  List<dynamic> data;

  Season({this.groupName, this.data});
}

class PossesionList {
  dynamic left;
  dynamic rigth;
  String centerText;

  PossesionList({this.left, this.rigth, this.centerText});
}
