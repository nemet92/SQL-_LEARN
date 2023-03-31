import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loginsql/KatagorilerModel.dart';

// ignore: avoid_print
// print("status code ${response.statusCode}");
// List jsonResponse = json.decode(response.body) as List;
// ignore: avoid_print
// return (jsonDecode(response.body) as List)
//     .map((e) => KatagoriModel.fromJson(e))
//     .toList();

class KatagorilerApi {
  String apiBaseUrl = "192.168.1.117:45455";
  String path = "/api/Kategoriler/getKategoriler";

  Future<List<KatagoriModel>> getKatagoriler() async {
    final response = await http.get(Uri.https(apiBaseUrl, path),
        headers: {'Content-Type': 'application/json:charset=UTF-8'});
    // String donenDeger = response.body.toString();
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      // print(response.statusCode);
      // print(jsonResponse);
      // List<KatagoriModel> model = [];
      // print(donenDeger);
      return jsonResponse.map((e) => KatagoriModel.fromJson(e)).toList();
    } else {
      throw Exception("504");
    }
    // List<KatagoriModel> modelim = (jsonDecode(donenDeger) as List)
    //     .map((e) => KatagoriModel.fromJson(e))
    //     .toList();
    // return modelim;
  }

  // Future<String> getKategoriler() async {
  //   String path = "/api/Kategoriler/getKategoriler";
  //   Uri uri = Uri.https(apiBaseUrl, path);
  //   var header = {'Content-Type': 'application/json:charset=UTF-8'};

  //   return http.post(uri, headers: header).then((response) {
  //     int statusCode = response.statusCode;
  //     print("status code $statusCode");
  //     String donenDeger = response.body.toString();
  //     print("dopnen$donenDeger");
  //     return "";
  //   });
  // }

  Future<int> addKategoriler(KatagoriModel model) async {
    var path = "/api/Kategoriler/setKategoriler";
    Uri uri = Uri.https(apiBaseUrl, path);
    var header = {'Content-Type': 'application/json'};
    String jsonText = json.encode(model);
    print("!!$jsonText");
    return http.post(uri, headers: header, body: jsonText).then((responce) {
      String jsonum = responce.body.toString();
      if (responce.statusCode == 200) {
        print("Hata");
      }

      return responce.statusCode;
    });
  }
}
