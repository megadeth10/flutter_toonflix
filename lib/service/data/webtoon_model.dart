class WebToonModel {
  final String title;
  final String thumb;
  final String id;

  WebToonModel.formJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

  @override
  String toString() {
    print("WebToonModel model - title: $title, id: $id, thumb: $thumb");
    return super.toString();
  }
}
