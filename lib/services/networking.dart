import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String domain;
  final String path;

  NetworkHelper(this.domain, this.path);

  Future getData() async {
    var url = Uri.https(domain, path);

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.body);
    }
  }
}
