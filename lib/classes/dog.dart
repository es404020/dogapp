import 'dart:core';

import 'package:flutter/material.dart';

class Dog{

  String dog;
  String description;
  String dog_url;
  String postid;
  String email;
 String date;


  Dog({this.dog,this.dog_url,this.description,this.email,this.postid,this.date});

  Dog.fromJson(Map<String, dynamic> json)
      : dog = json['dog'],
        description = json['description'] ,
        dog_url = json['dog_url'],
        postid= json['postid'],
        email= json['email'],
        date= json['date'];






  ToJson(Dog dog){
    var result= {
      'dog':dog.dog,
      'description':dog.description,
      'dog_ur':dog.dog_url,
      'postid':dog.postid,
      'email':dog.email,
      'date':dog.date


    };
    return result;
  }

}