class ResponseInfoRusunawa {
  bool success;
  String message;
  List<InfoRusunawa> data;

  ResponseInfoRusunawa({this.success, this.message, this.data});

  ResponseInfoRusunawa.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<InfoRusunawa>();
      json['data'].forEach((v) {
        data.add(new InfoRusunawa.fromJson(v));
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

class InfoRusunawa {
  String totalRusunawa;
  String rusunawaPerbaikan;

  InfoRusunawa({this.totalRusunawa, this.rusunawaPerbaikan});

  InfoRusunawa.fromJson(Map<String, dynamic> json) {
    totalRusunawa = json['total_rusunawa'];
    rusunawaPerbaikan = json['rusunawa_perbaikan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_rusunawa'] = this.totalRusunawa;
    data['rusunawa_perbaikan'] = this.rusunawaPerbaikan;
    return data;
  }
}