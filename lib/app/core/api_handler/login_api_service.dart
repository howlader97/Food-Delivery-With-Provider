
import 'package:http/http.dart' as http;

class LoginApiService {
  static Future<dynamic> loginApiRequest(String url,Map<String,dynamic>body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body:body,
      );
      return response;
    } catch (e) {
      throw "Error is $e";
    }
  }
}
