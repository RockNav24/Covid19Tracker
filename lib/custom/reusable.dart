import 'package:flutter/material.dart';
import 'package:covidtracker/const.dart';
import 'package:covidtracker/covid19Data.dart';

class CardSelect extends StatelessWidget {
  final Map selectedCountry;

  CardSelect({this.selectedCountry});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'moreDetailed');
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cardBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        width: kReusableCardWidth,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  selectedCountry != null
                      ? selectedCountry[CovidData.COUNTRY_NAME]
                      : 'Country',
                  style: kReuseCardTitle,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Divider(
                thickness: 2,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Risk Level ',
                  style: kReuseCardHead,
                ),
              ),
            ),
            Expanded(
              child: Text(
                selectedCountry != null
                    ? CovidData().riskLevel(
                        selectedCountry[CovidData.LATEST_DATA]
                            [CovidData.LATEST_DEATHS])
                    : 'Risk Level',
                style: kReuseCardTitle,
              ),
            ),
            SizedBox(
              width: 150,
              child: Divider(
                thickness: 2,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Confirmed cases',
                  style: kReuseCardHead,
                ),
              ),
            ),
            Expanded(
              child: Text(
                selectedCountry != null
                    ? selectedCountry[CovidData.LATEST_DATA]
                            [CovidData.LATEST_CONFIRMED]
                        .toString()
                    : 'Value',
                style: kReuseCardTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
