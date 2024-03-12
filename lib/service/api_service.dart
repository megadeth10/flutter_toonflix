import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/service/data/webtoon_detail_model.dart';
import 'package:toonflix/service/data/webtoon_episode_model.dart';
import 'package:toonflix/service/data/webtoon_model.dart';

class ApiService {
  static const String _hostUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String _today = 'today';

  static Future<List<WebToonModel>> getTodays() async {
    List<WebToonModel> toons = [];
    final url = Uri.parse("$_hostUrl/$_today");
    var response = await http.get(url);
    // print("getTodays() statuscode: ${response.statusCode}");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (final item in json) {
        final mapData = WebToonModel.formJson(item);
        // print("getTodays() jons: ${mapData.title}");
        toons.add(mapData);
      }
      return toons;
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getEpisodeByid(String id) async {
    final url = Uri.parse("$_hostUrl/$id/episodes");
    List<WebtoonEpisodeModel> list = [];

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var episode in json) {
        list.add(WebtoonEpisodeModel.formJson(episode));
      }
      // print("getEpisodeByid() list: $list");
      return list;
    }

    throw Error();
  }

  static Future<WebtoonDetailModel> getDetailbyId(String id) async {
    var url = Uri.parse('$_hostUrl/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      WebtoonDetailModel model = WebtoonDetailModel.formJson(json);
      // print("getDetailbyId() model: ${model.about}");
      return model;
    }
    throw Error();
  }
}
