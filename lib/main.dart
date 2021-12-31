import 'package:app_igoal/Screens/ClubPlayers/clubPlayersView.dart';
import 'package:app_igoal/Screens/ClubPlayers1/clubPlayers1View.dart';
import 'package:app_igoal/Screens/Description/descriptionView.dart';
import 'package:app_igoal/Screens/Home/homeView.dart';
import 'package:app_igoal/Screens/HomeMatches/homeMatchesView.dart';
import 'package:app_igoal/Screens/HomeScreen/homeScreenView.dart';
import 'package:app_igoal/Screens/Home_4/home4View.dart';
import 'package:app_igoal/Screens/LiveMatchScore/liveMatchScoreView.dart';
import 'package:app_igoal/Screens/LiveMatches/liveMatchesView.dart';
import 'package:app_igoal/Screens/Matches/matchesView.dart';
import 'package:app_igoal/Screens/News/newsView.dart';
import 'package:app_igoal/Screens/NewsList/newsListView.dart';
import 'package:app_igoal/Screens/NextMatches/nextMatchesView.dart';
import 'package:app_igoal/Screens/Players/playersView.dart';
import 'package:app_igoal/Screens/PostScreen/postScreenView.dart';
import 'package:app_igoal/Screens/TabBarController/tabBarControllerView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:app_igoal/Widgets/topLogoWidget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';


import 'helpers/themeService.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

InAppLocalhostServer localhostServer = new InAppLocalhostServer();
var fireBaseToken;

Future<void> setupInteractedMessage() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  RemoteMessage initialMessage =
  await FirebaseMessaging.instance.getInitialMessage();

  fireBaseToken = messaging.getToken().then((value) {
    fireBaseToken = value;
    print("fireBaseToken" + fireBaseToken.toString());
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ));
    }
  });

}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  //await localhostServer.start();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await GetStorage.init();
  runApp(MyApp());

  // await SentryFlutter.init(
  //       (options) {
  //     options.dsn = 'https://814fd736f6a84fa6b6b0c1a1c5eef1d8@o948172.ingest.sentry.io/5897391';
  //   },
  //   appRunner: () => runApp(MyApp()),
  // );

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;

      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    // final pushNotificationService = PushNotificationService(_firebaseMessaging);
    // pushNotificationService.initialise();
    return GetMaterialApp(
      key: UniqueKey(),
      color:   (ThemeService().theme.toString() == "ThemeMode.dark")
                    ? Colors.black
                    : Colors.white,
      title: 'Igoal',
      theme: Themes.light,
      darkTheme: Themes.dark,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      home: TabarControllerView(),
    );
  }
}

class Themes {
  static final light = ThemeData.light().copyWith(

    backgroundColor: Colors.white,
    buttonColor: Colors.black,
    secondaryHeaderColor: Color(0xffF1F1F1),
    scaffoldBackgroundColor: Color(0xffffffff),
    bottomAppBarColor: Colors.white,
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 24),
      headline1: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      headline2: TextStyle(
          color: Color(0xff5A5A5A), fontSize: 40, fontWeight: FontWeight.w600),
      subtitle1: TextStyle(color: Colors.black, fontSize: 12),
      subtitle2: TextStyle(color: Colors.black, fontSize: 16),
      bodyText1: TextStyle(color: Colors.black, fontSize: 10),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Color(0xff1B1B1B),
    buttonColor: Colors.white,
    secondaryHeaderColor: Color(0xff1B1B1B),
    scaffoldBackgroundColor: Color(0xff262626),
    bottomAppBarColor: Colors.black,
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.white, fontSize: 24),
      headline1: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      headline2: TextStyle(
          color: Color(0xff5A5A5A), fontSize: 40, fontWeight: FontWeight.w600),
      subtitle1: TextStyle(color: Colors.white, fontSize: 12),
      subtitle2: TextStyle(color: Colors.white, fontSize: 16),
      bodyText1: TextStyle(color: Colors.white, fontSize: 10),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin<MainScreen> {
  final databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: databaseReference ==  null
          ?
      Container(child: Center(child: CircularProgressIndicator(),),)
          :
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopLogoItem(),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () async {
                print("Get data");
                databaseReference
                    .collection("IgoalNews")
                    .get()
                    .then((QuerySnapshot snapshot) {
                  snapshot.docs.forEach((f) => print('${f['leagueid']}'));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Club Players',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ClubPlayersView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Get records',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ClubPlayers1View()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Club Players1',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DescriptionView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Description  Screen',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home4View()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Home 4',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeMatchesView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Home Matches',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreenView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Home Screen',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LiveMatchesView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Live Matches',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MatchesView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      ' Matches',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NewsView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      ' Matches',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NewsListView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'News List',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NextMatchesView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Next Matches',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PlayersView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Players',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PostScreenView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Post Screen',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor:Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor:Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            LiveMatchScoreView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Live Matches score',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


var logger=Logger();