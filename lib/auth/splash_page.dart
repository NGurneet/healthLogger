import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  navigateToLogin(BuildContext context) async{
    Future.delayed(Duration(seconds: 5) ,(){
      Navigator.pushNamed(context, '/login');
    });

  }
  @override
  Widget build(BuildContext context) {
    navigateToLogin(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo.jpg", width: 64, height: 64,),
            const SizedBox(height: 12,),
            const Text("Healthlogger", style: TextStyle(fontSize: 24,),),
            const Divider(),
            const SizedBox(height: 6,),
            const Text("Log Your Health Data For a Better Healthy Life", style: TextStyle(fontSize: 20,color: Colors.blue),),

          ],
        ),
      ),
    );
  }
}
