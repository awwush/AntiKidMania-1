
import 'package:anti_kid_mania/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _addChild = new GlobalKey<FormState>();
  final _childController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard"),
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async{
              await Provider.of<Authorize>(context, listen : false).SignOut();
            },
            icon: Icon(Icons.person),
            label: Text("Logout"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(children: [
                Text("Add child:", style: Theme.of(context).textTheme.headline6,),
                SizedBox(width: 20,),
                Container(
                  width: 200,
                  child: Form(
                    key: _addChild,
                    child: TextFormField(
                    controller: _childController,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "email",
                        hintText: "child1@gmail.com",
                        // icon: Icon(
                        //   Icons.email,
                        //   color: Colors.red,
                        // ),
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
                      },
                    ),
                  ),
                )
              ]
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  child: Text("Add"),
                  onPressed: (){
                    print("Dashboard add child");
                  },
              ),

              Divider(
                height: 10.0,
                thickness: 3.0,
              ),
              Text("Childrens", style: Theme.of(context).textTheme.headline6,),
              SizedBox(height: 10,),

              Container(
                width: 300,
                height: 200,
                child: ListView(

                  // TODO : DEMO LIST, LATER TO BE FETCHED FROM DB
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.subject),
                      title: Text('Child 1'),
                    ),
                    ListTile(
                      leading: Icon(Icons.subject),
                      title: Text('Child 2'),
                    ),
                    ListTile(
                      leading: Icon(Icons.subject),
                      title: Text('Child 3'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
