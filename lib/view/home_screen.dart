import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/utils/Routes/routes_name.dart';
import 'package:untitled3/view/user_view_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            userPref.remove().then((value) {
              Navigator.pushNamed(context, RoutesName.login);
            });
          },
          child: Text("LOGOUT"),
        ),
      )
    );
  }
}
