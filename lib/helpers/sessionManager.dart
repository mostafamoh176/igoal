
import 'package:shared_preferences/shared_preferences.dart';
import 'importFiles.dart';

import 'dart:convert';

class SessionKeys {
  static String favouriteLeague = 'favouriteLeague';
  static String favouriteNews="favouriteNews";
  static String firebaseTokken="fireBaseToken";
  static String matchesExpansion="MatchesExpandedItem";
  static String themeMode="ThemeMode";

}

class SessionManager {


  List<dynamic> tempFavourite=List<dynamic>();

  List<dynamic> tempNewsFavourite=List<dynamic>();
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  SessionManager._internal();

  getBy(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  set(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  containKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  saveFavouriteLeague(List<dynamic> data,) async{
    // List favourite=await getFavourite();
    // print('favourite');
    // favourite.add(data);

      await set(SessionKeys.favouriteLeague, data);

  }

  saveNewsLeague(List<dynamic> data,) async{
    // List favourite=await getFavourite();
    // print('favourite');
    // favourite.add(data);

    await set(SessionKeys.favouriteNews, data);

  }

  saveThemeMode(String themeData)async{
    //print(themeData);
    await set(SessionKeys.themeMode, themeData);

  }

  saveCollpasedMatchesItem(List<dynamic> data) async{

    await set(SessionKeys.matchesExpansion,data);
  }

  getThemeData()async{
   //  var isContain=await getBy(SessionKeys.themeMode);
   //  String theme;
   // // if(isContain){
   //    var decodedJSON= await getBy(SessionKeys.themeMode);
   //    theme=decodedJSON;
   //    return theme;
   // // }
    //return;
  }



  List<dynamic> tempCollapsed=[];
  Future<List<dynamic>> getCollpasedMatchItem()async{
    tempCollapsed=[];
    var isContain= await containKey(SessionKeys.matchesExpansion);

    if(isContain){
      var decodedJSON=await getBy(SessionKeys.matchesExpansion);
      tempCollapsed.add(decodedJSON);
      return tempCollapsed;
    }
    else{
      return List<dynamic>();
    }

  }


   Future<List<dynamic>> getFavourite()async{
     tempFavourite=List<dynamic>();
    var isContain= await containKey(SessionKeys.favouriteLeague);
    //print("Does contains key: ");
   print(isContain);
    if(isContain){
       var decodedJSON=await getBy(SessionKeys.favouriteLeague);
      print("Decoded Json");
       //print(decodedJSON);
        tempFavourite.add(decodedJSON);
      //print(tempFavourite);
     return tempFavourite;
    }
    else {
      return List<dynamic>();
    }
  }



  Future<List<dynamic>> getFavouriteNews()async{
    tempFavourite=List<dynamic>();
    var isContain= await containKey(SessionKeys.favouriteNews);
    //print("Does contains key: ");
    // print(isContain);
    if(isContain){
      var decodedJSON=await getBy(SessionKeys.favouriteNews);
      // print("Decoded Json");
      //print(decodedJSON);
      tempFavourite.add(decodedJSON);
      //print(tempFavourite);
      return tempFavourite;
    }
    else {
      return List<dynamic>();
    }
  }




  // Future<User> get loginUser async {
  //   if(await containKey(SessionKeys.loginUser)){
  //   return User.fromJson(await read(SessionKeys.loginUser));
  //   }else{
  //   return null;
  //   }
  // }
}
