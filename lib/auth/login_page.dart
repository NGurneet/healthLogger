import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  bool showLoader = false;
  TextEditingController emailContoller  = new TextEditingController();
  TextEditingController passwordContoller  = new TextEditingController();

  void loginUser() async{
    print("Email" + emailContoller.text.trim());
    print("Password" + passwordContoller.text.trim());

    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailContoller.text.trim(), password: passwordContoller.text.trim());
      print("User Signed in Successfully: "+userCredential.user!.uid.toString());
      if(userCredential.user!.uid.isNotEmpty)
      {
        Navigator.pushReplacementNamed(context, "/home");
      }
    } on FirebaseAuthException catch(e){
      print("Something went wrong"+e.message.toString());
      print("Error Code: "+e.code.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoader ? Center(child: CircularProgressIndicator(),):
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/account.png", width: 64, height: 64,),
            const SizedBox(height: 12,),
            const Text("LoginPage", style: TextStyle(fontSize: 24,),),

            const SizedBox(height: 6,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailContoller,
              decoration: InputDecoration(
                labelText:"Enter email id",
                filled: true,
              ),
            ),
            const SizedBox(height: 6,),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordContoller,
              decoration: InputDecoration(
                labelText: "Password",
                filled: true
              ),
              obscureText: true,

            ),
            const SizedBox(height: 6,),
            OutlinedButton(onPressed: (){
              setState(() {
                showLoader =true;
              });
              loginUser();
            }, child: const Text("Login")),
            const SizedBox(height: 6,),
            const Text("Log Your Health Data For a Better Healthy Life", style: TextStyle(fontSize: 20,color: Colors.blue),),
            const SizedBox(height: 6,),
        InkWell(
          child: const Text("New User? Register Here"),
          onTap: (){
            Navigator.pushNamed(context, '/register');
          },
        )
          ],
        ),
      ),
    );
  }
}
