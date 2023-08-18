import 'dart:convert';
import 'package:flutter_task_ubs/univ.dart';
import 'package:http/http.dart' as http;

class SongsRepository {
  Future<List<Univ>> fetchUnivs() async {
    final request = http.Request(
      'GET',
      Uri.parse('http://universities.hipolabs.com/search?country=United+States'),
    );

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseData = await response.stream.bytesToString();

      if (responseData.isNotEmpty) {
        List<dynamic> jsonData = jsonDecode(responseData);
        List<Univ> songs = jsonData.map((json) => Univ.fromJson(json)).toList();
        return Future.value(songs);
      } else {
        return Future.value([]);
      }
    } else {
      return Future.error("Failed fetching ");
    }
  }
}