
import 'package:anti_kid_mania/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _signInKey = new GlobalKey<FormState>();
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
                      key: _signInKey,
                      child: Column(children: [
                        _logo(),
                        _registerText(),
                        SizedBox(height: 20),
                        _email(),
                        SizedBox(height: 15),
                        _Password(),
                        SizedBox(height: 70),
                        _submitDetails(),
                        SizedBox(height: 70),
                        Center(
                          child: Text("Don't have an Account ?"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              print("Register clicked login");
                              widget.toggleView();
                            },
                            child: Text("Register"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shadowColor: Colors.red,
                              elevation: 5,
                            ),
                        ),
                      ],
                    ),
                  )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
     return Padding(
       padding: EdgeInsets.all(5.0),
       child: Center(
            child: Image(
              width: 90.0,
              image: AssetImage('assets/images/logo_login.png'),
            )
    ),
     );
  }

  Widget _registerText() {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0 ),


        child: Text(
          "Welcome back!",
          style: Theme.of(context).textTheme.headline4,

       ),
     ),
    );
  }


  Widget _email() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.70,
      height: deviceHeight * 0.10,
      decoration: myBoxDecoration(),

      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          decoration: new InputDecoration(
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
      ),

    );
  }

  Widget _Password() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.70,
      height: deviceHeight * 0.10,
      decoration: myBoxDecoration(),

      child: Padding(
        padding: const EdgeInsets.all(4.0),
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
            print("password signin validation");
            if (value.length < 6){
              return "Password should be atleast 6 characters";
            }
            if(!value.contains("[@#\$!_*]+")){
              return "Should contain a special character";
            }
            return null;
            // TODO: check limit of characters and combination
          },
        ),
      ),


    );
  }
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
      width: 2,
      color: Colors.blue,


    ),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0)
      ),
    );
  }

  Widget _submitDetails() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: deviceWidth * 0.70,
        height: deviceHeight * 0.10,

        child: ElevatedButton(
          child: Text("Login"),
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            onPrimary: Colors.white,
            shadowColor: Colors.red,
            elevation: 5,
          ),

          onPressed: () async {
            //change not
            if (!_signInKey.currentState.validate()){
              await Provider.of<Authorize>(context, listen: false).SignIn("Foo", "bar");
            }
            else{
              SnackBar(content: Text("Please fill the details."));
            }

          },
        ),
      ),
    );
  }
}
