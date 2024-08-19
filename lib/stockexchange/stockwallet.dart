import 'package:flutter/material.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/warning.dart';

class StockWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Wallet',
      theme: ThemeData(
        primaryColor: Colors.teal,
        // accentColor: Colors.tealAccent,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0),
        ),
      ),
      home: WillPopScope(
        onWillPop: () {
          return returnsssss(context);
        },
        child: Scaffold(
          backgroundColor: Color(0xFF1A2130),
          appBar: AppBar(
            backgroundColor: Color(0xFF1A2130),
            title: Text(
              'Stock Wallet',
              style: TextStyle(color: white),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.timer),
                onPressed: () {},
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2:10',
                        style: TextStyle(fontSize: 16.0, color: white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Morgan Workman',
                    style: TextStyle(color: white),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$27,294',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                      Text(
                        '>',
                        style: TextStyle(fontSize: 24.0, color: white),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '+ \$4,271.52 (18.55%) for all time',
                    style: TextStyle(color: white),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Deposit',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).cardColor,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Withdraw'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).cardColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Assets',
                          // style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 8.0),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3, // Adjust for number of assets
                          itemBuilder: (context, index) {
                            return _buildAssetRow(
                              icon: Icons.currency_bitcoin,
                              name: 'Bitcoin',
                              value: '\$27,698.52',
                              change: '+10.41%',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Show All'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).cardColor,
                      minimumSize: Size(double.infinity, 50.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAssetRow({
    required IconData icon,
    required String name,
    required String value,
    required String change,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 8),
              Text(name),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value),
              Text(
                change,
                style: TextStyle(
                  color: change.startsWith('+') ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
