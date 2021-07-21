import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pengelolaan_rusunawa/blocLayer/register/register_bloc.dart';
import 'package:pengelolaan_rusunawa/utils/backgroundPainter.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';
import 'package:pengelolaan_rusunawa/utils/dialog_loading.dart';

import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc = RegisterBloc();
  TextEditingController _nama = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConfirm = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isClickValidated = false;

  void validationInput(){
    setState(() {
      isClickValidated = true;
    });
    if (_formKey.currentState.validate()){
      _registerBloc.add(RegisterEventSubmit(_nama.text, _username.text, _password.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        cubit: _registerBloc,
        listener: (context, state) {
          if (state is RegisterStateLoading) {
            DialogLoading.showLoading(context);
          }

          if (state is RegisterStateSuccess) {
            DialogLoading.hideLoading(context);
            Fluttertoast.showToast(
                msg: state.message, toastLength: Toast.LENGTH_SHORT);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginScreen()));
          }

          if (state is RegisterStateFailed) {
            DialogLoading.hideLoading(context);
            Fluttertoast.showToast(
                msg: state.message, toastLength: Toast.LENGTH_SHORT);
          }
        },
        child: Scaffold(
          body: CustomPaint(
            painter: BackgroundPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Form(
                        autovalidateMode: (isClickValidated)
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                                child: Image.asset(
                              "assets/jawa_barat.png",
                              width: 50,
                            )),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'Pengelolaan Rusunawa',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Halaman Registrasi',
                              style: TextStyle(
                                  color: ColorsTheme.mainColor, fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Isi nama lengkap anda.',
                                hintStyle:
                                    TextStyle(color: ColorsTheme.mainColor),
                                labelText: 'Nama Lengkap',
                                labelStyle:
                                    TextStyle(color: ColorsTheme.mainColor),
                                suffixIcon: Icon(
                                  Icons.account_circle,
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
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Isi username anda.',
                                hintStyle:
                                    TextStyle(color: ColorsTheme.mainColor),
                                labelText: 'Username',
                                labelStyle:
                                    TextStyle(color: ColorsTheme.mainColor),
                                suffixIcon: Icon(
                                  Icons.account_circle,
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
                                labelStyle:
                                    TextStyle(color: ColorsTheme.mainColor),
                                hintStyle:
                                    TextStyle(color: ColorsTheme.mainColor),
                                suffixIcon: Icon(
                                  Icons.vpn_key,
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
                                labelStyle:
                                    TextStyle(color: ColorsTheme.mainColor),
                                hintStyle:
                                    TextStyle(color: ColorsTheme.mainColor),
                                suffixIcon: Icon(
                                  Icons.vpn_key,
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
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Text('Registrasi'),
                                onPressed: () {
                                  validationInput();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: ColorsTheme.thirdColor, // background
                                    onPrimary: ColorsTheme.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Text('Kembali ke Halaman Login'),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: ColorsTheme.white, // background
                                  onPrimary: ColorsTheme.thirdColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
