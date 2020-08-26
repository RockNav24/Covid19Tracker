import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  String url;
  Networking({this.url});

  Future getResponse() async {
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return jsonData;
  }
}
