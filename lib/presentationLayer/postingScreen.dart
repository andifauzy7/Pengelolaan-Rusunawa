import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pengelolaan_rusunawa/blocLayer/posting/posting_bloc.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';
import 'package:pengelolaan_rusunawa/utils/dialog_loading.dart';

class PostingScreen extends StatefulWidget {
  @override
  _PostingScreenState createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen> {
  final List kondisiGedung = [
    "Sangat Baik",
    "Baik",
    "Normal",
    "Rusak",
    "Rusak Berat"
  ];
  PostingBloc _postingBloc = PostingBloc();
  TextEditingController _nama = TextEditingController();
  TextEditingController _lokasi = TextEditingController();
  TextEditingController _luasBangunan = TextEditingController();
  TextEditingController _luasTanah = TextEditingController();
  TextEditingController _kuota = TextEditingController();
  TextEditingController _penghuni = TextEditingController();
  TextEditingController _fasilitas = TextEditingController();
  TextEditingController _jangkaPemeliharaan = TextEditingController();
  TextEditingController _gambarRusunawa = TextEditingController();
  int _kondisiGedung = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isClickValidated = false;

  void validationInput() {
    setState(() {
      isClickValidated = true;
    });
    if (_formKey.currentState.validate()) {
      _postingBloc.add(PostingEventSubmit({
        'nama': _nama.text,
        'lokasi': _lokasi.text,
        'luas_bangunan': _luasBangunan.text,
        'luas_tanah': _luasTanah.text,
        'kuota': _kuota.text,
        'penghuni': _penghuni.text,
        'jangka_pemeliharaan': _jangkaPemeliharaan.text,
        'kondisi_gedung': _kondisiGedung.toString(),
        'gambar': _gambarRusunawa.text
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _postingBloc,
      child: BlocListener<PostingBloc, PostingState>(
        cubit: _postingBloc,
        listener: (context, state) {
          if(state is PostingStateLoading){
            DialogLoading.showLoading(context);
          } else if(state is PostingStateSuccess){
            DialogLoading.hideLoading(context);
            Fluttertoast.showToast(msg: state.message, toastLength: Toast.LENGTH_SHORT);
          } else if(state is PostingStateFailed){
            DialogLoading.hideLoading(context);
            Fluttertoast.showToast(msg: state.message, toastLength: Toast.LENGTH_SHORT);
          }
        },
        child: Scaffold(
          backgroundColor: ColorsTheme.mainColor,
          body: SafeArea(
            child: Column(
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
                            'Tambah Data Rusunawa',
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
                        'assets/rusun3.jpg',
                      ),
                    ),
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
                  child: Form(
                    autovalidateMode: (isClickValidated)
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    key: _formKey,
                    child: ListView(
                      children: [
                        SizedBox(height: 16.0),
                        TextFormField(
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
                              borderSide:
                                  BorderSide(color: ColorsTheme.mainColor),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          controller: _nama,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Harus diisi";
                            } else if (value.length < 4) {
                              return "Minimum 4 karakter";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
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
                              borderSide:
                                  BorderSide(color: ColorsTheme.mainColor),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          controller: _lokasi,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Harus diisi";
                            } else if (value.length < 4) {
                              return "Minimum 4 karakter";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '200',
                                  hintStyle:
                                      TextStyle(color: ColorsTheme.mainColor),
                                  labelText: 'LB (m2)',
                                  labelStyle:
                                      TextStyle(color: ColorsTheme.mainColor),
                                  suffixIcon: Icon(
                                    Icons.map,
                                    color: ColorsTheme.mainColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsTheme.mainColor),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                controller: _luasBangunan,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Harus diisi";
                                  } else {
                                    return null;
                                  }
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ],
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '200',
                                  hintStyle:
                                      TextStyle(color: ColorsTheme.mainColor),
                                  labelText: 'LT (m2)',
                                  labelStyle:
                                      TextStyle(color: ColorsTheme.mainColor),
                                  suffixIcon: Icon(
                                    Icons.map,
                                    color: ColorsTheme.mainColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsTheme.mainColor),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                controller: _luasTanah,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Harus diisi";
                                  } else {
                                    return null;
                                  }
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '150',
                                  hintStyle:
                                      TextStyle(color: ColorsTheme.mainColor),
                                  labelText: 'Kuota',
                                  labelStyle:
                                      TextStyle(color: ColorsTheme.mainColor),
                                  suffixIcon: Icon(
                                    Icons.people,
                                    color: ColorsTheme.mainColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsTheme.mainColor),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                controller: _kuota,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Harus diisi";
                                  } else {
                                    return null;
                                  }
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ],
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '120',
                                  hintStyle:
                                      TextStyle(color: ColorsTheme.mainColor),
                                  labelText: 'Penghuni',
                                  labelStyle:
                                      TextStyle(color: ColorsTheme.mainColor),
                                  suffixIcon: Icon(
                                    Icons.people,
                                    color: ColorsTheme.mainColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsTheme.mainColor),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                controller: _penghuni,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Harus diisi";
                                  } else {
                                    return null;
                                  }
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
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
                              borderSide:
                                  BorderSide(color: ColorsTheme.mainColor),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          controller: _fasilitas,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Harus diisi";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
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
                              borderSide:
                                  BorderSide(color: ColorsTheme.mainColor),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          controller: _jangkaPemeliharaan,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Harus diisi";
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]'))
                          ],
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
                              borderSide:
                                  BorderSide(color: ColorsTheme.mainColor),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          value: kondisiGedung[0],
                          hint: Text("Kondisi Gedung"),
                          items: kondisiGedung.map((value) {
                            return DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: ColorsTheme.mainColor),
                              ),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
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
                              borderSide:
                                  BorderSide(color: ColorsTheme.mainColor),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          controller: _gambarRusunawa,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Harus diisi";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Text('Tambah Data'),
                            onPressed: () {
                              validationInput();
                            },
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
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
