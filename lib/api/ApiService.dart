import 'dart:convert';
import 'package:class_project/model/comment_model.dart';
import 'package:class_project/model/photo_model.dart';
import 'package:class_project/model/todo_model.dart';
import 'package:class_project/model/user_model.dart';
import 'package:http/http.dart';
import '../model/album_model.dart';
import '../model/post_model.dart';
import 'package:http/http.dart' as http;
import 'ApiConstants.dart';
class ApiService {


  static Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(ApiConstants.postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  static Future<List<Comment>> getCommentByPost(String id) async {
    Response res = await get(Uri.parse(ApiConstants.postsCommentURL+id));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Comment> posts = body.map((dynamic item) => Comment.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve comment.";
    }
  }


  static Future<List<Comment>> getComment() async {
    Response res = await get(Uri.parse(ApiConstants.commentURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Comment> posts = body.map((dynamic item) => Comment.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve comment.";
    }
  }

  static Future<List<Album>> getAlbum() async {
    Response res = await get(Uri.parse(ApiConstants.albumURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Album> posts = body.map((dynamic item) => Album.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve Album.";
    }
  }
  static Future<List<Todo>> getTodo() async {
    Response res = await get(Uri.parse(ApiConstants.todoURL));

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
    Response res = await get(Uri.parse(ApiConstants.photosURl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Photo> posts = body.map((dynamic item) => Photo.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve Album.";
    }
  }


  static Future<List<UserModel>> getUsers() async {

    Response res = await get(Uri.parse(ApiConstants.usersURl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<UserModel> posts = body.map((dynamic item) => UserModel.fromJson(item),).toList();
      return posts;
    } else {
      throw "Unable to retrieve Album.";
    }
  }

}