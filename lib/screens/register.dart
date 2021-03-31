import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _signUpKey = new GlobalKey<FormState>();
  final _scaffoldGlobalKey = new GlobalKey<ScaffoldState>();
  // final _storage = FlutterSecureStorage();

  // final SecureStorage secureStorage = SecureStorage();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldGlobalKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: RichText(
//                       text: TextSpan(
// //                      style: Theme.of(context).textTheme.bodyText2,
//                         children: [
//                           WidgetSpan(child: Icon(Icons.arrow_back)),
//                           TextSpan(
//                             text: "Login",
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
// //                  Text(" Back to Login")
//                 ),
//               ),
//             ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Container(
                    child: Form(
                      key: _signUpKey,
                      child: Column(children: [
                        _registerText(),
                        SizedBox(height: 20),
                        _email(),
                        _showName(),
                        _firstPassword(),
                        SizedBox(height: 50),
                        _submitDetails(),
                        SizedBox(height: 160),
                        Center(
                          child: Text("Already have an Account..."),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Register clicked login");
                            widget.toggleView();
                          },
                          child: Text("Sign in"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shadowColor: Colors.red,
                            elevation: 5,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return Center(
      child: Container(
        child: Text(
          "Create An Account",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _showName() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      width: deviceWidth * 0.90,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            maxLines: 1,
            decoration: new InputDecoration(
//          just trying, of no use
//          fillColor: Colors.orange,
              labelText: "Name",
              hintText: "Enter full name",
              icon: Icon(
                Icons.perm_contact_calendar,
                color: Colors.lightBlue,
              ),
            ),
            validator: (value) {}),
      ),
    );
  }

  Widget _email() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.90,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          decoration: new InputDecoration(
//          just trying, of no use
//          fillColor: Colors.orange,
            labelText: "Email",
            hintText: "abc@efg.com",
            icon: Icon(
              Icons.email,
              color: Colors.lightBlue,
            ),
          ),
          validator: (value) {
            Pattern email =
                "^[a-zA-Z0-9.a-zA-Z0-9.!#%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
            RegExp regex = new RegExp(email);
            print("here");
            if (regex.hasMatch(value)) {
              return null;
            } else
              return "Enter the email-id";
//          TODO: Add proper regexp for email..
          },
        ),
      ),
    );
  }

  Widget _firstPassword() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.90,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          maxLines: 1,
          obscureText: true,
          decoration: new InputDecoration(
//          just trying, of no use
//          fillColor: Colors.orange,
            labelText: "Password",
            hintText: "********",
            icon: Icon(
              Icons.security_rounded,
              color: Colors.lightBlue,
            ),
          ),
          validator: (value) {
            print("password sign in validation"+ _passwordController.text);
            if (value.length < 6){
              return "Password should be at least 6 characters";
            }

            //Checking password strength
            Pattern passwordLength = "[@#\$!_*]+";
            RegExp regex = new RegExp(passwordLength);
            print("password length check sign in form");
            if(regex.hasMatch(value)){
              return null;
            }
            else{
              return 'can only contain @, \$, _, #, *, !';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _submitDetails() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: deviceWidth * 0.90,
        height: deviceHeight * 0.10,
        child: ElevatedButton(
          child: Text("Register me"),
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            onPrimary: Colors.white,
            shadowColor: Colors.red,
            elevation: 5,
          ),
          onPressed: () async {
            Response response;
            var dio = new Dio();

            if (_signUpKey.currentState.validate()) {
              // Securing password
              var bytes = utf8.encode(_passwordController.text);
              var digest = sha512.convert(bytes);
              try{
                response = await dio.post(
                    "https://server-for-app-ranjit1.herokuapp.com/register",
                    data: {
                      'name': _nameController.text,
                      'email': _emailController.text,
                      'password': digest.toString(),
                    },
                    options: Options(headers: {
                      HttpHeaders.contentTypeHeader: "application/json",
                    })).then((value) { print(value.runtimeType);});

                print((response.extra));
                print(json.decode(response.data));
              }
              catch(e){

                print("in catch register");
                // print(e);
              }
              // print("You have successfully registered");
            }
          },
        ),
      ),
    );
  }
}
