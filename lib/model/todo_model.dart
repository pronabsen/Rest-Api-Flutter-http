import 'dart:convert';

List<Todo> todoFromJson(String str) => List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));
String todoToJson(List<Todo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {

  final int id;
  final String ? title;
  final bool completed;


  Todo({required this.id, this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed']
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'completed' : completed,
  };

}