
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionViewModel extends GetxController implements LoaderState{


  bool _isExpanded=false;
  bool get isExpanded=>_isExpanded;

  dynamic _newsDetail;
  dynamic get newsDetail=>_newsDetail;

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

  DescriptionViewModel({dynamic newsDetail}){
    _newsDetail=newsDetail;
    //print(_newsDetail['newstitle']);
    update();
  }



  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}