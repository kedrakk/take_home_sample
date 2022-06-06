import 'package:flutter/material.dart';
import 'package:take_home/const/theme.dart';
import 'package:take_home/pages/home.dart';
import 'package:take_home/pages/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Take Home Sample App',
      theme: MainTheme.lightTheme,
      initialRoute: "loginScreen",
      routes: {
        "loginScreen": (context) => const LoginPage(),
        "homeScreen": (context) => const HomePage(),
      },
    );
  }
}
