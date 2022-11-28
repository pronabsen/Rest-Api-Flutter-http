import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));
String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {

  final int id;
  final String ? name;
  final String ? email;
  final String ? body;


  Comment({required this.id, this.name, this.email, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body']
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'body' : body,
  };

}