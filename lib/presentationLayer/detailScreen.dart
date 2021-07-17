import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List fasilitas = [
    "AC",
    "Toilet",
    "Parkir",
    "Listrik",
    "Wifi",
    "Telepon"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rusunawa Berdikari"),
      ),
      body: Container(
        child: ListView(
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/rusunawa.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorsTheme.mainColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Alamat Rusunawa',
                    style: TextStyle(
                        color: ColorsTheme.mainColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Ciwaruga, Politeknik Negeri Bandung'),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.map,
                  color: ColorsTheme.mainColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Luas Bangunan (LB) / Luas Tanah (LT)',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('200m2 (LB) / 300m2 (LT)'),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.people,
                  color: ColorsTheme.mainColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Kuota',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Penghuni : 24 dari 40'),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.map,
                  color: ColorsTheme.mainColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Fasilitas',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              width: MediaQuery.of(context).size.width,
              height: 64,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fasilitas.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: ColorsTheme.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text(
                        fasilitas[index],
                        style: TextStyle(
                            fontSize: 10.0, color: ColorsTheme.mainColor),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: ColorsTheme.mainColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Kondisi Gedung',
                      style: TextStyle(
                          color: ColorsTheme.mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Baik'),
            ),
          ],
        ),
      ),
    );
  }
}
