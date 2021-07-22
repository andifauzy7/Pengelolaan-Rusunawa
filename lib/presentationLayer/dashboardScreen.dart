import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:pengelolaan_rusunawa/blocLayer/dashboard/dashboard_bloc.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardBloc _dashboardBloc = DashboardBloc();

  List<List> dataTips = [
    [
      Icon(
        Icons.account_box_rounded,
        size: 48,
        color: ColorsTheme.secondColor,
      ),
      "Kelola Akun"
    ],
    [
      Icon(
        Icons.home,
        size: 48,
        color: ColorsTheme.secondColor,
      ),
      "Info Rusun"
    ],
    [
      Icon(
        Icons.file_copy,
        size: 48,
        color: ColorsTheme.secondColor,
      ),
      "Laporan Rusun"
    ],
    [
      Icon(
        Icons.home_work,
        size: 48,
        color: ColorsTheme.secondColor,
      ),
      "Kelola Rusun"
    ],
    [
      Icon(
        Icons.notifications,
        size: 48,
        color: ColorsTheme.secondColor,
      ),
      "Notifikasi"
    ],
  ];

  Card tipsAplikasi(Icon icon, String message) {
    return Card(
      elevation: 4.0,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            icon,
            SizedBox(
              height: 8.0,
            ),
            Text(
              message,
              style: TextStyle(color: ColorsTheme.mainColor, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dashboardBloc.add(DashboardEventGetInfo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dashboardBloc,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            cubit: _dashboardBloc,
            builder: (context, state) {
              if(state is DashboardStateSuccess){
                return Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(top: 8.0),
                  child: ListView(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: ImageSlideshow(
                            width: double.infinity,
                            height: 200,
                            initialPage: 0,
                            indicatorColor: ColorsTheme.mainColor,
                            indicatorBackgroundColor: ColorsTheme.fiveColor,
                            autoPlayInterval: 3000,
                            children: [
                              Image.asset(
                                'assets/rusunawa.jpg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/rusun1.jpg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/rusun2.jpg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/rusun3.jpg',
                                fit: BoxFit.cover,
                              ),
                            ]),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Laporan',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Rusunawa yang anda kelola',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Card(
                              color: ColorsTheme.fiveColor,
                              child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rusunawa',
                                            style: TextStyle(
                                                color: ColorsTheme.mainColor,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            (state.infoRusunawa.totalRusunawa == null) ? "0" : state.infoRusunawa.totalRusunawa,
                                            style: TextStyle(
                                                color: ColorsTheme.mainColor,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.bar_chart,
                                        size: 36,
                                        color: ColorsTheme.mainColor,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Card(
                              color: ColorsTheme.redAccent,
                              child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rusak',
                                            style: TextStyle(
                                                color: ColorsTheme.mainColor,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            (state.infoRusunawa.rusunawaPerbaikan == null) ? "0" : state.infoRusunawa.rusunawaPerbaikan,
                                            style: TextStyle(
                                                color: ColorsTheme.mainColor,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.warning,
                                        size: 36,
                                        color: ColorsTheme.mainColor,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tips',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Fitur yang ada pada aplikasi',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataTips.length,
                          itemBuilder: (context, index) {
                            return tipsAplikasi(
                                dataTips[index][0], dataTips[index][1]);
                          },
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Informasi',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Informasi Aplikasi',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Container(
                                child: Image.asset(
                                  "assets/jawa_barat.png",
                                  width: 50,
                                )),
                            SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: Text(
                                'Aplikasi Mobile yang dikembangkan untuk membantu pengelolaan Rusunawa yang ada di Jawa Barat secara online. Aplikasi ini dapat digunakan oleh Petugas UPT Pengelolaan Rusunawa. Daftar fitur yang dimiliki oleh aplikasi diantaranya : Login, Registrasi, Logout, Pengelolaan Rusunawa dan Notifikasi Pemeliharaan.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: ColorsTheme.mainColor, fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if(state is DashboardStateFailed){
                return Container(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
