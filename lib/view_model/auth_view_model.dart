

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/repository/auth_repository.dart';
import 'package:untitled3/utils/Routes/routes_name.dart';
import 'package:untitled3/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  bool _loading = false;
  bool get loading =>_loading;
  setLoading (bool value){
    _loading = value;
    notifyListeners();
  }
  final _myrepo = AuthRepository();
  Future<void> loginApi (dynamic data,BuildContext context)async{
    setLoading(true);
    Utils.flushBarErrorMessege("Login Succesfully", context);
    Navigator.pushNamed(context, RoutesName.home);
    _myrepo.loginApi(data).then((value) {
      setLoading(false);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        print(error.toString());
      }
    });

  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setSignUpLoading(bool value){
    _signUpLoading= value;
    notifyListeners();
  }
  Future<void> signUpApi (dynamic data,BuildContext context)async{
    setSignUpLoading(true);
    Utils.flushBarErrorMessege("SignUp Succesfully", context);
    Navigator.pushNamed(context, RoutesName.home);
    _myrepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if(kDebugMode){
        print(error.toString());
      }
    });

  }
}