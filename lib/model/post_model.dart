import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {

  final int id;
  final String ? title;
  final String ? body;


  Post({required this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json['id'],
      title: json['title'],
      body: json['body']
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'body' : body,
  };

}