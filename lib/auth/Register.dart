import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  bool showLoader = false;

  TextEditingController nameContoller  = new TextEditingController();
  TextEditingController emailContoller  = new TextEditingController();
  TextEditingController passwordContoller  = new TextEditingController();

  void RegisterUser() async {
    print("Name" + nameContoller.text.trim());
    print("Email" + emailContoller.text.trim());
    print("Password" + passwordContoller.text.trim());

    try{

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailContoller.text.trim(), password: passwordContoller.text.trim());
      if(userCredential.user!.uid.isNotEmpty)
      {

        print("User Created Successfully: "+userCredential.user!.uid.toString());

        FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set(
            {
              "name": nameContoller.text.trim(),
              "email": emailContoller.text.trim()
            }).then((value) => Navigator.pushReplacementNamed(context, "/home"));
      }

      //if(userCredential.user!.uid.isNotEmpty)
      //{
      //  Navigator.pushReplacementNamed(context, "/home");
      //}
    } on FirebaseAuthException catch(e){
      print("Something went wrong"+e.message.toString());
      print("Error Code: "+e.code.toString());
      Navigator.pushReplacementNamed(context, "/register");
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
            const Text("RegisterationPage", style: TextStyle(fontSize: 24,),),

            const SizedBox(height: 6,),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: nameContoller,
              decoration: InputDecoration(
                labelText:"Enter Full Name ",
                filled: true,
              ),
            ),
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
              RegisterUser();
            }, child: const Text("Register")),
            const SizedBox(height: 6,),
            const Text("Log Your Health Data For a Better Healthy Life", style: TextStyle(fontSize: 20,color: Colors.blue),),
            const SizedBox(height: 6,),
            InkWell(
              child: const Text("New User? login Here"),
              onTap: (){
                Navigator.pushNamed(context, '/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
