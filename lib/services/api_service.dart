import 'dart:convert';

import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseurl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> toons = [];
    final url = Uri.parse('$baseurl/today');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final List<dynamic> webtoonlist = jsonDecode(res.body);
      for (var webtoon in webtoonlist) {
        toons.add(WebtoonModel.fromJson(webtoon));
      }
      return toons;
    }
    throw Error();
  }
}
