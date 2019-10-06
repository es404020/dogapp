import 'package:flutter/material.dart';



AlertManger(context,message){
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // Retrieve the text the user has entered by using the
        // TextEditingController.
        content: Text(message),
      );
    },
  );
}