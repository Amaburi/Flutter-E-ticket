import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nyobaauth/Screens/Users/cardss.dart';
import 'package:nyobaauth/Screens/Users/userdetails/userdetails.dart';
import 'package:nyobaauth/Screens/Welcome/welcome_screen.dart';
import 'package:nyobaauth/Screens/history/history.dart';
import 'package:nyobaauth/Screens/ticket/ticket.dart';
import 'package:nyobaauth/Screens/userdetails/userdetails.dart';
import 'package:nyobaauth/template/cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final user =  FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: Text('E-ticktet', style: TextStyle(color: Colors.black, fontSize: 26),),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),

            ),
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  cardss(),
                  cardss(),
                  cardss()
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return history();
                            },
                          ),
                        );
                      },
                      child: Icon(FontAwesomeIcons.book),
                    ),
                  ),
                ),
                Text('History', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ticket();
                            },
                          ),
                        );
                      },
                      child: Icon(FontAwesomeIcons.ticket),
                    ),
                  ),
                ),
                Text('Ticket', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        items: [
          GestureDetector(
            onTap: (){

            },
            child: Icon(FontAwesomeIcons.house, color: Colors.black,),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return userdetailss();
                  },
                ),
              );
            },
            child: Icon(FontAwesomeIcons.user, color: Colors.black,),
          ),
        ],
      ),

    );
  }
}
