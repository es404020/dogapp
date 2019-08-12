
import 'package:dogapp/screen/main.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/main.dart';



class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args  = settings.arguments;

    switch(settings.name){
      case MyHomePage.id:
        return MaterialPageRoute(builder: (_)=>MyHomePage());
      case DogPages.id:
        return MaterialPageRoute(builder: (_)=>DogPages());

      case  Auth.id:
        return MaterialPageRoute(builder: (_)=>Auth());

      case DogPage.id:

        if(args is String){
          return MaterialPageRoute(builder: (_)=>DogPage(ids: args,));
        }
       return _errorPage();

      case AddPost.id:
        return MaterialPageRoute(builder: (_)=>AddPost());
      default:
        return _errorPage();
    }


  }
  static Route<dynamic> _errorPage(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("error page"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}