import 'package:flutter/material.dart';
import 'package:dogapp/screen/main.dart';
import 'package:dogapp/rout/rout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    initialRoute: '/',
      onGenerateRoute:Router.generateRoute,

    );
  }
}

class MyHomePage extends StatefulWidget {
  static const id = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    return Auth();
  }
}
