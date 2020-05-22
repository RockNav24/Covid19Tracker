import 'package:flutter/material.dart';
import 'package:covidtracker/const.dart';

class DataRowInsert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Sri lanka',
            style: kTableData,
          ),
          Text(
            '1024',
            style: kTableData,
          ),
          Text(
            '09',
            style: kTableData,
          ),
          Text(
            'Low',
            style: kTableData,
          ),
        ],
      ),
    );
  }
}
