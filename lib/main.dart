import 'package:flutter/material.dart';
import 'package:untitled3/utils/Routes/routes.dart';
import 'package:untitled3/utils/Routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      );
    }
  }
  