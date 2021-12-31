
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CountriesViewModel extends GetxController implements LoaderState{

  List<Countries> _countiesList=List<Countries>();
  List<Countries> get countiesList=>_countiesList;

  List<Countries> _searchCountriesList;
  List<Countries>  get searchCountriesList=> _searchCountriesList;


  TextEditingController _txtSearchController = TextEditingController();

  TextEditingController get txtSearchController => _txtSearchController;


  SessionManager _sessionManager=SessionManager();

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
  var searchValue = "";
  onSearchFilter(String value ){
    searchValue = value;
    print("Search");

    print(_countiesList.where((val) => val.countryName.toLowerCase().contains(value.toLowerCase())).toList().length);
    // _listOfFilterProducts=_listOfProducts.where((val) =>val.name.toLowerCase().contains(value.toLowerCase())).toList();
    _searchCountriesList=_countiesList.where((val) => val.data.where((element) => element.data['Arleagues'].toString().contains(value)).isNotEmpty).toList();
    _searchCountriesList.forEach((element) {
      element.data = element.data.where((element) => element.data['Arleagues'].toString().contains(value)).toList();
    });
    if(value!=""){
      for(int i=0;i<_searchCountriesList.length;i++){
        _searchCountriesList[i].isExpanded=true;
      }
    }
    else{
      for(int i=0;i<_searchCountriesList.length;i++){
        //_searchCountriesList[i].isExpanded=false;
      }

    }

    update();
  }


  List<dynamic> _favoriteLeagues = new List<dynamic>();

  bool _isTrue;
  bool get  isTrue=>_isTrue;

  String _leagueId;
  String get leagueId=>_leagueId;

  CountriesViewModel({bool isTrue,}){
    print("Countries List is true");
    print(isTrue);
    _isTrue=isTrue;
    if(_isTrue==false){
      loadJsonData();

    }else{
      loadJsonDataForNews();
    }


    update();

  }



  // Future<dynamic> getCountriesList()async{
  //  var data= rootBundle.loadString('assets/files/countriesList');
  //  var countriesList=json.decode(data.toString());
  //  print(countriesList);
  // }
  onFavouriteSave(dynamic league,int index,int mainIndex)async{

    if(_searchCountriesList[mainIndex].data[index].isFavorite==true){
      _searchCountriesList[mainIndex].data[index].isFavorite=false;

    }
    else if(_searchCountriesList[mainIndex].data[index].isFavorite==false){
      _searchCountriesList[mainIndex].data[index].isFavorite=true;

      // var add ="{id: 230234,legacy_id: null,name: Jalapa,short_code: null,twitter: null,country_id: 3990,national_team: false,founded: null,logo_path: https://cdn.sportmonks.com/images/soccer/team_placeholder.png,venue_id: 182876,current_season_id: 18572,is_placeholder: false}";
        // _favoriteLeagues.add(add);
      _favoriteLeagues.add(league);
       print("onFavouriteSave "+league.toString());
      _sessionManager.saveFavouriteLeague(_favoriteLeagues);
      var data = _sessionManager.getFavourite();
      print("Fav news");
      print("onFavouriteSave "+data.toString());

    }
    onSearchFilter(searchValue);
    update();
  }

  onLeagueRemove(dynamic league,int index,int mainIndex){

    print("lehue");
    if(_searchCountriesList[mainIndex].data[index].isFavorite==true){
      _searchCountriesList[mainIndex].data[index].isFavorite=false;
      print("legue");
      print(_favoriteLeagues);
      if(_favoriteLeagues.isNotEmpty) {
        int favoriteIndex = _favoriteLeagues.indexWhere((element) => element['id'] == _searchCountriesList[mainIndex].data[index].data['id']);
        print("Favorite Index: $favoriteIndex");
        if(favoriteIndex != -1){
          _favoriteLeagues.removeAt(favoriteIndex);
          print("Removed Successfully ");
        }

        print(_favoriteLeagues);
        _sessionManager.saveFavouriteLeague(_favoriteLeagues);
      }
      update();
    }
    //
    onSearchFilter(searchValue);
    update();

    // update();
  }
  onExpansionChanged(int index){
    print("Index for expension");
    print(index);
    if(_searchCountriesList[index].isExpanded==false){
      for(int i=0;i<_searchCountriesList.length;i++){
        _searchCountriesList[i].isExpanded=false;
      }
      _searchCountriesList[index].isExpanded=true;
      update();
    }
    else if(_searchCountriesList[index].isExpanded==true){
      for(int i=0;i<_searchCountriesList.length;i++){
        _searchCountriesList[i].isExpanded=false;
      }
      _searchCountriesList[index].isExpanded=false;
      update();
    }
  }
  List data;
  Future<String> loadJsonData() async {
    _favoriteLeagues = new List<dynamic>();
    //_sessionManager.remove(SessionKeys.favouriteLeague);
    var data = await _sessionManager.getFavourite();
    print("Get Favorite News");
    print(data);
    //print(data);
    //print("true");
    if(data.isNotEmpty) {
      this._favoriteLeagues = data[0];
    }
    print("news List");
    //print(this._favoriteCountryNews[0].length);
    var countries = await rootBundle.loadString(
        'assets/files/countriesList');
    var leagues = await rootBundle.loadString(
        'assets/files/intetNationalList');
    var transnational= jsonDecode(await rootBundle.loadString(
        'assets/files/transnational.json'));
    data = json.decode(leagues);
    var countriesTemp = jsonDecode(countries) as List;
    // print(data[2]['country_id']);

    _countiesList = List<Countries>();
    for (int i = 0; i < countriesTemp.length; i++) {
      Countries countries = Countries();
      countries.countryName = countriesTemp[i]['name'];
      countries.countryId = countriesTemp[i]['id'].toString();
      countries.countryLogoPath =  transnational.where((o) => o['country']['data']['id'].toString() == countries.countryId).toList()[0]['country']['data']['image_path'];
      countries.isExpanded = false;
      // _AnimatedMovies = AllMovies.where((i) => i.isAnimated).toList();
      List<League> leagues = new List<League>();

      var leagueData = data.where((element) =>
      element['country_id'].toString() == countries.countryId).toList();

      for (var league in leagueData) {

        if(leagueData.where((element) => element['id'] == league['id']).toList().length > 1 && leagues.where((element) => element.data['id'] == league['id']).toList().length == 1){
          continue;
        }
        var leagueDTO = new League();
        print("League Id: ");
        // print(this._favoriteLeagues);
        leagueDTO.isFavorite = this._favoriteLeagues
            .where((element) => element['id'] == league['id'])
            .toList()
            .length > 0;
        leagueDTO.data = league;
        leagues.add(leagueDTO);
      }
      countries.data = leagues;
      _countiesList.add(countries);
      // _searchCountriesList.addAll(_countiesList);
      // print("Print data");
      // print(_countiesList[0].countryLogoPath);
      update();
    }
    if(_searchCountriesList == null) {
      _searchCountriesList = new List<Countries>();
      _searchCountriesList.addAll(_countiesList);
    }

  }
  //print(_countiesList[1].data[1]);
  Future<String> loadJsonDataForNews() async {
    print("Kiyay yehe bc function ha");
    _favoriteLeagues = new List<dynamic>();
    //_sessionManager.remove(SessionKeys.favouriteLeague);
    var data = await _sessionManager.getFavourite();
     //print(data);
        //print("true");
        if(data.isNotEmpty) {
          this._favoriteLeagues = data[0];
        }
          // print(this._favoriteLeagues[0].length);
          // var countries = await rootBundle.loadString(
          //     'assets/files/countriesList');
          // var leagues = await rootBundle.loadString(
          //     'assets/files/intetNationalList');
    var countries = await rootBundle.loadString(
        'assets/files/transnational.json');
    var leagues = await rootBundle.loadString(
        'assets/files/transnational.json');
    var transnational= jsonDecode(await rootBundle.loadString(
        'assets/files/transnational.json'));
          data = json.decode(leagues);

    var countriesArabic= jsonDecode(await rootBundle.loadString(
        'assets/files/countriesList')) as List;
    data = json.decode(leagues);
          var countriesTemp = jsonDecode(countries) as List;
         
          // print(data[2]['country_id']);

          _countiesList = List<Countries>();
          for (int i = 0; i < countriesTemp.length; i++) {
            var hasCountry = _countiesList.where((element) => element.countryId == countriesTemp[i]['country']['data']['id'].toString()).length > 0;
            if(hasCountry){
              continue;
            }
            Countries countries = Countries();

            countries.countryId = countriesTemp[i]['country']['data']['id'].toString();
            try {
              countries.countryName =countriesTemp[i]['country']['data']['name'].toString()+" - "+ countriesArabic.where((o) => o['id'].toString() == countries.countryId).toList()[0]['name'].toString();
            }catch(ex){
              countries.countryName = countriesTemp[i]['country']['data']['name'].toString();

            }
            countries.countryLogoPath =  transnational.where((o) => o['country']['data']['id'].toString() == countries.countryId).toList()[0]['country']['data']['image_path'];
            countries.isExpanded = false;
            print(countries.countryLogoPath);
            // _AnimatedMovies = AllMovies.where((i) => i.isAnimated).toList();
            List<League> leagues = new List<League>();


            var leagueData = data.where((element) =>
            element['country_id'].toString() == countries.countryId).toList();

            for (var league in leagueData) {
              if(leagueData.where((element) => element['id'] == league['id']).toList().length > 1 && leagues.where((element) => element.data['id'] == league['id']).toList().length == 1){
                continue;
              }
              var leagueDTO = new League();
              print("League Id: ");
              // print(this._favoriteLeagues);
              leagueDTO.isFavorite = this._favoriteLeagues
                  .where((element) => element['id'] == league['id'])
                  .toList()
                  .length > 0;
              leagueDTO.data = league;
              leagues.add(leagueDTO);
            }
            countries.data = leagues;
            _countiesList.add(countries);
            update();
            print("Countries");
           // print(_countiesList[0].countryLogoPath);
          }
          if(_searchCountriesList == null) {
            _searchCountriesList = new List<Countries>();
            _searchCountriesList.addAll(_countiesList);
          }

      }
      //print(_countiesList[1].data[1]);






}

class Countries{
  bool isExpanded=false;
  String countryName="";
  String countryLogoPath="";
  String countryId="";
  List<League> data;

  Countries({this.isExpanded,this.data});

}

class League{
  bool isFavorite = false;
  dynamic data;
}