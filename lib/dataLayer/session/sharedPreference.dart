import 'package:pengelolaan_rusunawa/dataLayer/model/responseLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static String _idPengguna = "ID_KEY";
  static String _usernamePengguna = "USERNAME_KEY";
  static String _namaPengguna = "NAMA_KEY";
  static String _password = "PASSWORD_KEY";

  static Future<void> savePengguna(Data pengguna) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_usernamePengguna, pengguna.username);
    prefs.setString(_namaPengguna, pengguna.namaPengguna);
    prefs.setString(_password, pengguna.password);
    prefs.setInt(_idPengguna, int.parse(pengguna.idPengguna));
  }

  static Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usernameKey = prefs.getString(_usernamePengguna);
    if (usernameKey != null) {
      return usernameKey;
    } else {
      return null;
    }
  }

  static Future<String> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nama = prefs.getString(_namaPengguna);
    if (nama != null) {
      return nama;
    } else {
      return null;
    }
  }

  static Future<int> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt(_idPengguna);
    if (id != null) {
      return id;
    } else {
      return null;
    }
  }

  static Future<String> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String password = prefs.getString(_password);
    if (password != null) {
      return password;
    } else {
      return null;
    }
  }

  static Future<Data> getDataPengguna() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nama = prefs.getString(_namaPengguna);
    String usernameKey = prefs.getString(_usernamePengguna);
    String password = prefs.getString(_password);
    int id = prefs.getInt(_idPengguna);
    Data pengguna = Data(
        idPengguna: id.toString(),
        namaPengguna: nama,
        username: usernameKey,
        password: password);
    if (pengguna != null) {
      return pengguna;
    } else {
      return null;
    }
  }

  static Future<void> deleteSharedPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
