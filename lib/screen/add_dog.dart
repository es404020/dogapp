import 'dart:io';

import 'package:dogapp/ui/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/classes/main.dart';
import 'package:provider/provider.dart';
import 'package:dogapp/service/main.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class AddPost extends StatefulWidget {
  static const id = '/add';
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  final name = TextEditingController();
  final description = TextEditingController();
 String dog_url  = '';
  DogService dogservices = new DogService();
 File _imageFile;
 bool _loading= false;

 final FirebaseStorage _storage = FirebaseStorage(storageBucket: 'gs://dogapp-a20f7.appspot.com/');
 String Url;
  StorageUploadTask _uploadTask;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);


    
    return Scaffold(

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon:Icon(Icons.photo_camera),
              onPressed: ()=>_pickImage(ImageSource.camera),
            ),
            IconButton(
                icon:Icon(Icons.photo_library),
              onPressed: ()=>_pickImage(ImageSource.gallery),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Add DOG"),
        backgroundColor: Colors.blue,
      ),
      body:  ModalProgressHUD(
        child: Center(

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
              if(_imageFile != null) ...[
                Image.file(_imageFile,width: 100.0,height: 100,),

                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                )
              ],

              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  _submit(name,description,user);

                },
                child: const Text(
                    'Add DOG',
                    style: TextStyle(fontSize: 20)
                ),
              ),

            ],
          )
        ),
        inAsyncCall: _loading,
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  _clear(){
    setState(() {
      _imageFile = null;
    });
  }

  Future _submit(name,desc,user){
    _loading = true;

    String filePath = '${DateTime.now()}.png';

    setState(() {

      _uploadTask = _storage.ref().child(filePath).putFile(_imageFile);


      _uploadTask.onComplete.then((res) async =>{
        Url = await res.ref.getDownloadURL(),
        dog_url = Url.toString(),

      if(name.text == '' || description.text =='' || dog_url=='' ){

          AlertManger(context, "Incomplete input"),
        _loading = false
    }
      else{

      dogservices.addDog(Dog(dog: name.text,dog_ur: dog_url,description: desc.text,postid: '',email: user?.email)).then((res)=>{

      AlertManger(context, "Dog was added"),
      name.text='',description.text='',dog_url='',
_loading = false,
      _clear()



      }).catchError((err)=>{

_loading = false,
      AlertManger(context, "Something went wrong")


      })


      }

      });

    });



  }

}
