import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pengelolaan_rusunawa/blocLayer/login/login_bloc.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/registerScreen.dart';
import 'package:pengelolaan_rusunawa/utils/backgroundPainter.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';
import 'package:pengelolaan_rusunawa/utils/dialog_loading.dart';

import 'mainScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc = LoginBloc();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isClickValidated = false;

  void validationInput() {
    setState(() {
      isClickValidated = true;
    });
    if (_formKey.currentState.validate()){
      _loginBloc.add(LoginEventSubmit(_username.text, _password.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        cubit: _loginBloc,
        listener: (context, state) {
          if (state is LoginStateLoading) {
            DialogLoading.showLoading(context);
          }

          if (state is LoginStateSuccess) {
            DialogLoading.hideLoading(context);
            Fluttertoast.showToast(
                msg: state.message, toastLength: Toast.LENGTH_SHORT);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          }

          if (state is LoginStateFailed) {
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/rusunawa.jpg')),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Form(
                        autovalidateMode: (isClickValidated)
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pengelolaan Rusunawa',
                                      style: TextStyle(
                                          color: ColorsTheme.mainColor,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Halaman Login',
                                      style: TextStyle(
                                          color: ColorsTheme.mainColor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.0,
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
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Text('Masuk'),
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
                                child: Text('Registrasi'),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
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
