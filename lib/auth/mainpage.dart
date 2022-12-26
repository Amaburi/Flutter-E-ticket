import 'package:firebase_auth/firebase_auth.dart';
import 'package:nyobaauth/Screens/Welcome/welcome_screen.dart';
import 'package:nyobaauth/home.dart';
import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return Home();
          } else{
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
