
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:get/get.dart';

class LiveMatchesViewModel extends GetxController implements LoaderState{

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
}
