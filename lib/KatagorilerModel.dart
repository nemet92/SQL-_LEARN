class KatagoriModel {
  int? id;
  String? ad;
  bool? aktif;

  KatagoriModel({this.id, this.ad, this.aktif});

  KatagoriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ad = json['ad'];
    aktif = json['aktif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ad'] = ad;
    data['aktif'] = aktif;
    return data;
  }
}
