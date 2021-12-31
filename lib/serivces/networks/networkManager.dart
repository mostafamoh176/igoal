import 'dart:convert';
import 'dart:io';

import 'package:app_igoal/helpers/constants.dart';
import 'package:http/http.dart' as http;
import 'AppExceptions.dart';


class NetworkManager {

  static final NetworkManager _instance = NetworkManager._internal();
  factory NetworkManager() => _instance;
  NetworkManager._internal();
  
  //static String _baseUrl = EndPoint.baseURL;

  static Future<dynamic> post({String url, bool authorization = false, dynamic body, bool isFormData=false}) async {
    var _header = {'Authorization':'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxMDcxIiwidW5pcXVlX25hbWUiOiIwMzIxNTY4MDkwMSIsInN1YiI6InNoYWR5cmVjb3Jkc0BnbWFpbC5jb20iLCJqdGkiOiJhNzBiZDM5Zi1iNDY3LTRjZTEtODkwMy1jNjQ5Y2EwNmEyN2YiLCJlbWFpbCI6InNoYWR5cmVjb3Jkc0BnbWFpbC5jb20iLCJpZCI6IjEwNzEiLCJuYmYiOjE2MTM5OTU2MzAsImV4cCI6MTYxNDA4MjAzMCwiaWF0IjoxNjEzOTk1NjMwLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdCJ9.WtE9MhyOgUKUJiUND-6h7pUY-0ROlwciFx0njx0npgV27V0cMJgEtv6go4wlLhSfjWGns4nhOQjH7xjOBXXk8g', 'Content-Type': 'application/json'};

    if(isFormData != true){
      body = json.encode(body);
    }

    var responseJson;
    try {

      final response = await http.post(Uri.parse(url), headers: _header, body: body);
      responseJson = _returnResponse(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> get({String url, bool authorization = false, dynamic body, bool isFormData}) async {
    var _header = {'Authorization':'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxMDcwIiwidW5pcXVlX25hbWUiOiIwMzIxNTEwNDc0MSIsInN1YiI6InNoYWR5cmVjb3Jkc2xwOTlAZ21haWwuY29tIiwianRpIjoiYmI0Y2Q3MTYtMTBiMi00ODFlLThiYzktMDhlNTZlYWYzN2U2IiwiZW1haWwiOiJzaGFkeXJlY29yZHNscDk5QGdtYWlsLmNvbSIsImlkIjoiMTA3MCIsIm5iZiI6MTYxMzk5Mzg1MCwiZXhwIjoxNjE0MDgwMjUwLCJpYXQiOjE2MTM5OTM4NTAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3QiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0In0.P01Qv4DAKugDu8lpu7aGIC_A1Qi2gF4M-ejiQlJm8WJtLtE3C6LmlWiMOOr_EDErZYws533KYTcwjZF98lxQnA','Content-Type' : 'text/plain; charset=utf-8'};

    if(isFormData != true){
      body = json.encode(body);
    }

    var responseJson;
    try {
      final response = await http.get( Uri.parse(url), headers: _header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  static Future<dynamic> getDifferentToken({String url, bool authorization = false, dynamic body, bool isFormData}) async {
    var _header = {'Content-Type' : 'text/plain; charset=utf-8'};

    if(isFormData != true){
      body = json.encode(body);
    }

    var responseJson;
    try {
      final response = await http.get( Uri.parse(url), headers: _header);
      print('URL :'+url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }



  /// front_user_id, trip_id, images
 Future<dynamic> uploadFile(File imageFile) async {
    print("1-${DateTime.now().toString()}-${imageFile.path.split('/').last}");
    var postUri = Uri.parse("http://demo.themlmglobal.com/project101/appguide/wizardstep_20");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['front_user_id'] = '195';
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));



    var res = await request.send();
    return res;
  }

}

dynamic _returnResponse2(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
      break;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      return response;
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException('${response.reasonPhrase} with StatusCode : ${response.statusCode}');
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return response.body.toString();
      break;
    case 201:
      return response.body.toString();
      break;
    case 400:
      return response.body.toString();
      break;
      // print(response.body.toString());
      // throw BadRequestException(response.body.toString());
    case 401:
      return response.body.toString();
      break;
//      throw UnauthorisedException(response.body.toString());
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          ' ${response.reasonPhrase} with StatusCode : ${response.statusCode}');
  }
}