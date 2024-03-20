import 'dart:convert';

import 'package:webtoon_app/models/webtoon_detail_model.dart';
import 'package:webtoon_app/models/webtoon_episode_model.dart';
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

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseurl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return WebtoonDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodes(String id) async {
    List<WebtoonEpisodeModel> episodeInstances = [];
    final url = Uri.parse('$baseurl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var epi in episodes) {
        episodeInstances.add(WebtoonEpisodeModel.fromJson(epi));
      }
      return episodeInstances;
    }
    throw Error();
  }
}
