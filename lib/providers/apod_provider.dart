import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:apod_app/models/ApodImage.dart';
import 'package:http/http.dart' as http;

class ApodProvider {
  final _apiKey = 'DEMO_KEY';
  final _url = 'api.nasa.gov';
  final _hd = 'true';

  Future<List<ApodImage>> _request(Uri url) async{
    final resp = await http.get(url);
    if(resp.statusCode == 200){
      final decodeData = json.decode(resp.body);
      final apodList = ApodList.fromJsonList(decodeData);
      return apodList.items;
    }
    return List<ApodImage>();
  }
  Future<List<ApodImage>> getRecentImages() async {
    final endDate = DateTime.now();
    final startDate = endDate.add(Duration(days: -5));
    final url = Uri.https(_url, 'planetary/apod',{
      'api_key' : _apiKey,
      'hd' : _hd,
      'start_date' : DateFormat('y-M-d').format(startDate),
      'end_date' : DateFormat('y-M-d').format(endDate)
    });
    return await _request(url);
  }
  Future<List<ApodImage>> getRandomImages() async {
    final url = Uri.https(_url, 'planetary/apod',{
      'api_key' : _apiKey,
      'hd' : _hd,
      'count' : '5',
    });
    return await _request(url);
  }
}