import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled3/utils/Routes/routes_name.dart';
import 'package:untitled3/view/user_view_model.dart';

import '../../models/user_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuth(BuildContext context)async{

    getUserData().then((value) {

      if(value.token=='null' || value.token ==''){
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }else{
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }

    }).onError((error, stackTrace) {
         if(kDebugMode){
           print(error.toString());
         }
    });

  }
}