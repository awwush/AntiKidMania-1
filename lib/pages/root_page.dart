import 'package:anti_kid_mania/pages/dashboard/subjects.dart';
import 'package:anti_kid_mania/pages/home_page.dart';
import 'package:anti_kid_mania/pages/login_signup_page.dart';
import 'package:anti_kid_mania/pages/storage/secure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RootPage extends StatefulWidget {
  RootPage({this.params});

  final Map params;


  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final SecureStorage secureStorage = SecureStorage();
  var showLoginPage = true;


  @override
  void initState() {
    print("here in init state");
    secureStorage.verify("logged_in").then((value) => {
      if(value == true){
        showLoginPage = false}
    });

    super.initState();
    // ignore: unrelated_type_equality_checks
    setState(() {

    });

  }
  Widget _waitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {


    switch(showLoginPage) {
      case true:
        return new LoginSignUpPage(params: widget.params);
        break;
      case false:
        return new Dashboard();
        break;
      default:
        return _waitingScreen();
    }
  }

}
