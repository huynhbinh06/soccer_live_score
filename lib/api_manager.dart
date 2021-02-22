import 'dart:convert';

import 'package:http/http.dart';
import 'package:soccer_live_score/soccermodel.dart';

class SoccerAPI {
  final String apiUrl = "https://v3.football.api-sports.io/fixtures?season=2020&league=39";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "5085c9d62f52b6f4f0b0486cd76c5f83"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl, headers: headers);
    var body;

    if (res.statusCode == 200) {

      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];

      print("API service: ${body}");

      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
      return matches;
    }
  }
}
