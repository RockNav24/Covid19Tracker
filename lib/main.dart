import 'package:covidtracker/const.dart';
import 'package:covidtracker/screens/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/moreInfoScreen.dart';
import 'screens/myCountryScreen.dart';
import 'screens/moreDetailedScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: 'loading',
      routes: {
        'loading': (context) => LoadingScreen(),
        'home': (context) => HomeScreen(),
        'moreInfo': (context) => MoreInfoScreen(),
        'myCountry': (context) => MyCountryScreen(),
        'moreDetailed': (context) => MoreDetailedScreen(),
      },
    );
  }
}
