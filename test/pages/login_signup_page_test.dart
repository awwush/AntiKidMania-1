import 'package:anti_kid_mania/main.dart';
import 'file:///F:/IDEs/androidstudioprojects/anti_kid_mania/lib/not_part_of_project/login_signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'file:///F:/IDEs/androidstudioprojects/anti_kid_mania/lib/not_part_of_project/login_signup_page.dart';

//Widget createLoginScreen() => ChangeNotifierProvider(
//      child: MaterialApp(
//        home: LoginSignUpPage(),
//      ),
//    );


const primarySwatch = Colors.green;
const buttonColor = Colors.green;
const appName = 'Login';
const homePageUnverified = false;

final params = {
  'primarySwatch' : primarySwatch,
  'appName': appName,
  'buttonColor' :buttonColor,
  'homePageUnverified' : homePageUnverified
};

void main() {
  group('Testing login page widgets', () {
    testWidgets('Testing if primary button shows up', (tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('Login'), findsNWidgets(2));
    });

    testWidgets('Clicking button', (tester) async{
      await tester.pumpWidget(MyApp());

      expect(find.text('Create an account'), findsOneWidget);
      print("found");
      await tester.tap(find.text("Create an account"));
      print("After tap");
      await tester.pump();
      expect(find.text('Forgot password?'), findsOneWidget);
//    It's not going to next page, we need to add navigator observer
    });
  });
}
