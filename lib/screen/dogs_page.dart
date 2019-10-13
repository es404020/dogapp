import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/classes/dog.dart';
import 'package:dogapp/service/main.dart';
import 'package:dogapp/ui/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/screen/main.dart';
import 'package:provider/provider.dart';
class DogPages extends StatefulWidget {
  static const id = '/dogs';

  @override
  _DogPagesState createState() => _DogPagesState();
}

class _DogPagesState extends State<DogPages> {
  @override
  Widget build(BuildContext context) {

    var user = Provider.of<FirebaseUser>(context);

    DogService service  = new DogService();
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
                  trailing: dog.email == user?.email?
                  InkWell(
                    onTap: (){
                      service.deleteDog(dog.postid).then((res){

                        AlertManger(context, "Information removed");

                      }).catchError((err)=>{

                        AlertManger(context, "Hoops , Something went wrong")

                      });
                    },
                    child: Icon(Icons.delete),
                  ):
                  Icon(Icons.forward),
                  leading: CircleAvatar(backgroundImage: NetworkImage(dog.dog_ur,),),
                  subtitle: Text(dog.dog),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        DogPage.id, arguments: "123456");
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

