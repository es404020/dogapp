import 'package:flutter/material.dart';


class DogPages extends StatefulWidget {
  @override
  _DogPagesState createState() => _DogPagesState();
}

class _DogPagesState extends State<DogPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.blue,title: Text("dogapp"),),
      body: SingleChildScrollView(
        child: Container(
          child: ListTile(
            title: Text("owners name"),
        leading:CircleAvatar(backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/chivel-9fd0b.appspot.com/o/WhatsApp%20Image%202019-07-30%20at%209.13.57%20AM.jpeg?alt=media&token=90d1d08c-684c-4862-bab6-777da4355ce9",),),
        subtitle: Text("GANAND SHEPIELD"),
            onTap: (){},
    )
        ),
      ),
    );
  }
}
