
import 'package:anti_kid_mania/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _signUpKey = new GlobalKey<FormState>();
  final _scaffoldGlobalKey = new GlobalKey<ScaffoldState>();
  // final _storage = FlutterSecureStorage();

  // final SecureStorage secureStorage = SecureStorage();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _schoolController = TextEditingController();
  final _standardController = TextEditingController();
  final _passwordController = TextEditingController();
  Authorize _authorize = Authorize();


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
                        _Password(),
                        SizedBox(height: 20),
                        _submitDetails(),
                        SizedBox(height: 20),
                        Center(
                          child: Text("Or"),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              print("Register clicked login");
                              widget.toggleView();
                            },
                            child: Text("Register"),
                        )
                      ]),
                    ),
                  )
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
          "/ Login details \\",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }


  Widget _email() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        maxLines: 1,
        decoration: new InputDecoration(
//          just trying, of no use
//          fillColor: Colors.orange,
          labelText: "email",
          hintText: "abc@efg.com",
          icon: Icon(
            Icons.email,
            color: Colors.lightBlue,
          ),
        ),
        validator: (value) {
          Pattern email = "^[a-zA-Z0-9.a-zA-Z0-9.!#%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
          RegExp regex = new RegExp(email);
          print("here");
          if(regex.hasMatch(value)){
            return null;
          }
          else
            return "Enter the email-id";
//          TODO: Add proper regexp for email..
        },
      ),
    );
  }

  Widget _Password() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        maxLines: 1,
        obscureText: true,
        decoration: new InputDecoration(
//          just trying, of no use
//          fillColor: Colors.orange,
          labelText: "password",
          hintText: "********",
          icon: Icon(
            Icons.security_rounded,
            color: Colors.lightBlue,
          ),
        ),
        validator: (value) {
          print("password: $value");
          // TODO: check limit of characters and combination
        },
      ),
    );
  }

  Widget _submitDetails() {
    return Center(
      child: ElevatedButton(
        child: Text("Login"),
        onPressed: () async {
          await _authorize.SignIn("Foo", "bar");
        },
      ),
    );
  }
}
