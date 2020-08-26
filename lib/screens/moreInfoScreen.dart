import 'package:flutter/material.dart';

class MoreInfoScreen extends StatefulWidget {
  @override
  _MoreInfoScreenState createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
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
              color: Colors.blue,
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
