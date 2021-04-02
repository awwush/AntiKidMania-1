
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Authorize with ChangeNotifier{

  bool loggedIn = false;
  bool verificationCodeSent = false;
  bool verificationStatus = false;

  Future<String> Register(String name, String email, String password, int verificationCode) async{

    // todo : write s backend logic

    print("In register function");
    var dio = new Dio();

      print("In register function sending post request" + verificationCode.toString());
      var response = await dio.post(
          "https://server-for-app-ranjit1.herokuapp.com/register",
          data: {
            'name': name,
            'email': email,
            'password': password,
            'verificationCode': verificationCode.toString(),
          },
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      var map=Map<String, dynamic>.from(response.data);
      print("Register function " + response.data.toString());
      if(map.containsKey("err")){
        print(map["err"]);
        return "already exists";
      }
      else{
        print("Verification code sent");
        loggedIn = false;
        verificationCodeSent = true;
        return "Verification Page";
        // notifyListeners();
      }
  }

  void SignIn(String email, String password) async{

    print("In sign in  function");
    var dio = new Dio();

    var response = await dio.post(
        "https://server-for-app-ranjit1.herokuapp.com/login",
        data: {
          'email': email,
          'password': password,
        },
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));

    var map=Map<String, dynamic>.from(response.data);
    print("sign in function ");
    if(map.containsKey("err")){
      print(map["err"]);
    }
    else{
      print(" Logged in successful");
      loggedIn = true;
      notifyListeners();
    }
  }

  void SignOut(){

    // todo: Logout the user

    loggedIn = false;
    notifyListeners();
  //  dummy
  }
}