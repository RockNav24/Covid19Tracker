import 'package:flutter/material.dart';
import 'package:covidtracker/location.dart';
import 'package:covidtracker/const.dart';
import 'package:covidtracker/covid19Data.dart';

class MyCountryScreen extends StatefulWidget {
  final List data;
  MyCountryScreen({this.data});
  @override
  _MyCountryScreenState createState() => _MyCountryScreenState();
}

class _MyCountryScreenState extends State<MyCountryScreen> {
  Map selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = Location.currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    var recoveryRate =
        selectedCountry['latest_data']['calculated']['recovery_rate'];
    var deathRate = selectedCountry['latest_data']['calculated']['death_rate'];
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCountry['name']),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kTodayCardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text(
                        'Today',
                        style: kTodayCardTitle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              selectedCountry['today'][CovidData.LATEST_DEATHS]
                                  .toString(),
                              style: kTodayCardValue,
                            ),
                            Text(
                              'Deaths',
                              style: kTodayCardLabel,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              selectedCountry['today']
                                      [CovidData.LATEST_CONFIRMED]
                                  .toString(),
                              style: kTodayCardValue,
                            ),
                            Text(
                              'New confirmed',
                              style: kTodayCardLabel,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                decoration: BoxDecoration(
                  color: kMoreDataColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff962f2f),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        'Latest',
                        style: kTodayCardTitle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              selectedCountry['latest_data']
                                      [CovidData.LATEST_DEATHS]
                                  .toString(),
                              style: kMoreDetailedValue,
                            ),
                            Text(
                              'Deaths',
                              style: kTodayCardLabel,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              selectedCountry['latest_data']
                                      [CovidData.LATEST_CONFIRMED]
                                  .toString(),
                              style: kMoreDetailedValue,
                            ),
                            Text(
                              'Confirmed',
                              style: kTodayCardLabel,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              selectedCountry['latest_data']
                                      [CovidData.LATEST_RECOVERED]
                                  .toString(),
                              style: kMoreDetailedValue,
                            ),
                            Text(
                              'Recovered',
                              style: kTodayCardLabel,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              selectedCountry['latest_data']['critical']
                                  .toString(),
                              style: kMoreDetailedValue,
                            ),
                            Text(
                              'Critical',
                              style: kTodayCardLabel,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              '${deathRate.toStringAsFixed(2)}%',
                              style: kMoreDetailedValue,
                            ),
                            Text(
                              'Death rate',
                              style: kTodayCardLabel,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '${recoveryRate.toStringAsFixed(2)}%',
                              style: kMoreDetailedValue,
                            ),
                            Text(
                              'Recovery rate',
                              style: kTodayCardLabel,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
