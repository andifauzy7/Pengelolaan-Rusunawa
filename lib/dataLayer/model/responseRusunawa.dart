class ResponseRusunawa {
  bool success;
  String message;
  List<Rusunawa> data;

  ResponseRusunawa({this.success, this.message, this.data});

  ResponseRusunawa.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Rusunawa>();
      json['data'].forEach((v) {
        data.add(new Rusunawa.fromJson(v));
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

class Rusunawa {
  String idRusunawa;
  String nama;
  String lokasi;
  String luasBangunan;
  String luasTanah;
  String kuota;
  String penghuni;
  String jangkaPemeliharaan;
  String kondisiGedung;
  String gambar;
  String createdAt;

  Rusunawa(
      {this.idRusunawa,
        this.nama,
        this.lokasi,
        this.luasBangunan,
        this.luasTanah,
        this.kuota,
        this.penghuni,
        this.jangkaPemeliharaan,
        this.kondisiGedung,
        this.gambar,
        this.createdAt});

  Rusunawa.fromJson(Map<String, dynamic> json) {
    idRusunawa = json['id_rusunawa'];
    nama = json['nama'];
    lokasi = json['lokasi'];
    luasBangunan = json['luas_bangunan'];
    luasTanah = json['luas_tanah'];
    kuota = json['kuota'];
    penghuni = json['penghuni'];
    jangkaPemeliharaan = json['jangka_pemeliharaan'];
    kondisiGedung = json['kondisi_gedung'];
    gambar = json['gambar'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_rusunawa'] = this.idRusunawa;
    data['nama'] = this.nama;
    data['lokasi'] = this.lokasi;
    data['luas_bangunan'] = this.luasBangunan;
    data['luas_tanah'] = this.luasTanah;
    data['kuota'] = this.kuota;
    data['penghuni'] = this.penghuni;
    data['jangka_pemeliharaan'] = this.jangkaPemeliharaan;
    data['kondisi_gedung'] = this.kondisiGedung;
    data['gambar'] = this.gambar;
    data['created_at'] = this.createdAt;
    return data;
  }
}