import 'package:flutter/material.dart';
import 'package:anti_kid_mania/sizeConfig.dart';
import 'package:anti_kid_mania/Constants.dart';
import 'package:anti_kid_mania/defaultButton.dart';

class OtpForm extends StatefulWidget {

  const OtpForm({
    Key key,
  }) : super(key: key);


  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final pin1FocusNode = FocusNode();
  final pin2FocusNode = FocusNode();
  final pin3FocusNode = FocusNode();
  final pin4FocusNode = FocusNode();
  final pin5FocusNode = FocusNode();
  final pin6FocusNode = FocusNode();
  FocusNode currentFocusNode;

  @override
  void initState() {
  currentFocusNode = FocusNode();
  super.initState();
  }
  @override
  void dispose() {
    super.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode){
          focusNode.requestFocus();
          print("in focus node");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color : Colors.white54,
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 30,
                        child: otpField(pin1FocusNode, pin1FocusNode, pin2FocusNode)
                      ),
                      SizedBox(
                        width: 30,
                        child: otpField(pin1FocusNode, pin2FocusNode, pin3FocusNode),
                      ),
                      SizedBox(
                        width: 30,
                        child: otpField(pin2FocusNode, pin3FocusNode, pin4FocusNode),
                      ),
                      SizedBox(
                        width:30,
                        child: otpField(pin3FocusNode, pin4FocusNode, pin5FocusNode),
                      ),
                      SizedBox(
                        width: 30,
                        child: otpField(pin4FocusNode, pin5FocusNode, pin6FocusNode),
                      ),
                      SizedBox(
                        width: 30,
                        child: otpField(pin5FocusNode, pin6FocusNode, pin6FocusNode),
                      ),
                    ],
                  ),
                ),
                DefaultButton(
                  text: "Verify",
                  press: () {},
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        buildTimer(),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            debugPrint("tapped resend otp");
          },
          child: Text("Resend OTP ",
            style: new TextStyle
              (fontWeight: FontWeight.normal,
                fontFamily: 'Arial',
                decoration: TextDecoration.none,
                fontSize: 15.0,
                color: Colors.white),
          ),
        ),
      ],
    );
  }


  Widget otpField(FocusNode previousFocusNode, FocusNode currentFocusNode,FocusNode nextFocusNode){
    return TextField(
      autofocus: true,
      maxLength: 1,
      focusNode: currentFocusNode,
      // obscureText: true,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white, fontSize: 18),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        counterText: "",
          contentPadding: EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 2,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.teal)
          )
      ),
      onChanged: (value) {
        if(value.length == 1) {
          setState(() {
            currentFocusNode.unfocus();
            nextFocusNode.requestFocus();
            debugPrint(value);
          });
          }
        else if (value.length == 0){
          setState(() {
            currentFocusNode.unfocus();
            previousFocusNode.requestFocus();
            debugPrint(value);
          });
        }
          },
    );
  }


  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text("You can resend otp in: ",
          style: TextStyle(fontWeight: FontWeight.normal,
              color: Colors.redAccent,
              fontFamily: 'Hind',
              decoration: TextDecoration.none,
              fontSize: 13.0
          ),
        ),
        TweenAnimationBuilder(tween:
        Tween(begin: 50.0, end: 0),
          duration: Duration(seconds: 50),
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
