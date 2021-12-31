import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/main.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class NextMatchesViewModel extends GetxController implements LoaderState{
  SessionManager _sessionManager = SessionManager();


  List<dynamic> _favoriteLeagues = <dynamic>[];
  List<dynamic> get favoriteLeagues => _favoriteLeagues;

  List<dynamic> _fixture = <dynamic>[];
  List<dynamic> get fixture => _fixture;

  List<dynamic> fixturesGames = <dynamic>[];



  dynamic fixtureGameId;

  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
  bool checkBox4 = false;
  bool checkBox5 = false;
  bool checkBox6 = false;
  bool checkBox7 = false;
  bool checkBox8 = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _notificationUserId;
  String get notificationUserId => _notificationUserId;

  var time;

  NextMatchesViewModel() {
    getFavouritiesData();
    loadJsonData();
    signInAnonymously();
  }

  var endTime = (DateTime.now().millisecondsSinceEpoch + 1000 * 60);
  // updateList(){
  //   CountdownTimer(
  //     endTime:endTime,
  //     widgetBuilder: (_, CurrentRemainingTime time) {
  //       if (time == null) {
  //         endTime=(DateTime.now().millisecondsSinceEpoch + 1000*60);
  //         return getFavouritiesData();
  //       }
  //       return null;
  //     },
  //   );
  //
  // }

  onCheckBox1Changed(bool val) {
    if (val == true) {
      checkBox1 = true;
      update();
    } else if (val == false) {
      checkBox1 = false;
      update();
    }

    update();
  }

  onCheckBox2Changed(bool val) {
    if (val == true) {
      checkBox2 = true;
      update();
    } else if (val == false) {
      checkBox2 = false;
      update();
    }

    update();
  }

  onCheckBox3Changed(bool val) {
    if (val == true) {
      checkBox3 = true;
      update();
    } else if (val == false) {
      checkBox3 = false;
      update();
    }

    update();
  }

  onCheckBox4Changed(bool val) {
    if (val == true) {
      checkBox4 = true;
      update();
    } else if (val == false) {
      checkBox4 = false;
      update();
    }

    update();
  }

  onCheckBox5Changed(bool val) {
    if (val == true) {
      checkBox5 = true;
      update();
    } else if (val == false) {
      checkBox5 = false;
      update();
    }

    update();
  }

  onCheckBox6Changed(bool val) {
    if (val == true) {
      checkBox6 = true;
      update();
    } else if (val == false) {
      checkBox6 = false;
      update();
    }

    update();
  }

  onCheckBox7Changed(bool val) {
    if (val == true) {
      checkBox7 = true;
      update();
    } else if (val == false) {
      checkBox7 = false;
      update();
    }

    update();
  }

  onCheckBox8Changed(bool val) {
    if (val == true) {
      checkBox8 = true;
      update();
    } else if (val == false) {
      checkBox8 = false;
      update();
    }

    update();
  }

  onUnSelectAll() {
    checkBox1 = false;
    checkBox2 = false;
    checkBox3 = false;
    checkBox4 = false;
    checkBox5 = false;
    checkBox6 = false;
    checkBox7 = false;
    checkBox8 = false;
    update();
  }

  onSelectAll() {
    checkBox1 = true;
    checkBox2 = true;
    checkBox3 = true;
    checkBox4 = true;
    checkBox5 = true;
    checkBox6 = true;
    checkBox7 = true;
    checkBox8 = true;
    update();
  }

  var leagueName;

  loadJsonData() async {
    leagueName =
        jsonDecode(await rootBundle.loadString('assets/files/ar.json'));
  }

  changeDateToArabic(String date) async {
    await initializeDateFormatting("ar_SA", null);
    var formatter = DateFormat.yMMMd('ar_SA');
    print(formatter.locale);
    String formatted = formatter.format(DateTime.parse(date));
    return formatted;
  }

  signInAnonymously() async {
    _auth.signInAnonymously().then((result) async {
      // print("User");
      // print("firebaseToken");
      // print(result.user.uid.toString());
      _notificationUserId = result.user.uid;
      onUserLogin(fBToken: fireBaseToken, id: _notificationUserId);
      getNotification();
    });
  }

  // changeDate(var date){
  //    initializeDateFormatting("ar_SA", null);
  //   var formatter = DateFormat.yMMMd('ar_SA');
  //   String formatted = formatter.format(date);
  //   return formatted;
  //
  // }

  onDateArabic(String datetime) {
    initializeDateFormatting("ar_KW", null);
    var now = DateTime.parse(datetime);
    var formatter = DateFormat.yMMMd('ar_KW');
    // print(formatter.locale);
    String formatted = formatter.format(now);
    // print(formatted);
    return formatted;
  }

  var callingApi = false;
  int apiCall = 0;

  var definitions = [
    'NS',
    'LIVE',
    'HT',
    'FT',
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

  getFavouritiesData() async {

    if (_notificationUserId != null) {
      logger.i("(_notificationUserId != null");
      getNotification();
    }

    callingApi = true;
    _favoriteLeagues = <dynamic>[];
    fixturesGames.clear();
    _fixture.clear();

    var data = await _sessionManager.getFavourite();

    if (data.isNotEmpty) {

      _favoriteLeagues = data[0];
      await getTodayMatches();
      await getFixturesGame();

    }

    if (data.length == 0) {
      fixturesGames.clear();
    }

  }

  getTimerData() async {
    callingApi = true;
    var data = await _sessionManager.getFavourite();
    if (data.isNotEmpty) {
      _favoriteLeagues = data[0];
      await getTodayMatches();
      await getFixturesGame();
    }
    if (data.length == 0) {
      print("Remove all Lis data");


      fixturesGames.clear();


    }
  }

  var call = 0;
  getTodayMatches() async {
    print("Calling for the time:$call");
    call++;
    var datePrevious = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(new Duration(days: 1)));
    var dateNow = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().add(new Duration(days: 30)));


    for (int i = 0; i < _favoriteLeagues.length; i++) {

      await NetworkManager.getDifferentToken(
              url:
                  'https://soccer.sportmonks.com/api/v2.0/fixtures/between/$datePrevious/$dateNow/${_favoriteLeagues[i]['id']}?api_token=${Token.fixturesToken}&tz=${TZ.kuwaitTimeZone}',
              isFormData: true)
          .then((response) {
        Map<String, dynamic> decodedJSON = jsonDecode(response);
        if (decodedJSON.containsKey('data')) {
          var result = decodedJSON['data'];
          result = result
              .where((game) =>
                  game['time']['status'] == 'LIVE' ||
                  game['time']['status'] == 'HT' ||
                  game['time']['status'] == 'ET' ||
                  game['time']['status'] == 'PEN_LIVE')
              .toList();
          _fixture.addAll(result);
          //  update();
          update();
        }
      }, onError: (error) {
        //setSate(ViewState.Idle);

        //showToast('Something went wrong');
      });
      await getNextMatches(_favoriteLeagues[i]['id'].toString());
    }
  }

  getNextMatches(String teamId) async {
    ///print('here');
    // if(apiCall==0) {
    //   setSate(ViewState.Busy);
    // }
    //print(_favoriteLeagues.length);
    await NetworkManager.getDifferentToken(
            url:
                'https://soccer.sportmonks.com/api/v2.0/teams/$teamId?api_token=djQl5NtCDphBbqcBXX5VbVplKYOlEt8rqjvOZ9374YQXuVgyhD6doaFtAdtg&include=upcoming&tz=${TZ.kuwaitTimeZone}',
            isFormData: true)
        .then((response) {
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        var result = decodedJSON['data']['upcoming']['data'] as List<dynamic>;
        // for(int i=0;i<result.length;i++){
        //    _fixture.add(result[i]);
        //  }
        // print(result);
        // print("Date difference");
        // print(
        //     "Date in the API: ${result[0]['time']['starting_at']['date_time'].toString()}");
        // print("Date now: ${DateTime.now()}");
        // print("${result[0]['time']['status']}");
        print(DateTime.parse(
                result[0]['time']['starting_at']['date_time'].toString())
            .compareTo(DateTime.now()));
        result.sort((elementA, elementB) => DateTime.parse(
                elementA['time']['starting_at']['date_time'].toString())
            .compareTo(DateTime.parse(
                elementB['time']['starting_at']['date_time'].toString())));
        var result1 = List<dynamic>.from(result
            .where((o) =>
                (o['time']['status'] == 'NS' &&
                    DateTime.parse(o['time']['starting_at']['date_time']
                                .toString())
                            .compareTo(DateTime.now()) >=
                        0) ||
                o['time']['status'].toString() == "LIVE")
            .toList());
        if (result1 == null || result1.length == 0) {
          update();
          return;
        }
        //result = result1[0];
        _fixture.add(result1[0]);
        // print("Fixtures data");
        // print(_fixture[0]);
        // update();
        update();
        // print(_fixture);
        // print(result);
      } else {}
    }, onError: (error) {
      // setSate(ViewState.Idle);
    });
  }

    getFixturesGameUpdate() async {

      const oneSec = const Duration(seconds: 35);
    time =   Timer.periodic(oneSec, (Timer timer) {
        try {
logger.e("getFixturesGameUpdate");
          NetworkManager.getDifferentToken(
              url: 'https://limitless-sierra-19130.herokuapp.com/',
              isFormData: true)
              .then((response) {
            List<dynamic> decodedJSON = jsonDecode(response);

            if (decodedJSON.length > 0) {
              decodedJSON.forEach((element) {
                if (fixturesGames.indexWhere(
                        (fixtureelement) => fixtureelement['id'].toString() == element['id'].toString()) !=
                    -1) {
                  var index = fixturesGames.indexWhere(
                          (fixtureelement) => fixtureelement['id'].toString() == element['id'].toString());
                  fixturesGames[index]['time'] = element['time'];
                    fixturesGames[index]['scores'] = element['scores'];
                   update();



                }
              });

            }
          });

        } 
        catch (e)
      {
      }
        });



   return fixturesGames;
  }

  getFixturesGame() async {
     getFixturesGameUpdate();

    fixturesGames.clear();
    for (int i = 0; i < _fixture.length; i++) {
      NetworkManager.getDifferentToken(
              url:
                  'https://soccer.sportmonks.com/api/v2.0/fixtures/${_fixture[i]['id']}?api_token=${Token.fixturesToken}&include=venue,visitorTeam,localTeam,league&tz=${TZ.kuwaitTimeZone}',
              isFormData: true)
          .then((response) {
        Map<String, dynamic> decodedJSON = jsonDecode(response);
        if (decodedJSON.containsKey('data')) {
          var result = decodedJSON['data'];

          var alreadyAdded = fixturesGames
              .where((element) =>
                  element['id'].toString() == result['id'].toString())
              .length;



          if (alreadyAdded > 0) {
            print("now i am checking the values of the array");



          } else if (_favoriteLeagues.length == 0) {


          } else {


            fixturesGames.add(result);
            fixturesGames = fixturesGames
                .where((element) => ((DateTime.now()
                            .difference(DateTime.parse(
                                element['time']['starting_at']['date_time']))
                            .inHours <=
                        0) ||
                    element['time']['status'].toString() == "LIVE" ||
                    element['time']['status'].toString() == "HT"))
                .toList();
            if (fixturesGames
                    .where((element) =>
                        (element['time']['status'].toString() == "LIVE" ||
                            element['time']['status'].toString() == "HT"))
                    .toList()
                    .length >
                0) {}
            fixturesGames.sort((element, elementB) => DateTime.parse(
                    element['time']['starting_at']['date_time'].toString())
                .compareTo(DateTime.parse(
                    elementB['time']['starting_at']['date_time'].toString())));
            update();


          }
        } else {
          //showToast(decodedJSON['responseException'].toString());
          // setSate(ViewState.Idle);
        }
        setSate(ViewState.Idle);
      }, onError: (error) {
        showToast('Something went wrong');
      });
    }

    return fixturesGames;
  }

  // Timer _timer;
  int start = 10;
  int sec;
  startTimer(int dateTime) {
    //  sec=dateTime;
    // const oneSec = const Duration(seconds: 1);
    // _timer = new Timer.periodic(
    //   oneSec,
    //       (Timer timer) {
    //     if (start == 0) {
    //         _timer.cancel();
    //         update();
    //     } else {
    //       sec--;
    //         update();
    //     }
    //   },
    //
    // );
    // return dateTime;
  }

  getNotificationData(String userId) async {
    setSate(ViewState.Busy);
    //print(_favoriteLeagues.length);
    print(
        "https://www.igoalksa.com/GoalWcfService/WebService1.asmx/selectmatcheforDevice?ID=$userId");
    await NetworkManager.getDifferentToken(
            url:
                'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/selectmatcheforDevice?ID=$userId',
            isFormData: true)
        .then((response) {
      setSate(ViewState.Idle);
      if (response.toString().isNotEmpty) {
        Map<String, dynamic> decodedJSON = jsonDecode(response);
        if (decodedJSON.containsKey('data')) {
          var result = decodedJSON['data'];
          print("NotificationsList");
          print(result);
        } else {
          print("No Data");
        }
      }
      print("No Data");
    }, onError: (error) {
      setSate(ViewState.Idle);
    });
  }

  var isGetMatchNotification = <dynamic>[];

  getNotification() async {
    /// print('https://soccer.sportmonks.com/api/v2.0/players/${playerId}?api_token=${Token.fixturesToken}&include=transfers:order(date|asc),transfers.fromTeam,transfers.player,transfers.toTeam,transfers.season');
    NetworkManager.getDifferentToken(
            url:
                'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/selectmatcheforDevice?ID=$notificationUserId',
            isFormData: true)
        .then((response) {
      var decodedJSON;
      if (response.toString().isNotEmpty) {
        decodedJSON = jsonDecode(response);

        var result = decodedJSON;

        //subscriptionItems = result.where((element) => element['SubID'].toString()==fixtureId).toList();
        // print(fixtureId);
        // print(subscriptionItems);
        if (response.toString().isNotEmpty && result.length > 0) {
          isGetMatchNotification = result;
          print("Get notification");
          print(isGetMatchNotification);
        }
      }

      update();
    }, onError: (error) {
      setSate(ViewState.Idle);
    });
  }

  onUserLogin({String fBToken, String id}) async {

    setSate(ViewState.Busy);
    print(
        'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/inserttoken?DID=$id&Token=$fBToken');
    NetworkManager.getDifferentToken(
            url:
                'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/inserttoken?DID=$id&Token=$fBToken',
            isFormData: true)
        .then((response) {
      //Map<String, dynamic> decodedJSON = jsonDecode(response);
      // if (decodedJSON.containsKey('data')) {
      //   setSate(ViewState.Idle);
      //  // print("Data");
      //   var result = decodedJSON['data'];
      //   print(result);
      //
      // }
      // else {
      //   //showToast(decodedJSON['responseException'].toString());
      //   setSate(ViewState.Idle);
      // }
      setSate(ViewState.Idle);
    }, onError: (error) {
      //setSate(ViewState.Idle);
    });
  }


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
  void onInit() async {
    // TODO: implement onInit
    // await localhostServer.start();
    super.onInit();
  }

  @override
  void onClose() {
    //localhostServer.close();
    print("Timer Cancled");
    time.cancel();
    if (start != 10) {
      // called just before the Controller is deleted from memory
      // timer.cancel();
    }
    update();
    super.onClose();
  }

}

 //Create a new function that receives ['id'] data member of fixture
 //Call this API: `https://soccer.sportmonks.com/api/v2.0/fixtures/${fixturesid}?api_token=djQl5NtCDphBbqcBXX5VbVplKYOlEt8rqjvOZ9374YQXuVgyhD6doaFtAdtg&include=venue,visitorTeam,localTeam,league&tz=${Intl.DateTimeFormat().resolvedOptions().timeZone}`
