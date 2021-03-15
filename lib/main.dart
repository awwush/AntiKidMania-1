
import 'package:anti_kid_mania/screens/wrapper.dart';
import 'package:anti_kid_mania/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool authenticate = true;
  //
  // void toggleViewAuth() {
  //   setState(() {
  //     authenticate = !authenticate;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Authorize>(
      create: (context) => Authorize(),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}