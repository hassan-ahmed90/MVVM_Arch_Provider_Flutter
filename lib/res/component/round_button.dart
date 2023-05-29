import 'package:flutter/material.dart';
import 'package:untitled3/res/colors.dart';
class RoundButton extends StatelessWidget {

  final String title;
  final VoidCallback onPress;
  final bool loading;
  const RoundButton({Key? key, required this.title,this.loading=false,required this.onPress}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child:Center(child: loading ?CircularProgressIndicator() : Text("LOGIN",style: TextStyle(color: AppColors.whiteColor),),)
      ),
    );
  }
}
