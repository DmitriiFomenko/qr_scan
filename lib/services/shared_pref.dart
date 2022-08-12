import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref();

  Future<void> saveJson({
    required String key,
    required Map<String, dynamic> json,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    const JsonEncoder encoder = JsonEncoder();
    final String jsonString = encoder.convert(json);

    await prefs.setString(key, jsonString);
  }

  Future<Map<String, dynamic>> loadJson({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    final String? data = prefs.getString(key);

    if (data == null) return <String, String>{};

    const JsonDecoder decoder = JsonDecoder();
    final Map<String, dynamic> json = decoder.convert(data);
    return json;
  }

  Future<void> remove({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(key);
  }
}
