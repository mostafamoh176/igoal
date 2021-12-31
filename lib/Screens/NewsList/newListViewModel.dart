import 'package:app_igoal/helpers/sessionManager.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot, FirebaseFirestore, Firestore, QuerySnapshot;

class NewsListViewModel extends GetxController implements LoaderState{
  bool _isTabSelected_1 = true;
  bool _isTabSelected_2 = false;
  bool get isTabSelected_1=>_isTabSelected_1;
  bool get isTabSelected_2=>_isTabSelected_2;
  final databaseReference = FirebaseFirestore.instance;
  List<DocumentSnapshot> _newsList;
  List<DocumentSnapshot> get newsList=>_newsList;
  List<DocumentSnapshot> _myNewsList;
  List<DocumentSnapshot> get myNewsList=>_myNewsList;
  List<DocumentSnapshot> _myArticlesList;
  List<DocumentSnapshot> get myArticlesList=>_myArticlesList;
  List<dynamic> _favNewsList= new List<dynamic>();
  List<dynamic> get favNewsList=>_favNewsList;
  List<int> _favId=List<int>();
  List<int> get favId=>_favId;

  SessionManager _sessionManager=SessionManager();

  NewsListViewModel(){
    getNewsList();
    getFavouriteNewsId();
    if(_favId.isNotEmpty) getFavouriteNewsList();
  }

  ViewState _state;

  @override
  ViewState get viewState => _state;

  @override
  void setSate(ViewState state) {
    _state = state;
    update();
  }

  getFavouriteNewsId() async{
    _favNewsList = new List<dynamic>();
    _favId = new List<int>();
    var data = await _sessionManager.getFavouriteNews();
    if(data.isNotEmpty) {
      _favNewsList = data[0];
      for(int i=0;i<_favNewsList.length;i++){
        _favId.add(_favNewsList[i]['id']);
        update();
      }
      update();
    }
    getFavouriteNewsList();
  }

  onTab1Selected()async{
    _isTabSelected_1=true;
    _isTabSelected_2=false;
    if(_myNewsList!=null)getFavouriteNewsId();
    update();
  }
  onTab2Selected() async {
    _isTabSelected_1=false;
    _isTabSelected_2=true;
    update();
  }

  getNewsList(){
    _newsList = new List<DocumentSnapshot>();
    databaseReference
        .collection("IgoalNews").where('newsid', isEqualTo: '1')
        .orderBy('newsdate',descending:true).limit(20)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) => _newsList.add(f));
      setSate(ViewState.Idle);
      update();
    });
  }
  getFavouriteNewsList(){
    if(_favId.isNotEmpty) {
      _myNewsList = new List<DocumentSnapshot>();
      databaseReference
          .collection("IgoalNews").where('teadmid', whereIn: _favId)
          .where('newsid', isEqualTo: '1').orderBy('newsdate', descending: true).limit(10)
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((f) => _myNewsList.add(f));
        setSate(ViewState.Idle);
        update();
      });
    }
  }

}