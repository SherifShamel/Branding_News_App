import 'dart:convert';

import 'package:brand_news_app/core/config/constants.dart';
import 'package:brand_news_app/models/source_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<List<SourceModel>> fetchDataSources(String categoryId) async {
    var url = Uri.https(Constants.baseURL, "/v2/top-headlines/sources", {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    });
    final response = await http.get(url);

    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      var sourcesList = data["sources"] as List;

      for (var element in sourcesList) {
        sourcesDataList.add(SourceModel.fromJson(element));
      }
      return sourcesDataList;
    } else {
      throw Exception('Failed to reload Data');
    }
  }
}
