import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pengelolaan_rusunawa/blocLayer/history/history_bloc.dart';
import 'package:pengelolaan_rusunawa/dataLayer/model/responseRusunawa.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/editRusunawaScreen.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

import 'detailScreen.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryBloc _historyBloc = HistoryBloc();

  @override
  void initState() {
    super.initState();
    _historyBloc.add(HistoryEventGetRusunawa());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _historyBloc,
      child: Scaffold(
        backgroundColor: ColorsTheme.mainColor,
        body: BlocBuilder<HistoryBloc, HistoryState>(
          cubit: _historyBloc,
          builder: (context, state) {
            if (state is HistoryStateSuccess) {
              if (state.daftarRusunawa.length == 0) {
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
                          child: Center(
                            child: Text(
                              'Rusunawa Anda',
                              style: TextStyle(
                                  color: ColorsTheme.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
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
                            'assets/rusun1.jpg',
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
                            childAspectRatio: 0.75,
                            crossAxisCount: 2,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0),
                        itemBuilder: (context, index) {
                          var status =
                              state.daftarRusunawa[index].kondisiGedung;
                          var statusString;
                          var colors;
                          if (status == "0") {
                            statusString = "Sangat Baik";
                            colors = ColorsTheme.fiveColor;
                          } else if (status == "1") {
                            statusString = "Baik";
                            colors = ColorsTheme.blueAccent;
                          } else if (status == "2") {
                            statusString = "Normal";
                            colors = ColorsTheme.orangeAccent;
                          } else if (status == "3") {
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
                                      builder: (context) => DetailScreen(
                                          state.daftarRusunawa[index])));
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
                                      'assets/rusun3.jpg',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 100,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 8.0),
                                    child: Text(
                                      state.daftarRusunawa[index].nama
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
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
                                        Row(
                                          children: [
                                            InkWell(
                                              child: Icon(Icons.edit, color: ColorsTheme.mainColor, size: 16.0,),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditRusunawaScreen(state
                                                                    .daftarRusunawa[
                                                                index])));
                                              },
                                            ),
                                            InkWell(
                                              child: Icon(Icons.delete, color: ColorsTheme.mainColor, size: 16.0,),
                                              onTap: () {
                                                delete(context, state.daftarRusunawa[index]);
                                              },
                                            )
                                          ],
                                        )
                                      ],
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
            } else if (state is HistoryStateFailed) {
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

  delete(BuildContext context, Rusunawa rusunawa) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        title: new Text('Konfirmasi Hapus Rusunawa'),
        content: new Text('Kamu setuju untuk hapus rusunawa?'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: new Text('No'),
          ),
          TextButton(
            onPressed: (){
              Navigator.pop(context);
              _historyBloc.add(HistoryEventDelete(rusunawa));
            },
            child: new Text('Yes', style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }
}
