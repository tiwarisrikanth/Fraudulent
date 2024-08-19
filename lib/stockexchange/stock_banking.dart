import 'package:flutter/material.dart';
import 'package:fraudulent/warning.dart';

class BuyStockScreen extends StatelessWidget {
  final int stockIndex;

  BuyStockScreen({required this.stockIndex});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Buy Stock'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stock ${stockIndex}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Number of Shares',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Bank Account Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'IFSC Code',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle payment logic here
                },
                child: Text('Confirm Purchase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
