import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class cards extends StatefulWidget {
  const cards({Key? key}) : super(key: key);

  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {
  final user =  FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Signed as:'+ '' + user!.email!, style: TextStyle(color: Colors.white, fontSize: 18),),
            SizedBox(height: 10,),
            Text('Petugas Tiket', style: TextStyle(color: Colors.white, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}

