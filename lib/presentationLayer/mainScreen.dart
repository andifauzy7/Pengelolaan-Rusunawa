import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/dataLayer/session/sharedPreference.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/exploreScreen.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/historyScreen.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/postingScreen.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/profileScreen.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';
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
      body: _pages[_currentIndex],
      appBar: AppBar(
        title: Text("Pengelolaan Rusunawa"),
        centerTitle: true,
        backgroundColor: ColorsTheme.mainColor,
      ),
      drawer: SafeArea(
        child: FutureBuilder(
          future: SharedPreference.getNama(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Drawer(
                child: ListView(
                  children: [
                    Container(
                      color: ColorsTheme.mainColor,
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/avatar.png',
                            width: 50,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo,',
                                style: TextStyle(
                                    color: ColorsTheme.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data,
                                style: TextStyle(
                                    color: ColorsTheme.white, fontSize: 16.0),
                              ),
                              Text(
                                'Kementerian PUPR',
                                style: TextStyle(
                                    color: ColorsTheme.white, fontSize: 12.0),
                              ),
                              Text(
                                'Regional Jawa Barat',
                                style: TextStyle(
                                    color: ColorsTheme.white, fontSize: 12.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      trailing: Icon(Icons.navigate_next),
                      leading: Icon(Icons.dashboard),
                      tileColor: (_currentIndex == 0)
                          ? ColorsTheme.fiveColor
                          : ColorsTheme.white,
                      title: Text(
                        "Dashboard",
                      ),
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                    ),
                    ListTile(
                      trailing: Icon(Icons.navigate_next),
                      leading: Icon(Icons.explore),
                      tileColor: (_currentIndex == 1)
                          ? ColorsTheme.fiveColor
                          : ColorsTheme.white,
                      title: Text(
                        "Cari",
                      ),
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                    ),
                    ListTile(
                      trailing: Icon(Icons.navigate_next),
                      leading: Icon(Icons.add_location_alt_outlined),
                      tileColor: (_currentIndex == 2)
                          ? ColorsTheme.fiveColor
                          : ColorsTheme.white,
                      title: Text(
                        "Posting",
                      ),
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                    ),
                    ListTile(
                      trailing: Icon(Icons.navigate_next),
                      leading: Icon(Icons.home_work),
                      tileColor: (_currentIndex == 3)
                          ? ColorsTheme.fiveColor
                          : ColorsTheme.white,
                      title: Text(
                        "Kelola",
                      ),
                      onTap: () {
                        setState(() {
                          _currentIndex = 3;
                        });
                      },
                    ),
                    ListTile(
                      trailing: Icon(Icons.navigate_next),
                      leading: Icon(Icons.person),
                      tileColor: (_currentIndex == 4)
                          ? ColorsTheme.fiveColor
                          : ColorsTheme.white,
                      title: Text(
                        "Profil",
                      ),
                      onTap: () {
                        setState(() {
                          _currentIndex = 4;
                        });
                      },
                    )
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
