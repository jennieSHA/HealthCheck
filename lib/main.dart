import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Starting Pages/registeruser.dart';

import 'package:flutter_app/Starting Pages/loginScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Healthmate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(widget.title),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(1.0)),
            Image.asset("assets/doctor.jpg",
              height: 250,
              width: 500,
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              "Welcome To HealthMate!!!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 60.0)),
                FlatButton(
                  color: Colors.brown,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();}));
                  }, child: Text("Login"),),
                Padding(padding: EdgeInsets.only(left: 90.0)),
                FlatButton(
                  color: Colors.brown,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return RegistrationScreen();}));
                  }, child: Text("Register"),)
              ],
            )

          ],
        )

    );
  }
}
