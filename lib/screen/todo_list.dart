import 'package:class_project/model/todo_model.dart';
import 'package:flutter/material.dart';

import '../api/ApiService.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        child: FutureBuilder<List<Todo>>(
          future: ApiService.getTodo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<Todo>? posts = snapshot.data;
              return ListView.builder(
                itemCount: posts!.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                 //     Get.to(PostDetails(postTitle: posts[index].title.toString(),postBody: posts[index].body.toString(),postID: posts[index].id.toInt(),));
                    },
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Text(posts[index].id.toString()),
                        title: Text(
                          posts[index].title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: Text(posts[index].body.toString(), maxLines: 2,),
                        // ),
                        trailing: posts[index].completed ? Icon(Icons.close_rounded, color: Colors.red,) :
                        Icon(Icons.task_alt_rounded, color: Colors.green,),
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
