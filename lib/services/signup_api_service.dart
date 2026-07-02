import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupApiService {
  Future<void> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse("http://172.18.228.58:3000/users"),
      headers: {
        "Content-type" : "application/json"
      },
      body: jsonEncode(userData)
    );
    if(response.statusCode == 201) {
      //print('user created');
      //print(response.body);
    }
    else {
      //print('failed');
    }
  }
}