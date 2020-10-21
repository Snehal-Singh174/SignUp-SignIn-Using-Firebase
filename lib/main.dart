import 'package:day_27/signin.dart';
import 'package:day_27/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Using Firebase"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("SignUp"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
              },
            ),
            RaisedButton(
              child: Text("SignIn"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

