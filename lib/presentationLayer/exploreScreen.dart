import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pengelolaan_rusunawa/blocLayer/explore/explore_bloc.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/detailScreen.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ExploreBloc _exploreBloc = ExploreBloc();

  @override
  void initState() {
    super.initState();
    _exploreBloc.add(ExploreEventGetRusunawa());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _exploreBloc,
      child: Scaffold(
        backgroundColor: ColorsTheme.mainColor,
        body: BlocBuilder<ExploreBloc, ExploreState>(
          cubit: _exploreBloc,
          builder: (context, state) {
            if (state is ExploreStateSuccess) {
              if(state.daftarRusunawa.length == 0) {
                return Container(
                  color: ColorsTheme.white,
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Lottie.asset(
                        'assets/not_found.json',
                        repeat: false,
                        reverse: false,
                        animate: true,
                      ),
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Image.asset(
                                    "assets/jawa_barat.png",
                                    width: 50,
                                  )),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Info Rusunawa Jawa Barat',
                                style: TextStyle(
                                    color: ColorsTheme.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: new BoxDecoration(
                        color: ColorsTheme.mainColor,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: new AssetImage(
                            'assets/rusunawa.jpg',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: GridView.builder(
                            itemCount: state.daftarRusunawa.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height * 0.5),
                                crossAxisCount: 2,
                                crossAxisSpacing: 2.0,
                                mainAxisSpacing: 2.0),
                            itemBuilder: (context, index) {
                              var status = state.daftarRusunawa[index].kondisiGedung;
                              var statusString;
                              var colors;
                              if(status == "0"){
                                statusString = "Sangat Baik";
                                colors = ColorsTheme.fiveColor;
                              } else if(status == "1"){
                                statusString = "Baik";
                                colors = ColorsTheme.blueAccent;
                              } else if(status == "2"){
                                statusString = "Normal";
                                colors = ColorsTheme.orangeAccent;
                              } else if(status == "3"){
                                statusString = "Rusak";
                                colors = ColorsTheme.orangeAccentDark;
                              } else {
                                statusString = "Rusak Berat";
                                colors = ColorsTheme.redAccent;
                              }
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen()));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(24.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(24.0),
                                            topRight: Radius.circular(24.0)),
                                        child: Image.asset(
                                          'assets/rusunawa.jpg',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 100,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0, top: 8.0),
                                        child: Text(
                                          state.daftarRusunawa[index].nama.toString(),
                                          style: TextStyle(
                                              color: ColorsTheme.mainColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0, top: 2.0),
                                        child: Text(
                                          state.daftarRusunawa[index].lokasi
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: ColorsTheme.mainColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0, top: 2.0),
                                        child: Text(
                                          '${state.daftarRusunawa[index].luasBangunan.toString()}m2 (LB) / ${state.daftarRusunawa[index].luasTanah.toString()}m2 (LT)',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: ColorsTheme.mainColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            top: 2.0,
                                            bottom: 8.0),
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              color: colors,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Text(
                                            statusString,
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                color: ColorsTheme.mainColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ))
                  ],
                );
              }
            } else if (state is ExploreStateFailed) {
              return Container(
                color: ColorsTheme.white,
                child: Center(
                  child: Text(state.message),
                ),
              );
            } else {
              return Container(
                color: ColorsTheme.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
