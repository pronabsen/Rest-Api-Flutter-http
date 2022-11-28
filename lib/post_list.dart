
import 'dart:convert';

import 'package:class_project/api/ApiService.dart';
import 'package:class_project/model/post_model.dart';
import 'package:class_project/post_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model/user_model.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: ApiService.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<Post>? posts = snapshot.data;
              return ListView.builder(
                itemCount: posts!.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(PostDetails(postTitle: posts[index].title.toString(),postBody: posts[index].body.toString(),postID: posts[index].id.toInt(),));
                    },
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                       // leading: Container(child: Text(posts[index].id.toString()),),
                        title: Text(
                          posts[index].title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(posts[index].body.toString(), maxLines: 2,),
                        ),
                        trailing: Container(
                         //   alignment: Alignment.s,
                            child: Icon(Icons.arrow_forward_ios_rounded)),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }





}


