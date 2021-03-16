
import 'package:anti_kid_mania/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Classes:"),
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
    );;
  }
}
