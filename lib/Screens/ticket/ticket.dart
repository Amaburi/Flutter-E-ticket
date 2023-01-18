import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nyobaauth/Screens/history/history.dart';
import 'package:nyobaauth/Screens/userdetails/userdetails.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../../home.dart';

class ticket extends StatefulWidget {
  const ticket({Key? key}) : super(key: key);

  @override
  State<ticket> createState() => _ticketState();
}

class _ticketState extends State<ticket> {
  final _formKey = GlobalKey<FormState>();

  var options = [
    'Deluxe',
    'Yaaaa',
    'Naii'
  ];
  var _currentItemSelected = "Deluxe";
  var rool = "Naii";

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.8;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Ticket', style: TextStyle(color: Colors.black, fontSize: 26),),
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
            ]
        ),
      ),
      body:  SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (name) {},
                  decoration: InputDecoration(
                    hintText: "Quantity",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Icon(FontAwesomeIcons.userAstronaut),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    hintText: "Date",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Icon(FontAwesomeIcons.calendarDays),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ticket Type : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  DropdownButton<String>(
                    dropdownColor: kPrimaryColor,
                    isDense: true,
                    isExpanded: false,
                    iconEnabledColor: Colors.white,
                    focusColor: Colors.white,
                    items: options.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValueSelected) {
                      setState(() {
                        _currentItemSelected = newValueSelected!;
                        rool = newValueSelected;
                      });
                    },
                    value: _currentItemSelected,
                  ),
                ],
              ),

              const SizedBox(height: defaultPadding / 2),
              const SizedBox(height: defaultPadding / 2),
              SizedBox(
                height: 45,
                width: 45,
                child: IconButton(
                  onPressed: (){

                  },
                  icon: Icon(FontAwesomeIcons.ticket, size: 55.0),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
