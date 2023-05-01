import 'package:calculator/cal_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:CalScreen.routename ,
      routes: {
        CalScreen.routename:(context)=>CalScreen(),

      },
    );
  }

}