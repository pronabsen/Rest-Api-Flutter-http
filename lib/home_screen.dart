import 'package:class_project/album_list.dart';
import 'package:class_project/comment_list.dart';
import 'package:class_project/photos_list.dart';
import 'package:class_project/post_list.dart';
import 'package:class_project/todo_list.dart';
import 'package:class_project/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
           children: [
             InkWell(
               onTap: () {
                 Get.to(PostList());
               },
               child: Card(
                 color: Colors.green,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 elevation: 5,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Image(
                       image: NetworkImage('https://cdn-icons-png.flaticon.com/512/1999/1999310.png', ), height: 80,),
                     Container(
                       padding: const EdgeInsets.all(10),
                       decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                      //   color: Colors.blue[400]
                       ),
                       child: const Text('POST', style: TextStyle(fontSize: 20, color: Colors.white),))
                   ],
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 Get.to(AlbumList());
               },
               child: Card(
                 color: Colors.green,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 elevation: 5,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Image(
                       image: NetworkImage('https://cdn-icons-png.flaticon.com/512/1999/1999310.png', ), height: 80,),
                     Container(
                       padding: const EdgeInsets.all(10),
                       decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                      //   color: Colors.blue[400]
                       ),
                       child: const Text('ALBUM', style: TextStyle(fontSize: 20, color: Colors.white),))
                   ],
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 Get.to(PhotosList());
               },
               child: Card(
                 color: Colors.green,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 elevation: 5,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Image(
                       image: NetworkImage('https://cdn-icons-png.flaticon.com/512/1999/1999310.png', ), height: 80,),
                      Container(
                       padding: const EdgeInsets.all(10),
                       decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                      //   color: Colors.blue[400]
                       ),
                       child: const Text('PHOTOS', style: TextStyle(fontSize: 20, color: Colors.white),))
                   ],
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 Get.to(UserList());
               },
               child: Card(
                 color: Colors.green,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 elevation: 5,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Image(
                       image: NetworkImage('https://cdn-icons-png.flaticon.com/512/1999/1999310.png', ), height: 80,),
                     Container(
                       padding: const EdgeInsets.all(10),
                       decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                      //   color: Colors.blue[400]
                       ),
                       child: const Text('USER', style: TextStyle(fontSize: 20, color: Colors.white,)))
                   ],
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 Get.to(TodoList());
               },
               child: Card(
                 color: Colors.green,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 elevation: 5,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Image(
                       image: NetworkImage('https://cdn-icons-png.flaticon.com/512/1999/1999310.png', ), height: 80,),
                     Container(
                       padding: const EdgeInsets.all(10),
                       decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                      //   color: Colors.blue[400]
                       ),
                       child: const Text('TODO', style: TextStyle(fontSize: 20, color: Colors.white,)))
                   ],
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 Get.to(CommentList());
               },
               child: Card(
                 color: Colors.green,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 elevation: 5,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Image(
                       image: NetworkImage('https://cdn-icons-png.flaticon.com/512/1999/1999310.png', ), height: 80,),
                     Container(
                     //  alignment: Alignment.center,
                       padding: const EdgeInsets.all(10),
                       decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                      //   color: Colors.blue[400]
                       ),
                       child: const Text('COMMENT', style: TextStyle(fontSize: 20, color: Colors.white,)))
                   ],
                 ),
               ),
             ),
           ],
        ),
      ),
    );
  }
}
