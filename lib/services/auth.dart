
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


class Authorize with ChangeNotifier{

  bool logged_in = false;

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