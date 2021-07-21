import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RequestApi {
  static final String apiUrl = "andifauzy.xyz";

  // PENGGUNA
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

  // RUSUNAWA
  static Future<bool> insertRusunawa(Map<String, dynamic> data) async {
    var uri = Uri.http(apiUrl, 'rusunawa/insert');
    var result = await http.post(uri,
        body: data);
    log("insertRusunawa (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editRusunawa(Map<String, dynamic> data, String id) async {
    var uri = Uri.http(apiUrl, 'rusunawa/${id}');
    var result = await http.put(uri,
        body: data);
    log("editRusunawa (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteRusunawa(String id) async {
    var uri = Uri.http(apiUrl, 'rusunawa/${id}');
    var result = await http.delete(uri);
    log("deleteRusunawa (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  static Future getAllRusunawa() async {
    var uri = Uri.http(apiUrl, 'rusunawa/all');
    var result = await http.get(uri);
    log("getAllRusunawa (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return json.decode(result.body);
    } else {
      return false;
    }
  }

  static Future getAllPenggunaRusunawa(String id) async {
    var uri = Uri.http(apiUrl, 'rusunawa/pengguna/${id}');
    var result = await http.get(uri);
    log("getAllPenggunaRusunawa (CODE : ${result.statusCode}) : ${result.body}");
    if(result.statusCode == 200){
      return json.decode(result.body);
    } else {
      return false;
    }
  }
}
