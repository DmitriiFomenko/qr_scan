import 'dart:convert' as convert;
import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:qr_scan/models/user.dart';

class MainRepository {
  MainRepository();

  final String _baseUrl = 'http://myServer.com/api';

  Future<void> registerUser({required User user}) async {
    final uri = Uri.parse('$_baseUrl/users');

    var request = http.MultipartRequest('POST', uri);

    String token = '123';

    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';

    request.fields.addAll(user.toJson() as Map<String, String>);

    if (user.imagePath != '') {
      var image = io.File(user.imagePath!);
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var length = await image.length();
      var multiport = http.MultipartFile('image', stream, length);

      request.files.add(multiport);
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      debugPrint('send post');
    } else {}
  }

  Future<void> putStatusBarrier(String name, String status) async {
    final uri = Uri.parse('$_baseUrl/barriers');

    var request = http.MultipartRequest('PUT', uri);

    String token = '123';

    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';

    request.fields[name] = status;

    var response = await request.send();
    if (response.statusCode == 200) {
      debugPrint('send put');
    } else {}
  }

  Future<String?> getBarrierStatus(String name) async {
    final uri = Uri.parse('$_baseUrl/barriers');

    String token = '123';

    var response =
        await http.get(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      String status = jsonResponse[name];
      return status;
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<String?> getToken() async {
    final uri = Uri.parse('$_baseUrl/tokens');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      String token = jsonResponse['token'];
      return token;
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
