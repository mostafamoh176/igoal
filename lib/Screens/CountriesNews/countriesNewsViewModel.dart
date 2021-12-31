import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CountriesNewsViewModel extends GetxController implements LoaderState {
  List<Countries> _countiesList = <Countries>[];
  List<Countries> get countiesList => _countiesList;

  SessionManager _sessionManager = SessionManager();

  ViewState _state;

  @override
  ViewState get viewState => _state;

  @override
  void setSate(ViewState state) {
    _state = state;
    update();
  }

  List<Countries> _searchCountriesList;
  List<Countries> get searchCountriesList => _searchCountriesList;

  TextEditingController _txtSearchController = TextEditingController();

  TextEditingController get txtSearchController => _txtSearchController;

  List<dynamic> _favoriteCountryNews = <dynamic>[];

  bool _isTrue;
  bool get isTrue => _isTrue;

  String _leagueId;
  String get leagueId => _leagueId;

  CountriesNewsViewModel({
    bool isTrue,
  }) {
    print("Countries List is true");
    print(isTrue);
    _isTrue = isTrue;
    update();
    print("countries news");
    loadJsonData();
  }

  onFavouriteSave(dynamic league, int index, int mainIndex) async {
    if (_searchCountriesList[mainIndex].data[index].isFavorite == true) {
      _searchCountriesList[mainIndex].data[index].isFavorite = false;
    } else if (_searchCountriesList[mainIndex].data[index].isFavorite ==
        false) {
      _searchCountriesList[mainIndex].data[index].isFavorite = true;
      _favoriteCountryNews.add(league);
      _sessionManager.saveNewsLeague(_favoriteCountryNews);
      var data = _sessionManager.getFavouriteNews();
      print("Fav news");
      print(data.toString());
    }
    onSearchFilter(searchValue);
    update();
  }

  onLeagueRemove(dynamic league, int index, int mainIndex) {
    print("lehue");
    if (_searchCountriesList[mainIndex].data[index].isFavorite == true) {
      _searchCountriesList[mainIndex].data[index].isFavorite = false;
      print("legue");
      print(_favoriteCountryNews);
      if (_favoriteCountryNews.isNotEmpty) {
        int favoriteIndex = _favoriteCountryNews.indexWhere((element) =>
            element['id'] ==
            _searchCountriesList[mainIndex].data[index].data['id']);
        print("Favorite Index: $favoriteIndex");
        if (favoriteIndex != -1) {
          _favoriteCountryNews.removeAt(favoriteIndex);
          print("Removed Successfully ");
        }
        print(_favoriteCountryNews);
        _sessionManager.saveNewsLeague(_favoriteCountryNews);
      }
      update();
    }
    onSearchFilter(searchValue);
    update();
  }

  onExpansionChanged(int index) {
    print("Index for expension");
    print(index);
    if (_searchCountriesList[index].isExpanded == false) {
      for (int i = 0; i < _searchCountriesList.length; i++) {
        _searchCountriesList[i].isExpanded = false;
      }
      _searchCountriesList[index].isExpanded = true;
      update();
    } else if (_searchCountriesList[index].isExpanded == true) {
      for (int i = 0; i < _searchCountriesList.length; i++) {
        _searchCountriesList[i].isExpanded = false;
      }
      _searchCountriesList[index].isExpanded = false;
      update();
    }
  }

  List data;

  Future<String> loadJsonData() async {
    _favoriteCountryNews = <dynamic>[];
    //_sessionManager.remove(SessionKeys.favouriteLeague);
    var data = await _sessionManager.getFavouriteNews();
    print("Get Favorite News");
    print(data);
    //print(data);
    //print("true");
    if (data.isNotEmpty) {
      this._favoriteCountryNews = data[0];
    }
    print("news List");
    //print(this._favoriteCountryNews[0].length);
    var countries = await rootBundle.loadString('assets/files/countriesList');

    var transnational = jsonDecode(
        await rootBundle.loadString('assets/files/transnational.json'));

    var leagues = await rootBundle.loadString('assets/files/intetNationalList');
    data = json.decode(leagues);
    var countriesTemp = jsonDecode(countries) as List;
    // print(data[2]['country_id']);

    _countiesList = <Countries>[];
    for (int i = 0; i < countriesTemp.length; i++) {
      if (_countiesList
              .where((element) =>
                  element.countryId == countriesTemp[i]['id'].toString())
              .toList()
              .length >
          0) {
        continue;
      }

      Countries countries = Countries();
      countries.countryName = countriesTemp[i]['name'];
      countries.countryId = countriesTemp[i]['id'].toString();
      print("Countries temp");
      print(transnational[0]);
      countries.countryLogoPath = transnational
          .where((o) =>
              o['country']['data']['id'].toString() == countries.countryId)
          .toList()[0]['country']['data']['image_path'];
      print(countriesTemp[i]['logo_path']);
      print("Countries Flag");
      print(countriesTemp[i]);
      countries.isExpanded = false;
      // _AnimatedMovies = AllMovies.where((i) => i.isAnimated).toList();
      List<League> leagues = <League>[];

      var leagueData = data
          .where((element) =>
              element['country_id'].toString() == countries.countryId)
          .toList();
      for (var league in leagueData) {
        if (leagueData
                    .where((element) => element['id'] == league['id'])
                    .toList()
                    .length >
                1 &&
            leagues
                    .where((element) => element.data['id'] == league['id'])
                    .toList()
                    .length ==
                1) {
          continue;
        }
        var leagueDTO = new League();
        print("League Id: ");
        // print(this._favoriteLeagues);
        leagueDTO.isFavorite = this
                ._favoriteCountryNews
                .where((element) => element['id'] == league['id'])
                .toList()
                .length >
            0;
        leagueDTO.data = league;
        print("League DTO");
        print(leagueDTO);
        leagues.add(leagueDTO);
      }
      countries.data = leagues;
      _countiesList.add(countries);
      update();
    }
    if (_searchCountriesList == null) {
      _searchCountriesList = <Countries>[];
      _searchCountriesList.addAll(_countiesList);
    }
  }

  //print(_countiesList[1].data[1]);
  var searchValue = "";
  onSearchFilter(String value) {
    searchValue = value;
    print("Search");

    print(_countiesList
        .where((val) =>
            val.countryName.toLowerCase().contains(value.toLowerCase()))
        .toList()
        .length);
    // _listOfFilterProducts=_listOfProducts.where((val) =>val.name.toLowerCase().contains(value.toLowerCase())).toList();
    _searchCountriesList = _countiesList
        .where((val) => val.data
            .where((element) =>
                element.data['Arleagues'].toString().contains(value))
            .isNotEmpty)
        .toList();
    _searchCountriesList.forEach((element) {
      element.data = element.data
          .where(
              (element) => element.data['Arleagues'].toString().contains(value))
          .toList();
    });

    if (value != "") {
      for (int i = 0; i < _searchCountriesList.length; i++) {
        _searchCountriesList[i].isExpanded = true;
      }
    } else {
      for (int i = 0; i < _searchCountriesList.length; i++) {
        // _searchCountriesList[i].isExpanded=false;
      }
    }

    update();
  }
}

class Countries {
  bool isExpanded = false;
  String countryName = "";
  String countryLogoPath = "";
  String countryId = "";
  List<League> data;

  Countries({this.isExpanded, this.data});
}

class League {
  bool isFavorite = false;
  dynamic data;
}
