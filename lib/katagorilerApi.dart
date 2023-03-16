import 'package:http/http.dart' as http;

class KatagorilerApi {
  String apiBaseUrl = "192.168.1.103:45455";

  Future<String> getKategoriler() async {
    String path = "/api/Kategoriler/getKategoriler";
    Uri uri = Uri.https(apiBaseUrl, path);
    var header = {'Content-Type': 'application/json:charset=UTF-8'};
    return http.post(uri, headers: header).then((response) {
      int statusCode = response.statusCode;
      String donenDeger = response.body.toString();
      print(donenDeger);
      return "";
    });
  }
}
