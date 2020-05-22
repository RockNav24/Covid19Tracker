import 'package:covidtracker/const.dart';
import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/moreInfoScreen.dart';
import 'screens/myCountryScreen.dart';
import 'screens/bottomNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: BottomNavigation(),
      routes: {
        'home/': (context) => HomeScreen(),
        'moreInfo/': (context) => MoreInfoScreen(),
        'myCountry/': (context) => MyCountryScreen(),
      },
    );
  }
}
