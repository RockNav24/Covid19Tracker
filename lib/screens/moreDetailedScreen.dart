import 'package:flutter/material.dart';
import 'package:covidtracker/const.dart';
import 'package:covidtracker/screens/homeScreen.dart';
import 'package:covidtracker/covid19Data.dart';

class MoreDetailedScreen extends StatefulWidget {
  @override
  _MoreDetailedScreenState createState() => _MoreDetailedScreenState();
}

class _MoreDetailedScreenState extends State<MoreDetailedScreen> {
  Map selectedCountry = HomeScreen.selectedCountry;
  var recoveryRate =
      HomeScreen.selectedCountry['latest_data']['calculated']['recovery_rate'];
  var deathRate =
      HomeScreen.selectedCountry['latest_data']['calculated']['death_rate'];
  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                        horizontal: 20,
                        vertical: 10,
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
