import 'package:untitled3/data/network/baseApiServices.dart';
import 'package:untitled3/data/network/networkApiServices.dart';
import 'package:untitled3/res/app_Url.dart';

class AuthRepository{
 BaseApiServices _apiServices = NetworkApiServices();
 Future<dynamic> loginApi(dynamic data)async{
   try{
     dynamic response = await _apiServices.getPostApiServices(AppUrl.loginUrl, data);
     return response;
   }catch(e){
     throw e;
   }
 }
 Future<dynamic> signUpApi(dynamic data)async{
   try{
     dynamic response = await _apiServices.getPostApiServices(AppUrl.registeUrl, data);
     return response;
   }catch(e){
     throw e;
   }
 }
}