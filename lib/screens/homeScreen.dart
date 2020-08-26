import 'dart:async';
import 'package:covidtracker/const.dart';
import 'package:covidtracker/covid19Data.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/custom/reusable.dart';

class HomeScreen extends StatefulWidget {
  static Map selectedCountry;
  List data;
  HomeScreen({this.data});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool countrySort;
  bool confirmedSort;

  Future<void> getData() async {
    Timer.periodic(Duration(minutes: 30), (timer) async {
      CovidData covid = CovidData();
      List allData = await covid.getData();
      widget.data = allData;
    });
  }

  Map getCountry(List data, String countryName) {
    Map countryMap;
    for (Map country in data) {
      if (country[CovidData.COUNTRY_NAME] == countryName) {
        countryMap = country;
      }
    }
    return countryMap;
  }

  onSortColumn(int columnIndex, bool ascending, List data) {
    if (columnIndex == 2) {
      if (ascending) {
        data.sort((a, b) => (a[CovidData.LATEST_DATA]
                [CovidData.LATEST_CONFIRMED]
            .compareTo(b[CovidData.LATEST_DATA][CovidData.LATEST_CONFIRMED])));
      } else {
        data.sort((a, b) => (b[CovidData.LATEST_DATA]
                [CovidData.LATEST_CONFIRMED]
            .compareTo(a[CovidData.LATEST_DATA][CovidData.LATEST_CONFIRMED])));
      }
    } else if (columnIndex == 1) {
      if (ascending) {
        data.sort((a, b) =>
            (a[CovidData.COUNTRY_NAME].compareTo(b[CovidData.COUNTRY_NAME])));
      } else {
        data.sort((a, b) =>
            (b[CovidData.COUNTRY_NAME].compareTo(a[CovidData.COUNTRY_NAME])));
      }
    } else if (columnIndex == 3) {
      if (ascending) {
        data.sort((a, b) => (a[CovidData.LATEST_DATA][CovidData.LATEST_DEATHS]
            .compareTo(b[CovidData.LATEST_DATA][CovidData.LATEST_DEATHS])));
      } else {
        data.sort((a, b) => (b[CovidData.LATEST_DATA][CovidData.LATEST_DEATHS]
            .compareTo(a[CovidData.LATEST_DATA][CovidData.LATEST_DEATHS])));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    countrySort = false;
    confirmedSort = true;
    HomeScreen.selectedCountry = widget.data[0];
  }

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    getData();
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  sortAscending: countrySort,
                  sortColumnIndex: 2,
                  columnSpacing: 10,
                  dataRowHeight: 60,
                  columns: [
                    DataColumn(
                      numeric: false,
                      label: Text(
                        'No',
                        style: kTableTitle,
                      ),
                    ),
                    DataColumn(
                        numeric: false,
                        label: Text(
                          'Country',
                          style: kTableTitle,
                        ),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            countrySort = !countrySort;
                          });
                          onSortColumn(columnIndex, ascending, widget.data);
                        }),
                    DataColumn(
                      numeric: false,
                      label: Text(
                        'Confirmed',
                        style: kTableTitle,
                      ),
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          confirmedSort = !confirmedSort;
                        });
                        onSortColumn(columnIndex, ascending, widget.data);
                      },
                    ),
                    DataColumn(
                      label: Text(
                        'Deaths',
                        style: kTableTitle,
                      ),
                    ),
                  ],
                  rows: widget.data
                      .map(
                        (country) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                '${counter++}',
                              ),
                              onTap: () {
                                setState(() {
                                  HomeScreen.selectedCountry = country;
                                });
                              },
                            ),
                            DataCell(
                              Text(
                                country[CovidData.COUNTRY_NAME],
                                style: kTableTitle,
                              ),
                              onTap: () {
                                setState(() {
                                  HomeScreen.selectedCountry = country;
                                });
                              },
                            ),
                            DataCell(
                              Text(
                                country[CovidData.LATEST_DATA]
                                        [CovidData.LATEST_CONFIRMED]
                                    .toString(),
                                style: kTableTitle,
                              ),
                              onTap: () {
                                setState(() {
                                  HomeScreen.selectedCountry = country;
                                });
                              },
                            ),
                            DataCell(
                              Text(
                                country[CovidData.LATEST_DATA]
                                        [CovidData.LATEST_DEATHS]
                                    .toString(),
                                style: kTableTitle,
                              ),
                              onTap: () {
                                setState(() {
                                  HomeScreen.selectedCountry = country;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 5,
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: CardSelect(
                selectedCountry: HomeScreen.selectedCountry,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
