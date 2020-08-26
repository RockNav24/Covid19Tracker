import 'package:flutter/material.dart';
import 'package:covidtracker/covid19Data.dart';
import 'package:covidtracker/screens/mainScreen.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:covidtracker/const.dart';
import 'package:covidtracker/location.dart';
import 'package:covidtracker/countryInfo.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getData() async {
    String countryCode;
    CovidData covid = CovidData();
    List allData = await covid.getData();

    Location location = Location();
    await location.getCurrentLocation();
    CountryInfo countryInfo = CountryInfo();
    countryCode =
        await countryInfo.getCountryCode(location.latitude, location.longitude);

    for (Map country in allData) {
      if (country['code'] == countryCode) {
        Location.currentLocation = country;
      }
    }
    print(allData);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MainScreen(data: allData)));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: LoadingFlipping.circle(
          borderColor: Colors.white,
        ),
      ),
    );
  }
}
