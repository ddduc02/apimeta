import 'dart:convert';
import 'package:http/http.dart' as http;

const String _BaseURL = "http://45.117.177.90:5005";

class ApiClient {
  Future<Map<String, dynamic>> checkEmail(String email) async {
    final response = await http.post(
      Uri.parse('$_BaseURL/check-email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );
    final jsonResponse = json.decode(response.body);
    return jsonResponse;
  }

  Future<Map<String, dynamic>> checkPassword(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$_BaseURL/check-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    // Nếu yêu cầu thành công, parse dữ liệu JSON
    final jsonResponse = json.decode(response.body);
    return jsonResponse;
  }

  Future<Map<String, dynamic>> checkTwoFa(
      String email, String password, String towfa) async {
    print("check email $email");
    print("check email $password");
    print("check email $towfa");
    final response = await http.post(
      Uri.parse('$_BaseURL/check-towfa'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        "towfa": towfa
      }),
    );
    // Nếu yêu cầu thành công, parse dữ liệu JSON
    final jsonResponse = json.decode(response.body);

    return jsonResponse;
  }
}
