import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/dataLayer/model/responseRusunawa.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class DetailScreen extends StatefulWidget {
  Rusunawa rusunawa;
  DetailScreen(this.rusunawa);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var hasil;
  @override
  Widget build(BuildContext context) {
    var status =
        widget.rusunawa.kondisiGedung;
    var statusString;
    if (status == "0") {
      statusString = "Sangat Baik";
    } else if (status == "1") {
      statusString = "Baik";
    } else if (status == "2") {
      statusString = "Normal";
    } else if (status == "3") {
      statusString = "Rusak";
    } else {
      statusString = "Rusak Berat";
    }

    print(widget.rusunawa.fasilitas);

    if(widget.rusunawa.fasilitas != null){
      hasil = widget.rusunawa.fasilitas
          .split(',')
          .map((String text) => text)
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rusunawa.nama.toString()),
        backgroundColor: ColorsTheme.mainColor,
      ),
      body: Column(
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/rusunawa.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Alamat Rusunawa',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(widget.rusunawa.lokasi.toString(),
                        style: TextStyle(color: ColorsTheme.mainColor)),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Luas Bangunan (LB)',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('${widget.rusunawa.luasBangunan.toString()} m2',
                        style: TextStyle(color: ColorsTheme.mainColor)),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Luas Tanah (LT)',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('${widget.rusunawa.luasTanah.toString()} m2',
                        style: TextStyle(color: ColorsTheme.mainColor)),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Kuota',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('${widget.rusunawa.penghuni.toString()} dari ${widget.rusunawa.kuota.toString()}',
                        style: TextStyle(color: ColorsTheme.mainColor)),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Fasilitas',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  (widget.rusunawa.fasilitas != null) ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    width: MediaQuery.of(context).size.width,
                    height: 32,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hasil.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: ColorsTheme.mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              hasil[index].toString(),
                              style: TextStyle(
                                  fontSize: 14.0, color: ColorsTheme.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ) : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("-"),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Kondisi Gedung',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(statusString,
                        style: TextStyle(color: ColorsTheme.mainColor)),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Jangka Pemeliharaan',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(widget.rusunawa.jangkaPemeliharaan + " Bulan.",
                        style: TextStyle(color: ColorsTheme.mainColor)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
