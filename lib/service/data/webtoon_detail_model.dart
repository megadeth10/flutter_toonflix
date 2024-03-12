class WebtoonDetailModel {
  final String title;
  final String about;
  final String genre;
  final String age;

  WebtoonDetailModel.formJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}

// {"thumb":"https://image-comic.pstatic.net/webtoon/790713/204/thumbnail_202x120_fe17408e-70f7-48f1-8dcc-b163215b89b1.jpg",
// "id":"204",
// "title":"외전7-동기의 졸업(1)",
// "rating":"9.98",
// "date":"24.02.19",
// },