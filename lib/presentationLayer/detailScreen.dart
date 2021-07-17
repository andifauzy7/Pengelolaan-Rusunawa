import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List fasilitas = [
    "Lift",
    "Tempat Bermain Anak",
    "Lapangan Olahraga",
    "Tempat Parkir",
    "Toilet",
    "Penerangan Jalan",
    "Saluran Pembuangan",
    "Kipas",
    "AC",
    "Fasilitas Disabilitas"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rusunawa Berdikari"),
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
                    child: Text('Ciwaruga, Politeknik Negeri Bandung',
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
                    child: Text('200 m2',
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
                    child: Text('300 m2',
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
                    child: Text('24 dari 40',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    width: MediaQuery.of(context).size.width,
                    height: 32,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fasilitas.length,
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
                              fasilitas[index],
                              style: TextStyle(
                                  fontSize: 14.0, color: ColorsTheme.white),
                            ),
                          ),
                        );
                      },
                    ),
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
                    child: Text('Baik',
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
