import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class PostingScreen extends StatefulWidget {
  @override
  _PostingScreenState createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen> {
  final List salam = [
    "Baik",
    "Sedang",
    "Cukup",
    "Buruk"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.secondColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                    'Tambah Rusunawa',
                    style: TextStyle(
                        color: ColorsTheme.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                      color: ColorsTheme.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: ListView(
                    children: [
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Rusunawa Berdikari',
                          hintStyle: TextStyle(color: ColorsTheme.mainColor),
                          labelText: 'Nama Rusunawa',
                          labelStyle: TextStyle(color: ColorsTheme.mainColor),
                          suffixIcon: Icon(
                            Icons.home_work,
                            color: ColorsTheme.mainColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsTheme.mainColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Jln. Pesona Alam, Ciwaruga, Bandung',
                          hintStyle: TextStyle(color: ColorsTheme.mainColor),
                          labelText: 'Lokasi Rusunawa',
                          labelStyle: TextStyle(color: ColorsTheme.mainColor),
                          suffixIcon: Icon(
                            Icons.location_on,
                            color: ColorsTheme.mainColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsTheme.mainColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '200',
                                hintStyle: TextStyle(color: ColorsTheme.mainColor),
                                labelText: 'LB (m2)',
                                labelStyle: TextStyle(color: ColorsTheme.mainColor),
                                suffixIcon: Icon(
                                  Icons.map,
                                  color: ColorsTheme.mainColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorsTheme.mainColor),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '200',
                                hintStyle: TextStyle(color: ColorsTheme.mainColor),
                                labelText: 'LT (m2)',
                                labelStyle: TextStyle(color: ColorsTheme.mainColor),
                                suffixIcon: Icon(
                                  Icons.map,
                                  color: ColorsTheme.mainColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorsTheme.mainColor),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '150',
                                hintStyle: TextStyle(color: ColorsTheme.mainColor),
                                labelText: 'Kuota',
                                labelStyle: TextStyle(color: ColorsTheme.mainColor),
                                suffixIcon: Icon(
                                  Icons.people,
                                  color: ColorsTheme.mainColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorsTheme.mainColor),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '120',
                                hintStyle: TextStyle(color: ColorsTheme.mainColor),
                                labelText: 'Penghuni',
                                labelStyle: TextStyle(color: ColorsTheme.mainColor),
                                suffixIcon: Icon(
                                  Icons.people,
                                  color: ColorsTheme.mainColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorsTheme.mainColor),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'AC, Air, Toilet, Listrik',
                          hintStyle: TextStyle(color: ColorsTheme.mainColor),
                          labelText: 'Fasilitas',
                          labelStyle: TextStyle(color: ColorsTheme.mainColor),
                          suffixIcon: Icon(
                            Icons.settings,
                            color: ColorsTheme.mainColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsTheme.mainColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '6',
                          hintStyle: TextStyle(color: ColorsTheme.mainColor),
                          labelText: 'Jangka Pemeliharaan (Bulan)',
                          labelStyle: TextStyle(color: ColorsTheme.mainColor),
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: ColorsTheme.mainColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsTheme.mainColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: 'Kondisi Gedung',
                          hintStyle: TextStyle(color: ColorsTheme.mainColor),
                          labelText: 'Kondisi Gedung',
                          labelStyle: TextStyle(color: ColorsTheme.mainColor),
                          suffixIcon: Icon(
                            Icons.home_work,
                            color: ColorsTheme.mainColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsTheme.mainColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        value: salam[0],
                        hint: Text("Kondisi Gedung"),
                        items: salam.map((value) {
                          return DropdownMenuItem(
                            child: Text(value, style: TextStyle(color: ColorsTheme.mainColor),),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Gambar Rusunawa',
                          hintStyle: TextStyle(color: ColorsTheme.mainColor),
                          labelText: 'Gambar Rusunawa',
                          labelStyle: TextStyle(color: ColorsTheme.mainColor),
                          suffixIcon: Icon(
                            Icons.photo,
                            color: ColorsTheme.mainColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsTheme.mainColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          child: Text('Tambah Data'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: ColorsTheme.secondColor, // background
                              onPrimary: ColorsTheme.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
