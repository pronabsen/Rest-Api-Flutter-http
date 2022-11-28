import 'package:class_project/model/album_model.dart';
import 'package:class_project/photos_album.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/ApiService.dart';


class AlbumList extends StatefulWidget {
  const AlbumList({Key? key}) : super(key: key);

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album List'),
      ),
      body: Container(
        child: FutureBuilder<List<Album>>(
          future: ApiService.getAlbum(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<Album>? posts = snapshot.data;
              return ListView.builder(
                itemCount: posts!.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                     Get.to(PhotosAlbum(id: posts[index].id.toInt(),name: posts[index].title.toString(),));
                    },
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Text(posts[index].id.toString()),
                        title: Text(
                          posts[index].title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
