import 'package:flutter/material.dart';
import 'package:covidtracker/screens/bottomNavigation.dart';

class MyCountryScreen extends StatefulWidget {
  @override
  _MyCountryScreenState createState() => _MyCountryScreenState();
}

class _MyCountryScreenState extends State<MyCountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Tracker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.deepOrange,
              child: Text('value 1'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green,
              child: Text('value 1'),
            ),
          ),
        ],
      ),
    );
  }
}
