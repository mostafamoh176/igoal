import 'dart:collection';
import 'dart:convert';

import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import "package:collection/collection.dart";
import 'package:app_igoal/helpers/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomePageViewModel extends GetxController implements LoaderState {
  int pageid = 1;

  Timer timer;
  int start = 10;

  bool isRunning = false;

  bool _isTabSelected_1 = false;
  bool _isTabSelected_2 = false;
  bool _isTabSelected_3 = true;
  bool _isTabSelected_4 = false;

  bool get isTabSelected_1 => _isTabSelected_1;

  bool get isTabSelected_2 => _isTabSelected_2;

  bool get isTabSelected_3 => _isTabSelected_3;

  bool get isTabSelected_4 => _isTabSelected_4;

  bool _isExpanded_1 = false;
  bool _isExpanded_2 = false;
  bool _isExpanded_3 = false;
  bool _isExpanded_4 = false;

  bool get isExpanded_1 => _isExpanded_1;

  bool get isExpanded_2 => _isExpanded_2;

  bool get isExpanded_3 => _isExpanded_3;

  bool get isExpanded_4 => _isExpanded_4;

  TextEditingController _txtDateGivenController = TextEditingController();

  TextEditingController get txtDateGivenController => _txtDateGivenController;

  List<HomeMatchesList> _homeMatchList = new List<HomeMatchesList>();

  List<HomeMatchesList> get homeMatchList => _homeMatchList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  double _listLengthIndex = 0;

  double get listLenghtIndex => _listLengthIndex;

  ScrollController _scrollController = new ScrollController();

  ScrollController get scrollController => _scrollController;

  SessionManager _sessionManager = SessionManager();

  List<int> collapsedList = [];

  var leagueName;

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

  @override
  void onClose() {
    print("Timer Cancled");
    if (start != 10) {
      // called just before the Controller is deleted from memory
      timer.cancel();
    }
    update();
    super.onClose();
  }

  HomePageViewModel() {
    var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print(date);
    loadJsonData();
    getMatchesList(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  var countriesArabic;
var time;
  loadJsonData() async {
    leagueName =
        jsonDecode(await rootBundle.loadString('assets/files/ar.json'));

    countriesArabic =
        jsonDecode(await rootBundle.loadString('assets/files/countriesList'))
            as List;
    print(leagueName);
  }

  onTab1Changed() {
    _isTabSelected_1 = true;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    update();
  }

  onTab2Changed() {
    _homeMatchList.clear();
    if (isRunning == true) {
      timer.cancel();
    }
    isRunning = false;
    _isTabSelected_1 = false;
    _isTabSelected_2 = true;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    var date = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().add(new Duration(days: 1)));

    print(date);
    getMatchesList(date.toString());
    print(date);
    print("_isTabSelected_2");
    update();
  }

  onTab3Changed() {
    _homeMatchList.clear();
    if (isRunning == true) {
      timer.cancel();
    }
    isRunning = false;
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_4 = false;
    _isTabSelected_3 = true;
    var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    getMatchesList(date.toString());
    print(date);
    update();
  }

  onTab4Changed() {
    _homeMatchList.clear();
    if (isRunning == true) {
      timer.cancel();
    }
    //timer.cancel();
    isRunning = false;
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = true;

    var date = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(new Duration(days: 1)));
    getMatchesList(date.toString());
    update();
  }

  onMainListItemExpansionChanged(int index) {
    if (_homeMatchList[index].isExpanded == false) {
      _homeMatchList[index].isExpanded = true;
      tempCollpaseList.removeWhere((element) =>
          element.toString() == _homeMatchList[index].data[0]['id'].toString());
      update();
    } else if (_homeMatchList[index].isExpanded == true) {
      _homeMatchList[index].isExpanded = false;
      tempCollpaseList.add(_homeMatchList[index].data[0]['id']);

      update();
    }
    _sessionManager.saveCollpasedMatchesItem(tempCollpaseList);
  }

  onDateTimeSelector(String param) {
    //timer.cancel();
    isRunning = false;
    getMatchesList(param);
  }

  TimerMatchUpdate() {
    getstatus();
    Timer.periodic(Duration(seconds: 35), (timer) => getstatus());
  }

  getstatus() async {
    final response = await http
        .get(Uri.parse("https://limitless-sierra-19130.herokuapp.com/"));
    List<dynamic> status = <dynamic>[];
    if (response.statusCode == 200) {
      status = json.decode(response.body);
      if (status.length > 0)
        for (var league in status) {
          statusArray[league['id']] = league['time'];
          resultArray[league['id']] = league['scores'];
          // print("league['id']"+league['id'].toString());
          update();
        }
      // setState(() => widget.updatematchstatus = status);
    }
  }

  void startTimer(var dateTime) {
    // const oneSec = const Duration(seconds: 60);
    // timer = new Timer.periodic(
    //   oneSec,
    //   (Timer timer) {
    //     if (start == 0) {
    //     } else {
    //       print("Timer" + "" + start.toString());
    //       start++;
    //       getMatchesList(dateTime);
    //     }
    //   },
    // );
  }

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

  checkstatus(dynamic status) {
    // print(status['status']);
    if (this.Definitions.indexOf(status['status'].toString()) > -1 &&
        status['status'] == 'FT') {
      return status['status'];
    } else if (this.Definitions.indexOf(status['status'].toString()) > -1 &&
        (status['status'] == 'FT' ||
            status['status'] == 'HT' ||
            status['status'] == 'FT_PEN')) {
      return status['status'];
    } else if (status['minute'] != null) {
      return status['minute']; //+':'+status?.second;
    } else {
      // return status['starting_at']['time'].toString().replaceRange(5, 8,"");
      var date = DateTime.fromMillisecondsSinceEpoch(
          status['starting_at']['timestamp'] * 1000);
      //  print( DateFormat.Hm().format(date));
      return DateFormat.jm().format(date);
    }
  }

  var tempCollpaseList = <dynamic>[];
  var statusArray = new Map<int, dynamic>();
  var resultArray = new Map<int, dynamic>();

  getMatchesList(String param, {List<HomeMatchesList> homeMatchesList}) async {
    // ignore: deprecated_member_use
    _homeMatchList = new List<HomeMatchesList>();
    _isLoading = true;
    print("Check param");
    print(param);
    var result;
    print(
        'https://soccer.sportmonks.com/api/v2.0/fixtures/date/$param?api_token=${Token.fixturesToken}&tz${TZ.kuwaitTimeZone}&page=$pageid&include=league,localTeam,visitorTeam&per_page=150&leagues=732,1452,1326,1082,2,8,5,1538,720,1328,1085,1114,564,82,1114,1483,32,1251,570,944,1549,24,9,23,27,390,1202,384,109,130,169,310,301,1122,1176,307,953,950,1557,1678,947,1601,938,941,1412,830,959,965,1458,1429,860,1430,956,1567,1373,809,1088,923,926,911,1417,920,971,1603,1487,935,1108,1106,1376,1491,1121,1107,1119,1111,1127,1105,1112,1120,1366,1555,1396,1400,714,732,723,1367,1708,729,1398,1507,1452,462,726,1118');
    NetworkManager.getDifferentToken(
            url:
                'https://soccer.sportmonks.com/api/v2.0/fixtures/date/$param?api_token=${Token.fixturesToken}&tz${TZ.kuwaitTimeZone}&page=$pageid&include=league,localTeam,visitorTeam&per_page=150&leagues=732,1452,1326,1082,2,8,5,1538,720,1328,1085,1114,564,82,1114,1483,32,1251,570,944,1549,24,9,23,27,390,1202,384,109,130,169,310,301,1122,1176,307,953,950,1557,1678,947,1601,938,941,1412,830,959,965,1458,1429,860,1430,956,1567,1373,809,1088,923,926,911,1417,920,971,1603,1487,935,1108,1106,1376,1491,1121,1107,1119,1111,1127,1105,1112,1120,1366,1555,1396,1400,714,732,723,1367,1708,729,1398,1507,1452,462,726,1118',
            isFormData: true)
        .then((response) async {
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        result = decodedJSON['data'] as List;
        var totalPages = int.parse(
            decodedJSON['meta']['pagination']['total_pages'].toString());
        var order = [
          "732",
          "1452",
          "1326",
          "1082",
          "2",
          "8",
          "5",
          "1538",
          "720",
          "1328",
          "1085",
          "1114",
          "564",
          "82",
          "1114",
          "1483",
          "32",
          "1251",
          "570",
          "944",
          "1549",
          "24",
          "9",
          "23",
          "27",
          "390",
          "1202",
          "384",
          "109",
          "130",
          "169",
          "310",
          "301",
          "1122",
          "1176",
          "307",
          "953",
          "950",
          "1557",
          "1678",
          "947",
          "1601",
          "938",
          "941",
          "1412",
          "830",
          "959",
          "965",
          "1458",
          "1429",
          "860",
          "1430",
          "956",
          "1567",
          "1373",
          "809",
          "1088",
          "923",
          "926",
          "911",
          "1417",
          "920",
          "971",
          "1603",
          "1487",
          "935",
          "1108",
          "1106",
          "1376",
          "1491",
          "1121",
          "1107",
          "1119",
          "1111",
          "1127",
          "1105",
          "1112",
          "1120",
          "1366",
          "1555",
          "1396",
          "1400",
          "714",
          "732",
          "723",
          "1367",
          "1708",
          "729",
          "1398",
          "1507",
          "1452",
          "462",
          "726",
          "1118"
        ];
        for (var i = 1; i < totalPages; i++) {
          print("Getting page $i");
          print("Result length before: ${result.length}");

          await NetworkManager.getDifferentToken(
                  url:
                      'https://soccer.sportmonks.com/api/v2.0/fixtures/date/$param?api_token=${Token.fixturesToken}&tz${TZ.kuwaitTimeZone}&include=league,localTeam,visitorTeam&per_page=150&leagues=732,1452,1326,1082,2,8,5,1538,720,1328,1085,1114,564,82,1114,1483,32,1251,570,944,1549,24,9,23,27,390,1202,384,109,130,169,310,301,1122,1176,307,953,950,1557,1678,947,1601,938,941,1412,830,959,965,1458,1429,860,1430,956,1567,1373,809,1088,923,926,911,1417,920,971,1603,1487,935,1108,1106,1376,1491,1121,1107,1119,1111,1127,1105,1112,1120,1366,1555,1396,1400,714,732,723,1367,1708,729,1398,1507,1452,462,726,1118&tz=${TZ.kuwaitTimeZone}&page=${i + 1}',
                  isFormData: true)
              .then((response) {
            Map<String, dynamic> decodedJSON = jsonDecode(response);
            if (decodedJSON.containsKey('data')) {
              result.addAll(decodedJSON['data'] as List);

              print("Result length after: ${result.length}");
            }
          });
        }

        // result = result
        //     .where((element) => order.contains(element['league_id'].toString()))
        //     .toList();
        // print("Result length after filtering by order ${result.length}");
        result.sort((elementA, elementB) => order
            .indexOf(elementA['league_id'].toString())
            .compareTo(order.indexOf(elementB['league_id'].toString())));
        // if (result
        //         .where((element) => element['time']['status'] == "LIVE")
        //         .toList()
        //         .length >
        //     0) {
        //   print("IsRunning");
        //   //TODO: Yahan timer chalana ha call api after every minute
        //   if (isRunning == false) {
        //     print("IsRunning");
        //     isRunning = true;
        //     startTimer(param);
        //   }
        // }
        TimerMatchUpdate();
        for (var league in result) {
          statusArray.addIf(true, league['id'], league['time']);
          resultArray.addIf(true, league['id'], league['scores']);
        }

        print("Status Array Length: ${statusArray.length}");
        print(statusArray);
        print("Result Array Length: ${resultArray.length}");

        var matchesList = groupBy(result, (obj) => obj['league_id']);
        var meta = decodedJSON['meta'];

        for (var league in matchesList.keys) {
          var homeMatchList = new HomeMatchesList();
          homeMatchList.league = league.toString();
          homeMatchList.data = matchesList[league];
          homeMatchList.isExpanded = false;
          _homeMatchList.add(homeMatchList);
        }
        tempCollpaseList = await _sessionManager.getCollpasedMatchItem();

        if (tempCollpaseList.isNotEmpty) {
          tempCollpaseList = (await _sessionManager.getCollpasedMatchItem())[0];
        }
        print("Collpased");
        print(tempCollpaseList);
        for (int i = 0; i < _homeMatchList.length; i++) {
          if (tempCollpaseList
                  .where((o) =>
                      o.toString() ==
                      _homeMatchList[i].data[0]['id'].toString())
                  .length >
              0) {
            print("Condition met");
            _homeMatchList[i].isExpanded = false;
            print(_homeMatchList[i].isExpanded);
            // update();

          } else {
            _homeMatchList[i].isExpanded = true;
          }

          // print("ExpansionData");
          // print(_homeMatchList[i].data[0]['id']);
        }
      } else {
        // showToast(decodedJSON['responseException'].toString());
        //     setSate(ViewState.Idle);
      }
      update();
    }, onError: (error) {
      // setSate(ViewState.Idle);
      //showToast('Something went wrong');
    });
  }
}

class HomeMatchesList {
  bool isExpanded = false;
  String league = "";
  List<dynamic> data;

  HomeMatchesList({this.data, this.league, this.isExpanded});
}
