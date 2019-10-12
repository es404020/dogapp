import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/classes/dog.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/screen/main.dart';

class DogPages extends StatefulWidget {
  static const id = '/dogs';

  @override
  _DogPagesState createState() => _DogPagesState();
}

class _DogPagesState extends State<DogPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).pushNamed(AddPost.id);
        },
        label: Text('Dog'),
        icon: Icon(Icons.add_circle),

      ),
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.blue,title: Text("dogapp"),),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('dog').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return ListView(

                children: snapshot.data.documents.map((DocumentSnapshot document){

                  Dog dog = new Dog.fromJson(document.data);

               return ListTile(
                  title: Text(dog.email),
                  leading: CircleAvatar(backgroundImage: NetworkImage(dog.dog_ur,),),
                  subtitle: Text(dog.dog),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        DogPage.id, arguments: dog.postid);
                  },
                );
        }).toList()
              );
          }
        }
      )


    );
  }
}

