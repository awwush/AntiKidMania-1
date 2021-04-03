import 'package:flutter/material.dart';
import 'package:anti_kid_mania/sizeConfig.dart';
import 'package:anti_kid_mania/Constants.dart';
import 'package:anti_kid_mania/screens/otpForm.dart';

class VerificationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("OTP Verification", style: headingStyle),
              Text("We have sent OTP to your registered e-mail id"),
              buildTimer(),
              SizedBox(height: 20),
              OtpForm(),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // resend your otp
                },

                child: Text("Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),


            ],
          ),
        )
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text("This code will expire in "),
        TweenAnimationBuilder(tween:
        Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) =>
              Text(
                "00:${value.toInt()}",
                style: TextStyle(color: kPrimaryColor),

              ),
          onEnd: () {},
        )
      ],
    );
  }
}

