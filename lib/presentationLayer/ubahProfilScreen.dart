import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengelolaan_rusunawa/blocLayer/ubahProfil/ubah_profil_bloc.dart';
import 'package:pengelolaan_rusunawa/dataLayer/model/responseLogin.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class UbahProfilScreen extends StatefulWidget {
  const UbahProfilScreen({Key key}) : super(key: key);

  @override
  _UbahProfilScreenState createState() => _UbahProfilScreenState();
}

class _UbahProfilScreenState extends State<UbahProfilScreen> {
  UbahProfilBloc _ubahProfilBloc = UbahProfilBloc();
  TextEditingController _nama = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConfirm = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isClickValidated = false;

  void validationInput() {
    setState(() {
      isClickValidated = true;
    });
    if (_formKey.currentState.validate()){
      Data pengguna = Data(nama: _nama.text, username: _username.text, password: _password.text);
      _ubahProfilBloc.add(UbahProfilEventSubmit(pengguna));
    }
  }

  @override
  void initState() {
    super.initState();
    _ubahProfilBloc.add(UbahProfilEventGetProfil());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _ubahProfilBloc,
      child: BlocListener<UbahProfilBloc, UbahProfilState>(
        cubit: _ubahProfilBloc,
        listener: (context, state) {
          if(state is UbahProfilStateSuccess){
            _nama.text = state.pengguna.nama;
            _username.text = state.pengguna.username;
            _password.text = state.pengguna.password;
            _passwordConfirm.text = state.pengguna.password;
          }
        },
        child: Scaffold(
          backgroundColor: ColorsTheme.mainColor,
          appBar: AppBar(
            title: Text("Ubah Profil"),
            backgroundColor: ColorsTheme.mainColor,
          ),
          body: BlocBuilder<UbahProfilBloc, UbahProfilState>(
            cubit: _ubahProfilBloc,
            builder: (context, state) {
              if (state is UbahProfilStateSuccess) {
                return Container(
                  child: ListView(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Form(
                          autovalidateMode: (isClickValidated)
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          key: _formKey,
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.0),
                                        child: Image(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          image:
                                              AssetImage('assets/avatar.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24.0,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Isi nama lengkap anda.',
                                          hintStyle: TextStyle(
                                              color: ColorsTheme.white),
                                          labelText: 'Nama Lengkap',
                                          labelStyle: TextStyle(
                                              color: ColorsTheme.white),
                                          suffixIcon: Icon(
                                            Icons.account_circle,
                                            color: ColorsTheme.white,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorsTheme.white),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        style: TextStyle(color: Colors.white),
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
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Isi username anda.',
                                          hintStyle: TextStyle(
                                              color: ColorsTheme.white),
                                          labelText: 'Username',
                                          labelStyle: TextStyle(
                                              color: ColorsTheme.white),
                                          suffixIcon: Icon(
                                            Icons.account_circle,
                                            color: ColorsTheme.white,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorsTheme.white),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        controller: _username,
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
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Masukkan kata sandi anda.',
                                          labelText: 'Kata Sandi',
                                          labelStyle: TextStyle(
                                              color: ColorsTheme.white),
                                          hintStyle: TextStyle(
                                              color: ColorsTheme.white),
                                          suffixIcon: Icon(
                                            Icons.vpn_key,
                                            color: ColorsTheme.white,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorsTheme.white),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        controller: _password,
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
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Masukkan kata sandi anda.',
                                          labelText: 'Konfirmasi Kata Sandi',
                                          labelStyle: TextStyle(
                                              color: ColorsTheme.white),
                                          hintStyle: TextStyle(
                                              color: ColorsTheme.white),
                                          suffixIcon: Icon(
                                            Icons.vpn_key,
                                            color: ColorsTheme.white,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorsTheme.white),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        controller: _passwordConfirm,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Harus diisi";
                                          } else if (value.length < 4) {
                                            return "Minimum 4 karakter";
                                          } else if (value != _password.text) {
                                            return "Konfirmasi Password tidak sesuai";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          child: Text('Ubah Profil'),
                                          onPressed: () {
                                            validationInput();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: ColorsTheme
                                                  .thirdColor, // background
                                              onPrimary: ColorsTheme.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is UbahProfilStateFailed) {
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
