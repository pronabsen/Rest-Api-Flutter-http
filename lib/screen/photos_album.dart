import 'package:flutter/material.dart';

import '../api/ApiService.dart';
import '../model/photo_model.dart';

class PhotosAlbum extends StatelessWidget {
  int id;
  String name;

  PhotosAlbum({Key? key, required this.id, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album: $name'),
      ),
      body: Container(
        child: FutureBuilder<List<Photo>>(
          future: ApiService.getPhotosByAlbum(id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {

            //  print(snapshot.data);
              final List<Photo>? posts = snapshot.data;

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.90,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //   Get.to(BookDetailsScreen(), arguments: [snapshot.data![index].id, snapshot.data![index].bookName]);
                    //  Navigator.pushNamed(context, BookDetailsScreen.routeName,
                     //     arguments: [snapshot.data![index].id, snapshot.data![index].bookName]);
                      // toast(snapshot.data![index].id.toString());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth, image: NetworkImage(posts![index].url.toString())
                              ),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                              color: Colors.redAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //const SizedBox(height: 6,),
                                Text(posts[index].title.toString(), style: TextStyle(fontSize: 20),maxLines: 2,),
                             //   Text(snapshot.data![index].bookAuthor, style: secondaryTextStyle(),maxLines: 1,)
                              ],
                            ),
                          )
                        ],
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