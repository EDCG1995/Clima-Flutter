import 'package:http/http.dart' as html;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    try {
      html.Response response = await html.get(url);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Code: ' + response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
