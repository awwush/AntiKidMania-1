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
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
    super.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color : Colors.greenAccent,
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20,
                    child: TextFormField(
                      maxLength: 1,
                      autofocus: true,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 24, color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: otpFieldVertical,
                              horizontal: otpFieldHorizontal,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kTextColor)
                          )
                      ),
                      onChanged: (value) {
                        //also need to store value
                        nextField(value, pin2FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: TextFormField(
                      focusNode: pin2FocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: otpFieldVertical,
                            horizontal: otpFieldHorizontal,),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kTextColor)
                          )
                      ),
                      onChanged: (value) {
                        nextField( value, pin3FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: TextFormField(
                      focusNode: pin3FocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: otpFieldVertical,
                            horizontal: otpFieldHorizontal,),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kTextColor)
                          )
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: TextFormField(
                      focusNode: pin4FocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: otpFieldVertical,
                            horizontal: otpFieldHorizontal,),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kTextColor)
                          )
                      ),
                      onChanged: (value) {
                        nextField( value,  pin4FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: TextFormField(
                      focusNode: pin5FocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: otpFieldVertical,
                            horizontal: otpFieldHorizontal,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kTextColor)
                          )
                      ),
                      onChanged: (value) {
                        nextField( value,  pin5FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: TextFormField(
                      focusNode: pin6FocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: otpFieldVertical,
                            horizontal: otpFieldHorizontal,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kTextColor)
                          )
                      ),
                      onChanged: (value) {
                        pin6FocusNode.unfocus();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                   // DefaultButton

                ],
              ),
            ),
            DefaultButton(
              text: "Continue",
              press: () {},
            )
          ],
        ),
      ),
    );
  return Card(
    child: Center(
      child: Form(
        child: Row(
          children: [
          SizedBox(
          width: 20,
          height: 20,
          child: TextFormField(
            autofocus: true,
            obscureText: true,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kTextColor)
                )
            ),
            onChanged: (value) {
              //also need to store value
              nextField(value, pin2FocusNode);
            },
          ),
        ),
      ],
      ),
    ),
    ),
  );
  }
}
