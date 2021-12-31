import 'package:app_igoal/Screens/HomeScreen/homeScreenModel.dart';
import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/main.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenViewModel extends GetxController implements LoaderState {
  bool _isTabSelected_1 = true;
  bool _isTabSelected_2 = false;

  bool get isTabSelected_1 => _isTabSelected_1;
  bool get isTabSelected_2 => _isTabSelected_2;

  List<CurrentMatchesData> _currentMatchesDataList = List<CurrentMatchesData>();

  List<CurrentMatchesData> get currentMatchesDataList =>
      _currentMatchesDataList;

  List<DocumentSnapshot> _myArticlesList;
  List<DocumentSnapshot> get myArticlesList => _myArticlesList;

  final databaseReference = FirebaseFirestore.instance;

  List<DocumentSnapshot> _newsList;
  List<DocumentSnapshot> get newsList => _newsList;

  List<DocumentSnapshot> _newsVideoList;
  List<DocumentSnapshot> get newsVideoList => _newsVideoList;

  List<DocumentSnapshot> _newsVulagrisList;
  List<DocumentSnapshot> get newsVulagrisList => _newsVulagrisList;

  int vulgarisList1;
  int vulgarisList2;

  var countriesArabic;

  SessionManager sessionManager = SessionManager();

  // @override
  // void onInit() {
  //
  //   getHighLightMatches();
  //   update();
  //   super.onInit();
  // }

  HomeScreenViewModel() {
    //_isTabSelected_1=true;
    print("HomeScreenViewModel");
    getHighLightMatches();
    getArabic();
  }

  var leagueName;
  getArabic() async {
    countriesArabic =
        jsonDecode(await rootBundle.loadString('assets/files/countriesList'))
            as List;

    leagueName =
        jsonDecode(await rootBundle.loadString('assets/files/ar.json'));

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

  onTab1Changed() {
    _isTabSelected_1 = true;
    _isTabSelected_2 = false;
    update();
  }

  onTab2Changed() {
    _isTabSelected_1 = false;
    _isTabSelected_2 = true;

    update();
  }

  getNewsVideoList() {


    _newsVideoList = <DocumentSnapshot>[];
    var _byteImage;
    databaseReference
        .collection("soccerhighlights")
        .orderBy('urldate', descending: true)
        .limit(20)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) => _newsVideoList.add(f));
      var data = _newsVideoList[0].data() as Map<String,dynamic>;

      // logger.e("_newsVideoList[0]['url'] ${data["urldate"]}");

      for (var news in _newsVideoList) {
        final UriData data = Uri.parse(news["image64"].toString()).data;
        //print(data.contentAsBytes());

        // Would returns your image a Uint8List
        Image.memory(data.contentAsBytes());
        //Image.memory(_byteImage);
      }

      getArticles();
     // print(_newsVideoList[0]['image64']);
      print(_newsVideoList[0]['url']);

      // print(_newsVideoList[0]['fixtureid']);
      update();
    });
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getNewsVulgarisList() {

    _newsVulagrisList = <DocumentSnapshot>[];
    databaseReference
        .collection("IgoalNews")
        .where('newsid', isEqualTo: '1')
        .orderBy('newsdate', descending: true)
        .limit(20)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) => _newsVulagrisList.add(f));


      update();
    });
  }

  getArticles() {
    _myArticlesList = <DocumentSnapshot>[];
    databaseReference
        .collection("IgoalNews")
        .where('newsid', isEqualTo: '2')
        .orderBy('newsdate', descending: true)
        .limit(10)
        .get()
        .then((QuerySnapshot snapshot) {
      setSate(ViewState.Idle);
      snapshot.docs.forEach((f) => _myArticlesList.add(f));
      print("Articles");
      print(_myArticlesList);
      update();
    });
  }

  getNewsList() {

    _newsList = <DocumentSnapshot>[];
    databaseReference
        .collection("IgoalNews")
        .where('newsid', isEqualTo: '1')
        .orderBy('newsdate', descending: true)
        .limit(20)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) => _newsList.add(f));
      getNewsVideoList();
      update();
    });
  }

  getHighLightMatches() async {
    // setSate(ViewState.Busy);

    print(DateFormat('yyyy-MM-dd').format(DateTime.now()));

    //print('https://www.igoalksa.com/GoalWcfService/WebService1.asmx/gethighlightmatches?FixturesDate=${DateFormat('yyyy-MM-dd').format(DateTime.now())}');
    NetworkManager.get(
            url: 'https://www.igoalksa.com/GoalWcfService/WebService1.asmx/gethighlightmatches?FixturesDate=${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
            isFormData: true)
        .then((response) async {
          logger.e("getHighLightMatches $response");
      String result = json.decode(json.encode(response.toString()));
      // print("Match Stats");
      // print(result);
      getCurrentMatchesStatus(result);
    }, onError: (error) {
      //showToast('Something went wrong');
    });
  }

  getCurrentMatchesStatus(String result) async {
    if (IsFirestTime) {
print(IsFirestTime);
      NetworkManager.getDifferentToken(
          url:
          'https://soccer.sportmonks.com/api/v2.0/fixtures/multi/$result?api_token=${Token
              .fixturesToken}&include=localTeam,visitorTeam,league&tz=${TZ
              .kuwaitTimeZone}',
          isFormData: true)
          .then((response) {
            logger.e("response ${response}");
        Map<String, dynamic> decodedJSON = jsonDecode(response);
        if (decodedJSON.containsKey('data')) {
          var result = decodedJSON['data'] as List;
          //print(result[0]);
          _currentMatchesDataList = result
              .map<CurrentMatchesData>(
                  (json) => CurrentMatchesData.fromJson(json))
              .toList();
          if (_currentMatchesDataList.isEmpty) {
            print("current match list ++");
          }
          // print(_currentMatchesDataList[3].id);
          //print(result);
          getNewsList();
          getNewsVulgarisList();
          setSate(ViewState.Idle);
          update();
          print("getCurrentMatchesStatus" +
              _currentMatchesDataList.length.toString());
        } else {
          showToast(decodedJSON['responseException'].toString());
          setSate(ViewState.Idle);
        }
        IsFirestTime=false;
        update();

      }, onError: (error) {
        //showToast('Something went wrong');
      });
    }
  }
}
