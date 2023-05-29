import 'package:flutter/material.dart';
import 'package:untitled3/res/component/round_button.dart';
import 'package:untitled3/utils/utils.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obscurePassword=  ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  FocusNode emailFocusNode =FocusNode();
  FocusNode passwrordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePassword.dispose();
    emailFocusNode.dispose();
    passwrordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login View"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: emailFocusNode,
              onFieldSubmitted: (value){
                Utils.focusChange(context, emailFocusNode, passwrordFocusNode);
              },
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.email)
              ),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20,),

            ValueListenableBuilder(valueListenable: _obscurePassword, builder:(context,value,child){
              return TextFormField(
                obscureText: _obscurePassword.value,
                focusNode: passwrordFocusNode,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: (){
                          _obscurePassword.value=!_obscurePassword.value; 
                        },
                        child: _obscurePassword.value ? Icon(Icons.visibility_outlined):Icon(Icons.visibility)),
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock,
                    )
                ),
                controller: _passwordController,
                keyboardType: TextInputType.text,
              );
            }),

            SizedBox(height: 40,),

            RoundButton(title: "Login", onPress: (){
              if(_emailController.text.isEmpty){
                Utils.flushBarErrorMessege("Please Enter the email", context);
              }else if(_passwordController.text.isEmpty){
                Utils.flushBarErrorMessege("Plz Enter the Password", context);
              }else if(_passwordController.text.length<6){
                Utils.flushBarErrorMessege("Please 6 digit passwod only", context);
              }else{
                Utils.flushBarErrorMessege("Api hit", context);
              }
            })
          ],
        ),
      ),
    );
  }
}
