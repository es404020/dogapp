import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/classes/dog.dart';
import 'package:flutter/material.dart';



class DogPage extends StatefulWidget {
  static const id = '/dog';

  final String ids;

  DogPage({ @required this.ids});

  @override
  _DogPageState createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('dog').where('postid',isEqualTo: widget.ids).snapshots(),
      builder: (context, snapshot) {
          if(snapshot.data==null){
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.red),
            );
          }

          if(snapshot.hasError){
            return Center(
              child: Text("Something went wrong"),
            );
          }

          else{
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(backgroundColor: Colors.red),
                );
              default:
           Dog dog  = new Dog.fromJson(snapshot.data.documents[0].data);
                return Scaffold(


                  appBar: AppBar(title: Text(dog.dog),),
                  body: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Flexible(
                          fit: FlexFit.loose,
                          child: new Image.network(dog.dog_ur,
                            fit: BoxFit.contain,height: MediaQuery.of(context).size.height*0.4,width: MediaQuery.of(context).size.width,
                          ),
                        ),

                        Column(

                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                                child: Text("Dogs Description",style: TextStyle(fontSize: 12),)),

                            Container(
                                padding: EdgeInsets.only(top: 4,left: 12),
                                child: Text(dog.description))
                          ],
                        )




                      ],
                    ),
                  ),
                );
            }

          }

      }
    );
  }
}
