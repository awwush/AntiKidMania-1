import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:anti_kid_mania/sizeConfig.dart';
import 'package:anti_kid_mania/Constants.dart';
import 'package:anti_kid_mania/screens/otpForm.dart';

class VerificationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      

      // ignore: missing_return
      onWillPop: () {},


      child: Container(

        color: Colors.blueGrey[900],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Text("OTP Verification",
                      style: new TextStyle(fontFamily: 'RobotoMono', decoration: TextDecoration.none, fontSize: 32.0, color: Colors.white54, fontWeight: FontWeight.bold),
                        ),
                    SizedBox(height: 40),

                    Text("We have sent an OTP to your registered e-mail id", textAlign: TextAlign.center,
                      style: new TextStyle(fontFamily: 'Roboto', decoration: TextDecoration.none,fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: 20),
                    OtpForm(),
                    SizedBox(height: 20),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}

