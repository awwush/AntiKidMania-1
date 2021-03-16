import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {

  ForgotPassword({this.params});
  final Map params;

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
//    var params = widget.params;
    return Container(
      color: widget.params['buttonColor'],
    );
  }
}

