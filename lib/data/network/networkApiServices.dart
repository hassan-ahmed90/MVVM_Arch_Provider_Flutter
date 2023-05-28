import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../app_exeption.dart';
import 'baseApiServices.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiServices(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);

    }on SocketException{
      throw FetchDataException("No INternet connection");
    }
    return responseJson;
  }
  @override
  Future getPostApiServices(String url,dynamic data)async {
    dynamic responseJson;
    try{
      http.Response response = await http.post(Uri.parse(url),body:data).timeout(Duration(seconds: 10));
    }on SocketException{

      throw FetchDataException("No Internet Exeption");

    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson= jsonDecode(response.body);
        return responseJson ;
      case 400:
        BadRequestException(response.body.toString());
      default:
         throw FetchDataException(response.body.toString());
    }
  }
}