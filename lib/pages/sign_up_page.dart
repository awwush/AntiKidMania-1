import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                          WidgetSpan(
                              child: Icon(Icons.arrow_back)
                          ),
                            TextSpan(text: "Login",
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
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),

                  Container(
                    child: Form(
                      key: _signUpKey,
                      child: Column(
                        children: [
                          _registerText(),
                          SizedBox(height: 20),
                          _showName(),
                          _showAge(),
                          _showStandard(),
                          _showSchool(),
                          _email(),
                          SizedBox(height: 20),
                          _submitDetails(),
                        ]
                      ),
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

  Widget _registerText(){
    return Center(
      child: Container(

          child: Text("/ Registration details \\",
          style: Theme.of(context).textTheme.headline5,),
      ),
    );
  }
  Widget _showName(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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
            // TODO: show name validation
          }
      ),
    );
  }


  Widget _showAge(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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


  Widget _showStandard(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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


  Widget _showSchool(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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

  Widget _email(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.email,
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
          // TODO: show standard validation limit till 12
        },
      ),
    );
  }


  Widget _submitDetails(){
    return Center(
      child: ElevatedButton(
        child: Text("Register me"),
        onPressed: () async {
        await Firebase.initializeApp();
        print("initialized");
        Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance.collection("Registration").snapshots();
        print(snapshot);
        },
      ),
    );
  }
}
