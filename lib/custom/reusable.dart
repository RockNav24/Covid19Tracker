import 'package:flutter/material.dart';
import 'package:covidtracker/const.dart';

class CardSelect extends StatelessWidget {
  final Image countryImage;
  final String countryName;
  final int riskLevel;
  final int confirmed;

  CardSelect(
      {this.countryImage, this.countryName, this.riskLevel, this.confirmed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('pressed');
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
                  'Sri Lanka',
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
                'Low',
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
                  'Confirmed',
                  style: kReuseCardHead,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '50000',
                style: kReuseCardTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
