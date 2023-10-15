import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/account.png", width: 64, height: 64,),
            const SizedBox(height: 12,),
            const Text("Welcome to HealthLogger", style: TextStyle(fontSize: 24,),),

            const SizedBox(height: 6,),


          ],
        ),
      ),
    );
  }
}

