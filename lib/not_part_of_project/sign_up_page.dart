import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'file:///F:/IDEs/androidstudioprojects/anti_kid_mania/lib/not_part_of_project/storage/secure.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpKey = new GlobalKey<FormState>();
  final _scaffoldGlobalKey = new GlobalKey<ScaffoldState>();
  // final _storage = FlutterSecureStorage();

  final SecureStorage secureStorage = SecureStorage();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _schoolController = TextEditingController();
  final _standardController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldGlobalKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: TextSpan(
//                      style: Theme.of(context).textTheme.bodyText2,
                        children: [
                          WidgetSpan(child: Icon(Icons.arrow_back)),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    )
//                  Text(" Back to Login")
                    ),
              ),
            ),
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
                        _showAge(),
                        _showStandard(),
                        _showSchool(),
                        _firstPassword(),
                        SizedBox(height: 20),
                        _submitDetails(),
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
          "/ Registration details \\",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }

  Widget _showName() {
    return Padding(
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
          validator: (value) {

          }),
    );
  }

  Widget _showAge() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _ageController,
        keyboardType: TextInputType.datetime,
        maxLines: 1,
        decoration: new InputDecoration(
//          just trying, of no use
//          fillColor: Colors.orange,
          labelText: "Age",
          hintText: "Enter your age",
          icon: Icon(
            Icons.date_range_rounded,
            color: Colors.lightBlue,
          ),
        ),
        validator: (value) {
          // TODO: show age validation
        },
      ),
    );
  }

  Widget _showStandard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _standardController,
        keyboardType: TextInputType.number,
        maxLines: 1,
        decoration: new InputDecoration(
//          just trying, of no use
//          fillColor: Colors.orange,
          labelText: "standard",
          hintText: "1-12",
          icon: Icon(
            Icons.class__rounded,
            color: Colors.lightBlue,
          ),
        ),
        validator: (value) {
          // TODO: show standard validation limit till 12
        },
      ),
    );
  }

  Widget _showSchool() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _schoolController,
        keyboardType: TextInputType.name,
        maxLines: 1,
        decoration: new InputDecoration(
//          just trying, of no use
//          fillColor: Colors.orange,
          labelText: "School Name",
          hintText: "DAV Pulic School",
          icon: Icon(
            Icons.school,
            color: Colors.lightBlue,
          ),
        ),
        validator: (value) {
          // TODO: show standard validation limit till 12
        },
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

  Widget _firstPassword() {
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

  //TODO: ADD CONFIRM PASSWORD, COMPARE FIRST AND CONFIRM PASSWORD

  Widget _submitDetails() {
    return Center(
      child: ElevatedButton(
        child: Text("Register me"),
        onPressed: () async {

          if (_signUpKey.currentState.validate()) {
            //Gives true or false
            print(_signUpKey.currentState.validate());
            bool alreadyRegistered = false;

            // checking if already registered
            await FirebaseFirestore.instance
                .collection('Registration')
                .doc(_emailController.text)
                .get()
                .then((alreadyPresentEmail) => {
                      if (alreadyPresentEmail.exists) {alreadyRegistered = true}
                    });


            if (!alreadyRegistered) {
              await FirebaseFirestore.instance
                  .collection('Registration')
                  .doc(_emailController.text)
                  .set({
                "name": _nameController.text,
                "age": _ageController.text,
                "school": _schoolController.text,
                "standard": _standardController.text,
                "email": _emailController.text,
                "password": _passwordController.text,
              });

              // _scaffoldGlobalKey.currentState.showSnackBar(
              //     SnackBar(content: Text("Registering please wait...")));

              //TODO : add the feature of saving the login information
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
//                backgroundColor: Colors.redAccent,
                        title: Text(
                          "Great you registered!",
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(ctx, '/Dashboard');
                              },
                              child: Text("Dashboard")),
//                  ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/ForgotPassword');}, child: Text("Forgot password?")),
                        ],
                      ));


              secureStorage.writeSecureData("logged_in", true);

            } else {
              print("Already registered...");
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
//                backgroundColor: Colors.redAccent,
                        title: Text(
                          "Email is already registered!",
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                _emailController.clear();
                                Navigator.pop(ctx);
                              },
                              child: Text("Change email")),
//                  ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/ForgotPassword');}, child: Text("Forgot password?")),
                        ],
                      ));
            }
          }
          else {
            _scaffoldGlobalKey.currentState.showSnackBar(
            SnackBar(content: Text("Please fill the required fields!")));
          }
//
//        Checking whether fetching is performed or not

//        FirebaseFirestore.instance.collection('Registration').get().then((snapshotValues) => {
//          snapshotValues.docs.forEach((element) {print( element.data());})
//        }
//        );
        },
      ),
    );
  }
}