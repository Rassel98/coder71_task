import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;


class BaseService {
  BaseService._init();
  static Future<dynamic> getData({
    required String api,
  }) async {
    try {
      var response = await http.get(Uri.parse(api),);
      // log('GET status: ${response.statusCode}');
      // log('GET response: ${response.body}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
