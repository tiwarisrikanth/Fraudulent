import 'package:flutter/material.dart';
class Customer {
  final String imageUrl;
  final String name;
  final double amountWon;

  Customer({required this.imageUrl, required this.name, required this.amountWon});
}

class CustomerListScreen extends StatelessWidget {
final List<Customer> customers = [
    Customer(imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg', name: 'Kevin', amountWon: 5000.0),
    Customer(imageUrl: 'https://randomuser.me/api/portraits/women/2.jpg', name: 'riya Sharma', amountWon: 3000.0),
    Customer(imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg', name: 'Jhon keyv', amountWon: 4500.0),
    Customer(imageUrl: 'https://randomuser.me/api/portraits/women/4.jpg', name: 'Sunina simon', amountWon: 2000.0),
    Customer(imageUrl: 'https://randomuser.me/api/portraits/men/5.jpg', name: 'Amit Verma', amountWon: 7000.0),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers Who Won Today'),
        backgroundColor: Color(0xffFAB029),
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(customer.imageUrl),
                radius: 30,
              ),
              title: Text(
                customer.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              subtitle: Text(
                '₹${customer.amountWon.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 14.0, color: Colors.green),
              ),
            ),
          );
        },
      ),
    );
  }
}