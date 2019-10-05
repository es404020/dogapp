import 'package:flutter/material.dart';
import 'package:dogapp/classes/main.dart';


class AddPost extends StatefulWidget {
  static const id = '/add';
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  final name = TextEditingController();
  final description = TextEditingController();
  final dog_url  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Add DOG"),
        backgroundColor: Colors.blue,
      ),
      body: Center(

        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
        TextField(
          controller: name,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Dog Name',
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
          ),
        ),
      ),TextField(
              controller:description,
              maxLines: 4,
      decoration: InputDecoration(

          border: InputBorder.none,
          hintText: 'Description',
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
        ),
      ),
    ),
      TextField(
        controller:dog_url,

        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'dog url',
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
          ),
        ),
      ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
             if(name.text == '' || description.text =='' || dog_url.text=='' ){

                showDialog(
                 context: context,
                 builder: (context) {
                   return AlertDialog(
                     // Retrieve the text the user has entered by using the
                     // TextEditingController.
                     content: Text('Some field are empty'),
                   );
                 },
               );

             }
             else{
         var dog =    Dog(dog: name.text,dog_url: dog_url.text,description: description.text);



             }

              },
              child: const Text(
                  'Add DOG',
                  style: TextStyle(fontSize: 20)
              ),
            ),

          ],
        )
      ),
    );
  }
}
