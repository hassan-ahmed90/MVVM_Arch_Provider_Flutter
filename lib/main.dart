import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/utils/Routes/routes.dart';
import 'package:untitled3/utils/Routes/routes_name.dart';
import 'package:untitled3/view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MultiProvider(providers: [
       ChangeNotifierProvider(create: (_)=>AuthViewModel())
      ],
        child :MaterialApp(
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      )
      );


    }
  }
  