import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{


  static double averageRating(List<int> rating){
    var avgRating = 0;
    for(int i = 0 ; i< rating.length ; i++){
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1)) ;
  }
   static void focusChange(BuildContext context,FocusNode current,FocusNode next){
     current.unfocus();
     FocusScope.of(context).requestFocus(next);
   }
  static toastMessege(String messege){
    Fluttertoast.showToast(msg: messege);
  }

  static void flushBarErrorMessege(String messege,BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(

      message: messege,
    backgroundColor: Colors.red,
      margin: EdgeInsets.all(80),
      borderRadius: BorderRadius.circular(15),
    )..show(context));
  }

  static snackBar(BuildContext context,String messege){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(messege))
    );
  }
}