import 'package:day_27/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {

  TextEditingController _email =new TextEditingController();
  TextEditingController _password =new TextEditingController();

  Future<void> signin(BuildContext context) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
      );
    }catch(e){
      print(e);
    }
    print("Singin Successfull!!!");
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Enter Your Email:",
                    hintText: "Your Email"
                ),
                controller: _email,
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "Enter Password:",
                    hintText: "Password:"
                ),
                controller: _password,
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 70,
              width: 400,

              padding: EdgeInsets.all(10),
              child: FlatButton(
                child: Text("Sign In",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  //color: Colors.white,
                  fontSize: 20,
                ),),
                onPressed: (){
                  signin(context);
                },
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
