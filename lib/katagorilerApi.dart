import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loginsql/KatagorilerModel.dart';

class KatagorilerApi {
  String apiBaseUrl = "192.168.1.103:45455";
  String path = "/api/Kategoriler/getKategoriler";

  Future<List> getKatagoriler() async {
    final response = await http.post(Uri.https(apiBaseUrl, path),
        headers: {'Content-Type': 'application/json:charset=UTF-8'});
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("status code ${response.statusCode}");
      // List jsonResponse = json.decode(response.body) as List;
      // ignore: avoid_print
      return (jsonDecode(response.body) as List)
          .map((e) => KatagoriModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Error");
    }
  }

  // modelim = (jsonDecode(jsonText) as List)
  //     .map((e) => KatagoriModel.fromJson(e))
  //     .toList();

  // Future<String> getKategoriler() async {

  //   String path = "/api/Kategoriler/getKategoriler";
  //   Uri uri = Uri.https(apiBaseUrl, path);
  //   var header = {'Content-Type': 'application/json:charset=UTF-8'};

  //   return http.get(uri, headers: header).then((response) {
  //     int statusCode = response.statusCode;
  //     print("status code $statusCode");
  //     String donenDeger = response.body.toString();
  //     print("dopnen$donenDeger");
  //     return "";
  //   });
  // }
}
