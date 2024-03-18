import 'package:brand_news_app/models/source_model.dart';
import 'package:brand_news_app/network/api_manager.dart';
import 'package:flutter/cupertino.dart';

class CategoryViewModel extends ChangeNotifier {
  List<SourceModel> _sourcesList = [];

  List<SourceModel> get sourcesList => _sourcesList;

  Future<void> getDataSources(String categoryId) async {
    // no
    try {
      List<SourceModel> sources = await ApiManager.fetchDataSources(categoryId);
      _sourcesList = sources;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }
}
