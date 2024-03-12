import 'package:toonflix/service/data/webtoon_model.dart';

class WebtoonStore {
  static final WebtoonStore _instance = WebtoonStore._create();
  List<WebToonModel> _list = [];
  factory WebtoonStore() {
    return _instance;
  }
  WebtoonStore._create();

  void setList(List<WebToonModel> list) {
    _list = list;
  }

  List<WebToonModel> getList() {
    return _list;
  }
}
