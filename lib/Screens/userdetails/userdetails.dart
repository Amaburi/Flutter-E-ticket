import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nyobaauth/Screens/history/history.dart';
import 'package:nyobaauth/Screens/ticket/ticket.dart';
import 'package:nyobaauth/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants.dart';
import '../Welcome/welcome_screen.dart';

class userdetails extends StatefulWidget {
  const userdetails({Key? key}) : super(key: key);

  @override
  State<userdetails> createState() => _userdetailsState();
}

class _userdetailsState extends State<userdetails> {
  final user =  FirebaseAuth.instance.currentUser;

  //Document ids
  List<String> docIds = [];
  Future getDocId() async{
    await FirebaseFirestore.instance.collection('Users').get().then((value) => value.docs.forEach((element) {
      print(element.reference);
      docIds.add(element.reference.id);
    }));
  }
  @override
  void initState() {
    // TODO: implement initState
    getDocId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('User Details', style: TextStyle(color: Colors.black, fontSize: 26),),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
            backgroundColor: kBackgroundColor,
            color: kActiveIconColor,
            activeColor: kBackgroundColor,
            tabBackgroundColor: kActiveIconColor,
            padding: EdgeInsets.all(18),
            gap: 8,
            tabs:  [
              GButton(icon: FontAwesomeIcons.house, text: 'Home',
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  },
                  ),
                  )
                },
              ),
              GButton(icon: FontAwesomeIcons.userAstronaut,text: 'User Details',
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return userdetails();
                  },
                  ),
                  )
                },
              ),
              GButton(icon: FontAwesomeIcons.ticket,text: 'Ticket',
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ticket();
                  },
                  ),
                  )
                },
              ),
              GButton(icon: FontAwesomeIcons.history,text: 'History',
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return history();
                  },
                  ),
                  )
                },
              ),
            ]
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle
              ),
              child: Icon(FontAwesomeIcons.user),
            ),
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user!.email!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

              Text('Occupation: Petugas Tiket', style: TextStyle(color: Colors.black),)
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text('?????'),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text('?????'),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WelcomeScreen();
                },
              ),
            );
          },
            color: Colors.amber,
            child: Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
