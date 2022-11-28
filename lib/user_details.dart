import 'package:class_project/model/user_model.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  UserModel userModel;

  UserDetails({Key? key, required UserModel this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.name),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Name: ${userModel.name}', style: TextStyle(fontSize: 16, color: Colors.black),),
            SizedBox(height: 10,),
            Text('Email: ${userModel.email}', style: TextStyle(fontSize: 16, color: Colors.black),),
            SizedBox(height: 10,),
            Text('Username: ${userModel.username}', style: TextStyle(fontSize: 16, color: Colors.black),),
            SizedBox(height: 10,),
            Text('Phone: ${userModel.phone}', style: TextStyle(fontSize: 16, color: Colors.black),),
            SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Address: ', style: TextStyle(fontSize: 16, color: Colors.black),),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text('Street: ${userModel.address.street}', style: TextStyle(fontSize: 16, color: Colors.black),),
                     Text('Suite: ${userModel.address.suite}', style: TextStyle(fontSize: 16, color: Colors.black),),
                     Text('City: ${userModel.address.city}', style: TextStyle(fontSize: 16, color: Colors.black),),
                     Text('Zipcode: ${userModel.address.zipcode}', style: TextStyle(fontSize: 16, color: Colors.black),),
                   ],
               )
              ],
            ),

            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Location: ', style: TextStyle(fontSize: 16, color: Colors.black),),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text('Latitude: ${userModel.address.geo.lat}', style: TextStyle(fontSize: 16, color: Colors.black),),
                     Text('Longitude: ${userModel.address.geo.lng}', style: TextStyle(fontSize: 16, color: Colors.black),),
                   ],
               )
              ],
            ),
            SizedBox(height: 10,),
            Text('Website: ${userModel.website}', style: TextStyle(fontSize: 16, color: Colors.black),),
            SizedBox(height: 10,),
            const Text('Company: ', style: TextStyle(fontSize: 16, color: Colors.black),),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Name: ${userModel.company.name}', style: TextStyle(fontSize: 16, color: Colors.black),),
                    Text('CP: ${userModel.company.catchPhrase}', style: TextStyle(fontSize: 16, color: Colors.black),maxLines: 2,),
                    Text('BS: ${userModel.company.bs}', style: TextStyle(fontSize: 16, color: Colors.black),),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
