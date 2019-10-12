import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dog{

  String dog;
  String description;
  String dog_ur;
  String postid;
  String email;
 Timestamp date;


  Dog({this.dog,this.dog_ur,this.description,this.email,this.postid,this.date});

  Dog.fromJson(Map<String, dynamic> json)
      : dog = json['dog'],
        description = json['description'] ,
        dog_ur = json['dog_ur'],
        postid= json['postid'],
        email= json['email'],
        date= json['date'];






  ToJson(Dog dog){
    var result= {
      'dog':dog.dog,
      'description':dog.description,
      'dog_ur':dog.dog_ur,
      'postid':dog.postid,
      'email':dog.email,
      'date':dog.date


    };
    return result;
  }

}