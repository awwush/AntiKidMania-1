import 'package:anti_kid_mania/pages/root_page.dart';
import 'package:anti_kid_mania/pages/sign_up_page.dart';
import 'package:anti_kid_mania/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const primarySwatch = Colors.green;
  static const buttonColor = Colors.green;
  static const appName = 'Login';
  static const homePageUnverified = false;

  final params = {
    'primarySwatch' : primarySwatch,
    'appName': appName,
    'buttonColor' :buttonColor,
    'homePageUnverified' : homePageUnverified
  };



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => RootPage(params: params),
        '/SignUp' : (context) => SignUp(),
      },
      title: 'Anti Kid-Mania',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: params['primarySwatch'],
      ),
//      home: new RootPage(params: params),
    );
  }
}

// old style orange, blue shade

//class MyApp extends StatelessWidget {
//
//  final textStyling = TextStyle(color: Colors.grey[200], fontSize: 18);
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Container(
//        width: 10.0,
//        height: 20.0,
//        color: Colors.orange,
//        child: Center(
//          child: Container(
//            decoration: BoxDecoration(
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.lightBlueAccent,
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
//                )
//              ],
//            ),
//            // color: Colors.green,
//            child: SizedBox(
//              width: 250,
//              height: 500,
//              child: Container(
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Column(
//                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                    children: [
//                      Text(
//                        "Choose the one which suits...",
//                        textAlign: TextAlign.center,
//                        style: textStyling,
//                      ),
//                      const SizedBox(height: 120,),
//                      Text("Registered users",
//                      style: textStyling,
//                        ),
//                      const SizedBox(height : 10),
//                      ElevatedButton(
//                        onPressed: () => Navigator.push(
//                          context,
//                         MaterialPageRoute(builder: (context) => SignIn())),
//                        child: Text("Sign in"),
//                      ),
//                      const SizedBox(height : 50),
//                      Text("New users",
//                      style: textStyling,
//                        ),
//                      const SizedBox(height : 10),
//                      ElevatedButton(
//                        onPressed: () => print("Sign up"),
//                        child: Text("Sign up"),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
