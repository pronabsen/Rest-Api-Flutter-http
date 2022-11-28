import 'dart:convert';

List<Album> albumFromJson(String str) => List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));
String albumToJson(List<Album> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {

  final int id;
  final String ? title;


  Album({required this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) => Album(
      id: json['id'],
      title: json['title'],
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
  };

}