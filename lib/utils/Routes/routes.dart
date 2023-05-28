
import 'package:flutter/material.dart';
import 'package:untitled3/utils/Routes/routes_name.dart';
import '../../view/home_screen.dart';
import '../../view/login_sceen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case  RoutesName.home:
        return MaterialPageRoute(builder: (context)=>HomeScreen());

      case  RoutesName.login:
        return MaterialPageRoute(builder: (context)=>LoginScreen());
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