class Ticket {
  final int id;
  final String name;
  final int price;
  final String description;
  final int tour_id;


  Ticket({
    required this.id, required this.name ,required this.price, required this.description, required this.tour_id
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        tour_id: json['tour_id']
    );
  }

}