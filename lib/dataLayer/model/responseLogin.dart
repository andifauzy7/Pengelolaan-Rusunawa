class ResponseLogin {
  bool success;
  String message;
  List<Data> data;

  ResponseLogin({this.success, this.message, this.data});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String idPengguna;
  String namaPengguna;
  String username;
  String password;

  Data({this.idPengguna, this.namaPengguna, this.username, this.password});

  Data.fromJson(Map<String, dynamic> json) {
    idPengguna = json['id_pengguna'];
    namaPengguna = json['nama_pengguna'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pengguna'] = this.idPengguna;
    data['nama_pengguna'] = this.namaPengguna;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}