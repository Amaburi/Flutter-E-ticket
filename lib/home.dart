import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nyobaauth/Screens/Welcome/welcome_screen.dart';
import 'package:nyobaauth/Screens/history/hiss.dart';
import 'package:nyobaauth/Screens/history/history.dart';
import 'package:nyobaauth/Screens/ticket/ticket.dart';
import 'package:nyobaauth/Screens/userdetails/userdetails.dart';
import 'package:nyobaauth/constants.dart';
import 'package:nyobaauth/template/cards.dart';

import 'package:nyobaauth/template/category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final user =  FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
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
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    user!.email!,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.w200, fontSize: 20),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Adit",
                          svgSrc: "assets/icons/doctorhuman.svg",
                          press: () {

                          },
                        ),
                        CategoryCard(
                          title: "Akmal",
                          svgSrc: "assets/icons/human1.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Dito",
                          svgSrc: "assets/icons/human2.svg",
                          press: () {

                          },
                        ),
                        CategoryCard(
                          title: "Apri",
                          svgSrc: "assets/icons/human3.svg",
                          press: () {},
                          ),
                        CategoryCard(
                          title: "Arsyad",
                          svgSrc: "assets/icons/human4.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
