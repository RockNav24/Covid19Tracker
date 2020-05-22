import 'package:covidtracker/const.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/custom/reusable.dart';
import 'package:covidtracker/custom/dataRow.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Top row of the table
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Country',
                        style: kTableTitle,
                      ),
                      Text(
                        'Confirmed',
                        style: kTableTitle,
                      ),
                      Text(
                        'Deaths',
                        style: kTableTitle,
                      ),
                      Text(
                        'Risk',
                        style: kTableTitle,
                      ),
                    ],
                  ),
                  DataRowInsert(),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 25,
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[CardSelect(), CardSelect(), CardSelect()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
