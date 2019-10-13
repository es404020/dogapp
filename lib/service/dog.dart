
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/classes/main.dart';


class  DogService{




  Future<DocumentSnapshot> addDog(Dog dog) async{

    var dogInfo = new Dog().ToJson(dog);




    final result= await Firestore.instance.collection('dog').add(dogInfo);

    try{

      result.get().then((res){
        print(res.documentID);

        Firestore.instance.collection('dog').document(res.documentID).updateData({
          'postid':res.documentID,
          'date':Timestamp.now()
        });

      });

    }
    catch(err){

 throw err;

    }



  }


Future deleteDog(String ID) async{

    try{

      final result = Firestore.instance.collection("dog").document(ID).delete();

    }catch(err){

      throw err;

    }
}





}