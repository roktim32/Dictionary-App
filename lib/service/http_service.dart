import 'package:http/http.dart' as http;

class HttpService {
  static final baseURL = "https://api.dictionaryapi.dev/api/v2/entries/";
  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;
    final url = Uri.parse("$baseURL$endPoint");

    try {
      response = await http.get(url);
    } on Exception catch (e) {
      throw e;
    }
    return response;
  }
}
