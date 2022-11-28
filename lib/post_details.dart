import 'package:class_project/model/comment_model.dart';
import 'package:class_project/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'api/ApiService.dart';

class PostDetails extends StatelessWidget {

  String postTitle;
  String postBody;
  int postID;

  PostDetails({Key? key, required this.postTitle, required this.postBody, required this.postID}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postTitle),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('$postTitle',  style: TextStyle(fontSize: 25, color: Colors.red),),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description:',  style: TextStyle(fontSize: 20, color: Colors.orange),),
          ),
          Container(
          //  height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            padding: EdgeInsets.all(10),
            child: Text(postBody,  style: TextStyle(fontSize: 17, color: Colors.black),),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Comment List:',  style: TextStyle(fontSize: 20, color: Colors.orange),),
          ),
          Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            padding: EdgeInsets.all(3),
            child: FutureBuilder<List<Comment>>(
                future: ApiService.getCommentByPost(postID.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final List<Comment>? comments = snapshot.data;
                    return ListView.builder(
                      itemCount: comments!.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            // leading: Container(child: Text(posts[index].id.toString()),),
                            title: Text(
                              comments[index].body.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Name: ${comments[index].name.toString()}', maxLines: 1,),
                                  Text('Email: ${comments[index].email.toString()}', maxLines: 1,),
                                ],
                              ),
                            )
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                }
            ),
          )
        ],
      ),
    );
  }
}
