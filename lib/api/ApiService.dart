import 'dart:convert';
import 'dart:developer';
import 'package:class_project/model/comment_model.dart';
import 'package:class_project/model/photo_model.dart';
import 'package:class_project/model/todo_model.dart';
import 'package:class_project/model/user_model.dart';
import 'package:http/http.dart';
import '../model/album_model.dart';
import '../model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String postsURL = "https://jsonplaceholder.typicode.com/posts";
  static String postsCommentURL = "https://jsonplaceholder.typicode.com/comments?postId=";
  static String albumURL = "https://jsonplaceholder.typicode.com/albums";
  static String photosByAlbumURL = "https://jsonplaceholder.typicode.com/albums/";
  static String photosURl = "https://jsonplaceholder.typicode.com/photos";
  static String usersURl = "https://jsonplaceholder.typicode.com/users";
  static String todoURL = "https://jsonplaceholder.typicode.com/todos";
  static String commentURL = "https://jsonplaceholder.typicode.com/comments";

  static Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  static Future<List<Comment>> getCommentByPost(String id) async {
    Response res = await get(Uri.parse(postsCommentURL+id));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Comment> posts = body.map((dynamic item) => Comment.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve commnet.";
    }
  }


  static Future<List<Comment>> getComment() async {
    Response res = await get(Uri.parse(commentURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Comment> posts = body.map((dynamic item) => Comment.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve commnet.";
    }
  }

  static Future<List<Album>> getAlbum() async {
    Response res = await get(Uri.parse(albumURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Album> posts = body.map((dynamic item) => Album.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve Album.";
    }
  }
  static Future<List<Todo>> getTodo() async {
    Response res = await get(Uri.parse(todoURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Todo> posts = body.map((dynamic item) => Todo.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve Todo.";
    }
  }

  static Future<List<Photo>> getPhotosByAlbum(String id) async {
    Response res = await get(Uri.parse('https://jsonplaceholder.typicode.com/albums/${id}/photos'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Photo> posts = body.map((dynamic item) => Photo.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve Album.";
    }
  }

  static Future<List<Photo>> getPhotos() async {
    Response res = await get(Uri.parse(photosURl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Photo> posts = body.map((dynamic item) => Photo.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve Album.";
    }
  }


  static Future<List<UserModel>> getUsers() async {

    Response res = await get(Uri.parse(usersURl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<UserModel> posts = body.map((dynamic item) => UserModel.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve Album.";
    }
  }

}