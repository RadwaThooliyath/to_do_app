import 'package:flutter/material.dart';
import 'package:to_do_app/screens/categoryPage.dart';
import 'package:to_do_app/screens/loginPage.dart';
import 'package:to_do_app/screens/settingsPage.dart';
import 'package:to_do_app/screens/sports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Loginpage(),debugShowCheckedModeBanner: false,
    );
  }
}
