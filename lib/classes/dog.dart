

class Dog{

  String dog;
  String description;
  String dog_url;

  Dog({this.dog,this.dog_url,this.description});

  Dog.fromJson(Map<String, dynamic> json)
      : dog = json['dog'],
        description = json['description'] ,
        dog_url = json['dog_url'] ;


  ToJson(Dog dog){
    var result= {
      'dog':dog.dog_url,
      'description':dog.description,
      'dog_ur':dog.dog_url
    };
    return result;
  }

}