import 'package:covid_19_dashboard/screens/bottom_nav_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 Dashboard UI',
      theme: ThemeData(
       primarySwatch: Colors.blue,
       scaffoldBackgroundColor: Colors.white,
       visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavScreen(),
    );
  }
}
