import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/networkManager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Api extends GetxController implements LoaderState {
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

  ///////Club Page///////////////////
  getTeams() async {
    Map<String, dynamic> params = {
      "id": '1',
    };

    NetworkManager.get(
            url:
                '`https://soccer.sportmonks.com/api/v2.0/teams/${params['id']}?api_token=djQl5NtCDphBbqcBXX5VbVplKYOlEt8rqjvOZ9374YQXuVgyhD6doaFtAdtg&include=country',
            isFormData: true)
        .then((response) async {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        print(decodedJSON['data']);
        var result = decodedJSON['data'];
        // _faqList= result.map<FAQList>((json) => FAQList.fromJson(json)).toList();

      } else {
        showToast(decodedJSON['responseException']['exceptionMessage']);
      }
    }, onError: (error) {
      setSate(ViewState.Idle);
      showToast('Something went wrong');
    });
  }

  getplayerdetails(String seasonid, String teamid) async {
    NetworkManager.get(
            url:
                'https://soccer.sportmonks.com/api/v2.0/squad/season/$seasonid/team/$teamid?api_token=djQl5NtCDphBbqcBXX5VbVplKYOlEt8rqjvOZ9374YQXuVgyhD6doaFtAdtg&include=player',
            isFormData: true)
        .then((response) async {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        print(decodedJSON['data']);
        var result = decodedJSON['data'];
        // _faqList= result.map<FAQList>((json) => FAQList.fromJson(json)).toList();

      } else {
        showToast(decodedJSON['responseException']['exceptionMessage']);
      }
    }, onError: (error) {
      setSate(ViewState.Idle);
      showToast('Something went wrong');
    });
  }

  getcurrentgame(String id) async {
    NetworkManager.get(
            url:
                'https://soccer.sportmonks.com/api/v2.0/fixtures/between/${DateFormat('yyyy-MM-dd').format(DateTime.now())}/${DateFormat('yyyy-MM-dd').format(DateTime.now())}/$id?api_token=djQl5NtCDphBbqcBXX5VbVplKYOlEt8rqjvOZ9374YQXuVgyhD6doaFtAdtg&include=localTeam,visitorTeam,league,venue&tz=' +
                    TZ.kuwaitTimeZone,
            isFormData: true)
        .then((response) async {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        print(decodedJSON['data']);
        var result = decodedJSON['data'];
        // _faqList= result.map<FAQList>((json) => FAQList.fromJson(json)).toList();

      } else {
        showToast(decodedJSON['responseException']['exceptionMessage']);
      }
    }, onError: (error) {
      setSate(ViewState.Idle);
      showToast('Something went wrong');
    });

    NetworkManager.get(
            url:
                'https://soccer.sportmonks.com/api/v2.0/fixtures/between/${DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration.hoursPerDay.days))}/${DateFormat('yyyy-MM-dd').format(DateTime.now())}/$id?api_token=djQl5NtCDphBbqcBXX5VbVplKYOlEt8rqjvOZ9374YQXuVgyhD6doaFtAdtg&include=localTeam,visitorTeam,league&tz=${TZ.kuwaitTimeZone}',
            isFormData: true)
        .then((response) async {
      setSate(ViewState.Idle);
      Map<String, dynamic> decodedJSON = jsonDecode(response);
      if (decodedJSON.containsKey('data')) {
        print(decodedJSON['data']);
        var result = decodedJSON['data'];
        // _faqList= result.map<FAQList>((json) => FAQList.fromJson(json)).toList();

      } else {
        showToast(decodedJSON['responseException']['exceptionMessage']);
      }
    }, onError: (error) {
      setSate(ViewState.Idle);
      showToast('Something went wrong');
    });
  }
}
