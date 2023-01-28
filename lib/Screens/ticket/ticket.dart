import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nyobaauth/Model/TicketDummy.dart';
import 'package:nyobaauth/Screens/history/history.dart';
import 'package:nyobaauth/Screens/userdetails/userdetails.dart';
import 'package:nyobaauth/home.dart';
import 'package:nyobaauth/services/remote_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants.dart';
import '../ticket/ticket.dart';
class ticket extends StatefulWidget {
  const ticket({Key? key}) : super(key: key);

  @override
  State<ticket> createState() => _ticketState();
}

class _ticketState extends State<ticket> {

  Future<List<Ticket>> fetchData() async {

    var url =  Uri.parse('https://tiket.dadidu.id/api/paket');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Ticket.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<Ticket>>(
        future: fetchData(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index){
                  return Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){

                            },
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.ticket),
                                  Text(snapshot.data![index].name),
                                  // Text(ticket[index].type.toString()),
                                  SizedBox(height: 5,),
                                  Icon(FontAwesomeIcons.moneyBill1),
                                  Text(snapshot.data![index].price.toString()),
                                  SizedBox(height: 5,),
                                  Icon(FontAwesomeIcons.audioDescription),
                                  Text(snapshot.data![index].description),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
