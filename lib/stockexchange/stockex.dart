import 'package:flutter/material.dart';
import 'package:fraudulent/stockexchange/stockex_de.dart';

class StockHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Trading App'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.account_balance_wallet),
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile1.jpg'),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile2.jpg'),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile3.jpg'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wallet: \$10,000',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Stocks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(child: StockList()),
          ],
        ),
      ),
    );
  }
}

class StockList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Number of stocks to display
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          child: ListTile(
            leading: Icon(
              index % 2 == 0 ? Icons.trending_up : Icons.trending_down,
              color: index % 2 == 0 ? Colors.green : Colors.red,
            ),
            title: Text('Stock $index', style: TextStyle(color: Colors.white)),
            subtitle: Text('Price: \$${100 + index * 10}',
                style: TextStyle(color: Colors.white70)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => StockDetailScreen(stockIndex: index),
              //   ),
              // );
            },
          ),
        );
      },
    );
  }
}
