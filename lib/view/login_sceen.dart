import 'package:flutter/material.dart';

import '../utils/utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child:
            InkWell(
              onTap: (){
                Utils.toastMessege("Hey Shani");
                Utils.flushBarErrorMessege("Shut Up", context);
              },
              child: Text("Oye Click Kr"),
            ),
          )

        ],
      ),
    );
  }
}
