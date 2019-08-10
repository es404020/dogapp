import 'package:flutter/material.dart';
class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: Text("DogApp",style: TextStyle(fontSize: 32),)),
            SizedBox(height: 20.0,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child: RaisedButton(
                child: Text("Google",style: TextStyle(color: Colors.white),),
                color: Colors.red,
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}
