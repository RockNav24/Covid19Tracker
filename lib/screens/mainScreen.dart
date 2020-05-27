import 'package:covidtracker/const.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/screens/homeScreen.dart';
import 'package:covidtracker/screens/myCountryScreen.dart';
import 'package:covidtracker/screens/moreInfoScreen.dart';

class BottomNavigation extends StatefulWidget {
  final List data;
  BottomNavigation({this.data});
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    HomeScreen(
      data: widget.data,
    ),
    MoreInfoScreen(),
    MyCountryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        unselectedItemColor: Color(0xffd6bd9c),
        selectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('My Country'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('More'),
          ),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}
