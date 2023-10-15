import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthlogger/auth/Register.dart';
import 'package:healthlogger/home/home_page.dart';
import 'package:healthlogger/auth/splash_page.dart';
import 'package:healthlogger/auth/login_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthLogger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),

        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const loginPage(),
        '/register': (context) => const RegisterationPage(),
        '/home': (context) => const HomePage()
      },
    );
  }
}
