import 'package:class_project/model/user_model.dart';
import 'package:class_project/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/ApiService.dart';
class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Container(
        child: FutureBuilder<List<UserModel>>(
          future: ApiService.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<UserModel>? posts = snapshot.data;
              return ListView.builder(
                itemCount: posts!.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                     // print(posts[index]);
                      Get.to(UserDetails(userModel: posts[index],));
                    },
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                         leading: Text(posts[index].id.toString()),
                        title: Text(
                          posts[index].name.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(posts[index].email.toString(), maxLines: 2,),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
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
