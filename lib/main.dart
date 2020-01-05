import 'package:dogapp/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/screen/main.dart';
import 'package:dogapp/rout/rout.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().user)
      ],
      child: MaterialApp(
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

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const id = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {

  final FirebaseMessaging _fcm = FirebaseMessaging();

@override
  void initState() {
    // TODO: implement initState

    super.initState();
    _showDialog();
  }
  @override
  Widget build(BuildContext context) {

    var user = Provider.of<FirebaseUser>(context);


    return user?.uid==null?Auth(): DogPages();
  }
  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  _showDialog(){
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onResume: (Map<String, dynamic> message) async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
    );
  }
}
