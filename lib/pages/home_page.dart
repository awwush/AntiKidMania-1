import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.params}) : super(key: key);

  final Map params;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget _mainScreen(){
    return Center(
      child: Text("Welcome",
      style: TextStyle(
          fontSize: 20.0,
          color: Colors.orange
      ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.params['appName']),
//        title: Text("MyApp"),
        actions: <Widget>[
          new FlatButton(
              onPressed: () { print(widget.params);},
              child: new Text("Logout",
                style: TextStyle(
                  fontSize: 17.0,
//                    color: widget.params['buttonColor']
                color: Colors.white,
                ),
              )
          )
        ],
      ),
      body: _mainScreen(),
    );
  }
}
