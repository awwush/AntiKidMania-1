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
                    buildTimer(),
                    SizedBox(height: 20),
                    OtpForm(),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // resend your otp
                      },

                      child: Text("Resend OTP ",
                        style: new TextStyle(fontWeight: FontWeight.normal, fontFamily: 'Arial', decoration: TextDecoration.none, fontSize: 15.0, color: Colors.white),
                      ),
                    ),

                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text("This code will expire in ", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.redAccent, fontFamily: 'Hind', decoration: TextDecoration.none, fontSize: 13.0),),
        TweenAnimationBuilder(tween:
        Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) =>
              Text(
                "00:${value.toInt()}",
                style: TextStyle(decoration: TextDecoration.none, color: kPrimaryColor, fontSize: 10.0),

              ),
          onEnd: () {},
        )
      ],
    );
  }
}

