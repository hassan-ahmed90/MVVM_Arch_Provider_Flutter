
import 'package:flutter/material.dart';
import 'package:untitled3/utils/Routes/routes_name.dart';
import 'package:untitled3/view/login_view.dart';
import 'package:untitled3/view/signup_view.dart';
import '../../view/home_screen.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case  RoutesName.home:
        return MaterialPageRoute(builder: (context)=>HomeScreen());

      case  RoutesName.login:
        return MaterialPageRoute(builder: (context)=>LoginView());

      case  RoutesName.signUp:
        return MaterialPageRoute(builder: (context)=>SignupView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text(
                'No Routes Defined'
              ),
            ),
          );
        });
    }

  }
}