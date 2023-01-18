import 'dart:convert';

import 'package:nyobaauth/Model/TicketDummy.dart';
import 'package:http/http.dart' as http;

class Ticketdummy{
  final _baseUrl = 'https://63c560f9e1292e5bea21d1c9.mockapi.io/Ticketdmmy';
  var client = http.Client();
  Future getData() async{
    try{
      final response = await client.get(Uri.parse(_baseUrl));

      if(response.statusCode == 200){
        print(response.body);
        var it = jsonDecode(response.body);
        List<Ticket> ticket = it.map((e) => Ticket.fromJson(e)).toList();
        return ticket;
        // String data = response.body;
        // return (jsonDecode((data)));
        // return jsonEncode(response.body);
      }
    }catch(err){
      print(err.toString());
    }
  }
}