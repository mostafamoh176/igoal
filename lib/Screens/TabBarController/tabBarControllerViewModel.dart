import 'package:app_igoal/Screens/ClubPlayers1/clubPlayers1View.dart';
import 'package:app_igoal/Screens/Countries/countriesView.dart';
import 'package:app_igoal/Screens/Home/homeView.dart';
import 'package:app_igoal/Screens/HomeScreen/homeScreenView.dart';
import 'package:app_igoal/Screens/Home_4/home4View.dart';
import 'package:app_igoal/Screens/Home_4/home4ViewModel.dart';
import 'package:app_igoal/Screens/NewsList/newsListView.dart';
import 'package:app_igoal/Screens/NextMatches/nextMatchesView.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/languages.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/main.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:get/get.dart';

class TabBarControllerViewModel extends GetxController implements LoaderState {
  int _index = 2;

  int get index => _index;

  List<Widget> _screens = [
    NewsListView(),
    HomePage(),
    HomeScreenView(),
    NextMatchesView(),
    CountriesView(istrue: true)
  ];

  List<Widget> get screens => _screens;

  Widget getScreen(int index) => _screens[index];

  PageController _controller = PageController(initialPage: 2 ,keepPage: false);

  PageController get controller => _controller;

  @override
  ViewState _state;

  @override
  ViewState get viewState => _state;

  @override
  void setSate(ViewState state) {
    _state = state;
    update();
  }

  onPageChanged(int val) {

    
    controller.jumpToPage(val);
    _index = val;
    print("TabBarControllerViewModel "+_index.toString());
    update();
  }
}
