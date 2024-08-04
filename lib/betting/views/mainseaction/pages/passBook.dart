import 'package:flutter/material.dart';

class PassBook extends StatefulWidget {
  @override
  State<PassBook> createState() => _PassBookState();
}

class _PassBookState extends State<PassBook> {
  final List<String> _transactionDates = [
    '2024-07-01',
    '2024-07-02',
    '2024-07-03',
    '2024-07-04'
  ];

  final List<String> _particulars = [
    'King jackpot',
    'Sara pot',
    'Monthly Luck draw',
    'Lottery'
  ];

  final List<double> _previousAmounts = [
    10000.0,
    9800.0,
    14800.0,
    13800.0
  ];

  final List<double> _transactionAmounts = [
    -200.0,
    5000.0,
    -1000.0,
    -500.0
  ];

  final List<double> _currentAmounts = [
    9800.0,
    14800.0,
    13800.0,
    13300.0
  ];

  Widget _buildList<T>(List<T> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].toString()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Color(0xffFAB029),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Transaction Date'),
                    Tab(text: 'Particulars'),
                    Tab(text: 'Previous Amount'),
                    Tab(text: 'Transaction Amount'),
                    Tab(text: 'Current Amount'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _buildList(_transactionDates),
              _buildList(_particulars),
              _buildList(_previousAmounts),
              _buildList(_transactionAmounts),
              _buildList(_currentAmounts),
            ],
          ),
        ),
      ),
    );
  }
}
