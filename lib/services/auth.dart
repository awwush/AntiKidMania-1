
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Authorize with ChangeNotifier{

  bool logged_in = false;

  void Register(BuildContext context, String name, String email, String password) async{

    // todo : write s backend logic

    var dio = new Dio();
    try{
      var response = await dio.post(
          "https://server-for-app-ranjit1.herokuapp.com/register",
          data: {
            'name': name,
            'email': email,
            'password': password,
          },
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      var map=Map<String, dynamic>.from(response.data);
      if(map.containsKey("err")){
        //  TODO: SHOW snackbar already registered, show the err message
        final snackBar = SnackBar(content: Text("Already registered!"));
        Scaffold.of(context).showSnackBar(snackBar);
        print("Key error, email id already exists");
        return ;
      }
      else{
        //  TODO: show snackbar registered successflully
        logged_in = true;
        notifyListeners();
      }

    }
    catch(e){
      //  TODO: SOMETHING WRONG HOW A MESSAGE AND SAY TRY LATER
    }

  }

  void SignIn(String email, String password) async{

    // todo : write signIn backend logic


    logged_in = true;
    notifyListeners();
  }

  void SignOut(){

    // todo: Logout the user

    logged_in = false;
    notifyListeners();
  //  dummy
  }
}