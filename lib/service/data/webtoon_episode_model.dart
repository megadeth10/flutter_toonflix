class WebtoonEpisodeModel {
  final String title;
  final String rating;
  final String date;
  final String id;

  WebtoonEpisodeModel.formJson(Map<String, dynamic> json)
      : title = json['title'],
        rating = json['rating'],
        date = json['date'],
        id = json['id'];
}
// {
//   "title":"대학원 탈출일지",
// "about":"연구에 꿈을 가지고 대학원을 선택한 병아리 요다.예상과는 다르게 연구에 관심 없는 교수님과 똥군기의 연구실 분위기에 당황한다.요다는 과연 무사히 대학원을 탈출할 수 있을 것인가?!",
// "genre":"에피소드, 일상",
// "age":"전체연령가",
// "thumb":"https://shared-comic.pstatic.net/thumb/webtoon/790713/thumbnail/thumbnail_IMAG06_77263d44-c238-47a1-94ea-4e187c0d6730.jpg",
// }