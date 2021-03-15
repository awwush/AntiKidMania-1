

import 'package:anti_kid_mania/models/userid.dart';
import 'package:anti_kid_mania/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatefulWidget {

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  Authorize _authorize;
  UserId objUserId;

  @override
  Widget build(BuildContext context) {

    Authorize status = context.watch<Authorize>();

    // final user = Provider.of<UserId>(context);
    // print("user : wrapper :" + user.toString());
    if(Status.authenticated != null){
      return Home();
    }else{
      return Authenticate();
    }
    // return either home or authenticate
    // return Authenticate();
  }
}
