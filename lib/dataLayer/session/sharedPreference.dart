import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static String _idPengguna = "ID_KEY";
  static String _usernamePengguna = "USERNAME_KEY";
  static String _namaPengguna = "NAMA_KEY";

  static Future<void> savePengguna(int id, String username, String nama) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_usernamePengguna, username);
    prefs.setString(_namaPengguna, nama);
    prefs.setInt(_idPengguna, id);
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
}