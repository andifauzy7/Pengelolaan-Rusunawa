import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.mainColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
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
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height * 0.5),
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                            padding:
                            EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                            child: Text(
                              'Rusunawa Berdikari',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
                            child: Text(
                              'Ciwaruga, Politeknik Negeri Bandung',
                              style: TextStyle(
                                  fontSize: 10.0, color: ColorsTheme.mainColor),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
                            child: Text(
                              '200m2 (LB) / 300m2 (LT)',
                              style: TextStyle(
                                  fontSize: 10.0, color: ColorsTheme.mainColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 2.0, bottom: 8.0),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: ColorsTheme.fiveColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                              child: Text(
                                'Baik',
                                style: TextStyle(
                                    fontSize: 10.0, color: ColorsTheme.mainColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
