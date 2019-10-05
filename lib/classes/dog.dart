

class Dog{

  String dog;
  String description;
  String dog_url;
  String postid;
  String email;


  Dog({this.dog,this.dog_url,this.description,this.email,this.postid});

  Dog.fromJson(Map<String, dynamic> json)
      : dog = json['dog'],
        description = json['description'] ,
        dog_url = json['dog_url'],
        postid= json['postid'],
        email= json['email'];





  ToJson(Dog dog){
    var result= {
      'dog':dog.dog_url,
      'description':dog.description,
      'dog_ur':dog.dog_url,
      'postid':dog.postid,
      'email':dog.email


    };
    return result;
  }

}