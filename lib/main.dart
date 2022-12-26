import 'package:flutter/material.dart';
import 'package:nyobaauth/Screens/Welcome/welcome_screen.dart';
import 'package:nyobaauth/constants.dart';
import 'package:nyobaauth/auth/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eticket',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainPage(),
    );
  }
}