import 'package:class_project/model/comment_model.dart';
import 'package:flutter/material.dart';

import '../api/ApiService.dart';
class CommentList extends StatelessWidget {
  const CommentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment List'),
      ),
      body: Container(
        child: FutureBuilder<List<Comment>>(
          future: ApiService.getComment(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<Comment>? posts = snapshot.data;
              return ListView.builder(
                itemCount: posts!.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){

                      // Create AlertDialog
                      showAlertDialog(context, posts[index].body.toString());
                    },
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        //leading: Text(posts[index].id.toString()),
                        title: Text(
                          posts[index].body.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Name: ${posts[index].name.toString()}', maxLines: 1,),
                              Text('Email: ${posts[index].email.toString()}', maxLines: 1,),
                            ],
                          ),
                        ),
                        trailing: Icon(Icons.remove_red_eye_outlined, color: Colors.blue,),
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

  showAlertDialog(BuildContext context, String body) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Comment Info'),
      content: Text(body),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
