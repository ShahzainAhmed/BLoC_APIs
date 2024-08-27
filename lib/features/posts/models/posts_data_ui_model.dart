// Use quicktype.io for JSON serialization of Models

class PostsDataUiModel {
  int userId;
  int id;
  String title;
  String body;

  PostsDataUiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsDataUiModel.fromJson(Map<String, dynamic> json) =>
      PostsDataUiModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
