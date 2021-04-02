
import 'package:anti_kid_mania/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatefulWidget {

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider<Authorize>(
        create: (context) => Authorize(),
        child: MaterialApp(
          home: Consumer<Authorize>(
            builder: (context, Authorize, child) {

              print("Builder Wrapper: " + Authorize.loggedIn.toString());
              return Authorize.loggedIn ? Home() : Authenticate();
            },
          ),
        ),
      );
  }
}
