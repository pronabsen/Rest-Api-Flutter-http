import 'dart:convert';

List<Photo> photoFromJson(String str) => List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));
String photoToJson(List<Photo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photo {

  final int id;
  final String ? title;
  final String ? url;


  Photo({required this.id, this.title, this.url});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
      id: json['id'],
      title: json['title'],
      url: json['url']
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'url' : url,
  };

}