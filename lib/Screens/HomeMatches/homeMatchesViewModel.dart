
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:get/get.dart';

class HomeMatchesViewModel extends GetxController implements LoaderState{

  bool _isTabSelected_1 = false;
  bool _isTabSelected_2 = false;
  bool _isTabSelected_3 = true;
  bool _isTabSelected_4 = false;


  bool _isExpanded_1 = true;
  bool _isExpanded_2 = false;

  bool get isTabSelected_1=>_isTabSelected_1;
  bool get isTabSelected_2=>_isTabSelected_2;
  bool get isTabSelected_3=>_isTabSelected_3;
  bool get isTabSelected_4=>_isTabSelected_4;

  bool get isExpanded_1=>_isExpanded_1;
  bool get isExpanded_2=>_isExpanded_2;
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

  onTab1Changed(){
    _isTabSelected_1 = true;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    update();

  }
  onTab2Changed(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = true;
    _isTabSelected_3 = false;
    _isTabSelected_4 = false;
    update();

  }
  onTab3Changed(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = true;
    _isTabSelected_4 = false;
    update();

  }
  onTab4Changed(){
    _isTabSelected_1 = false;
    _isTabSelected_2 = false;
    _isTabSelected_3 = false;
    _isTabSelected_4 = true;
    update();

  }

  onTeamDetailsExpansionChanged(){

    if(_isExpanded_1==false) {
      _isExpanded_1 = true;
    }
    else if(_isExpanded_1==true) {
      _isExpanded_1=false;
    }

    update();
  }
  onPlayersExpansionChanged(){
    if(_isExpanded_2==false) {
      _isExpanded_2 = true;
    }
    else if(_isExpanded_2==true) {
      _isExpanded_2=false;
    }
    update();
  }

}