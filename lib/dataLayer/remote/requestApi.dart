import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RequestApi {
  static final String apiUrl = "andifauzy.xyz";

  static Future<bool> registerPengguna(Map<String, dynamic> data) async {
    var uri = Uri.http(apiUrl, 'pengguna');
    var result = await http.post(uri,
        body: data);
    log("registerPengguna (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> validasiPengguna(Map<String, dynamic> data) async {
    var uri = Uri.http(apiUrl, 'pengguna/validasi');
    var result = await http.post(uri,
        body: data);
    log("validasiPengguna (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  static Future loginPengguna(Map<String, dynamic> data) async {
    var uri = Uri.http(apiUrl, 'pengguna/login');
    var result = await http.post(uri,
        body: data);
    log("loginPengguna (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return json.decode(result.body);
    } else {
      return false;
    }
  }

  static Future<bool> editPengguna(Map<String, dynamic> data, String id) async {
    var uri = Uri.http(apiUrl, 'pengguna/${id}');
    var result = await http.put(uri,
        body: data);
    log("editPengguna (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }
}
