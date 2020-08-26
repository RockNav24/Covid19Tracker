import 'package:flutter/material.dart';
import 'package:covidtracker/screens/homeScreen.dart';
import 'package:covidtracker/screens/myCountryScreen.dart';
import 'package:covidtracker/screens/moreInfoScreen.dart';
import 'package:covidtracker/const.dart';

class MainScreen extends StatefulWidget {
  final List data;
  MainScreen({this.data});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(data: widget.data),
      MyCountryScreen(data: widget.data),
      MoreInfoScreen(),
    ];
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
