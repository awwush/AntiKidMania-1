
import 'package:flutter/cupertino.dart';

class VerificationCode extends StatefulWidget {
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  @override
  Widget build(BuildContext context) {
    //WILL POP SCOPE DISABLES BACK BUTTON
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {},
      child: Container(
        height: 50,
        child: Text("VERIFICATION"),
      //  TODO: ADD UI TO ENTER A SIX DIGIT OTP, ADD OPTION OF RESEND CODE TOO.
      ),
    );
  }
}
