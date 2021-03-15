
import 'package:anti_kid_mania/models/userid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
enum Status {unautenticated, authenticated}

class Authorize with ChangeNotifier{

  Status _status = Status.unautenticated;
  Status get status => _status;

  int toStore = 0;
  UserId objUserId;

  // UserId SaveUser(int id){
  //   print("ID:" + id.toString());
  //   toStore = id;
  //   objUserId = UserId(uid : id);
  //   return id != null ? objUserId : null;
  // }

  Future SignIn(String email, String password) async{

    //todo : write signIn backend logic here return an id
    _status = Status.authenticated;
    return true;
  }
}