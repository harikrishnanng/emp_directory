import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class EmployeeService {
  final String _url = 'http://www.mocky.io/v2/5d565297300000680030a986';

  Future<dynamic> getEmployees() async {
    try {
      final response = await http.get(_url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } on SocketException {
      throw Exception('No InetNet Connection');
    }
  }
}
