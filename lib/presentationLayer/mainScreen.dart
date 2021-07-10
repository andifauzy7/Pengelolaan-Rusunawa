import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/exploreScreen.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/historyScreen.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/postingScreen.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/profileScreen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'dashboardScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;
  List<Widget> _pages = [
    DashboardScreen(),
    ExploreScreen(),
    PostingScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent,
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            selectedColor: Colors.deepOrange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.explore),
            title: Text("Cari"),
            selectedColor: Colors.deepOrange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.add_location_alt_outlined),
            title: Text("Posting"),
            selectedColor: Colors.deepOrange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.home_work),
            title: Text("Kelola"),
            selectedColor: Colors.deepOrange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profil"),
            selectedColor: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
