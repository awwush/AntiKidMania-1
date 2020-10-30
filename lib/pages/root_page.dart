import 'package:anti_kid_mania/pages/home_page.dart';
import 'package:anti_kid_mania/pages/login_signup_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  RootPage({this.params});

  final Map params;


  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

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
    const bool showLoginPage = true;

    switch(showLoginPage) {
      case true:
        return new LoginSignUpPage(params: widget.params);
        break;
      case false:
        return new HomePage(params: widget.params);
        break;
      default:
        return _waitingScreen();
    }
  }
}
