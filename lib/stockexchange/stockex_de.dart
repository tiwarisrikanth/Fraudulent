import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fraudulent/stockexchange/scam_under.dart';
import 'package:fraudulent/warning.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  double _stockPrice = 95.38;
  int _shares = 0;

  String pring = "95.38";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _buyStock() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Card Details'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCardDetailsForm(),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Confirm'),
              onPressed: () {
                // Handle card details submission
                Navigator.of(context).pop();
                _showTransactionDialog('Bought 1 share of Shopify Inc');
              },
            ),
          ],
        );
      },
    );
  }

  void _sellStock() {
    if (_shares > 0) {
      setState(() {
        _shares--;
      });
      _showTransactionDialog('Sold 1 share of Shopify Inc');
    } else {
      _showTransactionDialog('No shares to sell');
    }
  }

  void _showTransactionDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Transaction Complete'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StockScreens()));
                // _showTransactionDialog(
                //     'Your share value is doubled in hour and now your balance is \$ 190');
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ScamExplanationScreen(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  void _showTransactionDialogs(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScamExplanationScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCardDetailsForm() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Card Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Cardholder Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Expiry Date (MM/YY)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              '\$23,386.00',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xFF96BF48),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.shopping_bag, color: Colors.white, size: 16),
            ),
          ],
        ),
        actions: [
          Icon(Icons.keyboard_arrow_down, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Statistics'),
                Tab(text: 'History data'),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(),
                Center(child: Text('Statistics')),
                Center(child: Text('History data')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStockInfo(),
            SizedBox(height: 24),
            _buildChart(),
            SizedBox(height: 24),
            _buildTimeButtons(),
            SizedBox(height: 24),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildStockInfo() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shopify Inc',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$$_stockPrice',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Text('\$12.18',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Text('Shares owned: $_shares',
                style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 1.5),
                FlSpot(2, 1.4),
                FlSpot(3, 3),
                FlSpot(4, 2),
                FlSpot(5, 2.2),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData:
                  BarAreaData(show: true, color: Colors.blue.withOpacity(0.1)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTimeButton('24h', true),
        _buildTimeButton('7d', false),
        _buildTimeButton('1m', false),
        _buildTimeButton('3m', false),
        _buildTimeButton('1y', false),
      ],
    );
  }

  Widget _buildTimeButton(String text, bool isSelected) {
    return ElevatedButton(
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
        // onPrimary: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: () {},
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            child: Text('Buy', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _buyStock,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            child: Text('Sell', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _sellStock,
          ),
        ),
        SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class StockScreens extends StatefulWidget {
  const StockScreens({super.key});

  @override
  State<StockScreens> createState() => _StockScreensState();
}

class _StockScreensState extends State<StockScreens>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  double _stockPrice = 95.38;
  int _shares = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _showTransactionDialogsssss();
    });
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showTransactionDialogsssss() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations'),
          content: Text("Your Share value is doubled within one hour"),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                _showTransactionDialogssssss();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => StockScreens()));
                // _showTransactionDialog(
                //     'Your share value is doubled in hour and now your balance is \$ 190');
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ScamExplanationScreen(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  void _showTransactionDialogssssss() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Suggestion'),
          content: Text("Invest \$ 500 to earn tremendous returns"),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                _buyStock();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => StockScreens()));
                // _showTransactionDialog(
                //     'Your share value is doubled in hour and now your balance is \$ 190');
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ScamExplanationScreen(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  void _buyStock() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Card Details'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCardDetailsForm(),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Confirm'),
              onPressed: () {
                // Handle card details submission
                Navigator.of(context).pop();
                _showTransactionDialog('Thank you for investing');
              },
            ),
          ],
        );
      },
    );
  }

  void _sellStock() {
    if (_shares > 0) {
      setState(() {
        _shares--;
      });
      _showTransactionDialog('Sold 1 share of Shopify Inc');
    } else {
      _showTransactionDialog('No shares to sell');
    }
  }

  void _showTransactionDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Transaction Complete'),
          content: SizedBox(
            height: 90, // Adjust the height here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message),
                Text(
                  'You have been cheated with this replica app you won\'t be able to get your money or investment back',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                _showTransactionDialogggg();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ScamExplanationScreen(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  void _showTransactionDialogggg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text(
              'ఒరిజినల్ ఆప్స్ లోనే ఇన్వెస్ట్ చెయ్యండి, ఫేక్ ఆప్స్ లో ఇన్వెస్టు చేసి మోసపోకండి. మీకు ఫస్ట్ వచ్చిన అమౌంట్ కూడా వేరే వారు మోసపోయినవారే. వాళ్ళు కంప్లయింట్ చేస్తే మీరు కూడా భాధ్యులే'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScamWarningScreen()));
                // _showTransactionDialog(
                //     'Thank you for investing.');
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ScamExplanationScreen(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  void _showTransactionDialogs(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScamExplanationScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCardDetailsForm() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Card Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Cardholder Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Expiry Date (MM/YY)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              '\$190.00',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xFF96BF48),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.shopping_bag, color: Colors.white, size: 16),
            ),
          ],
        ),
        actions: [
          Icon(Icons.keyboard_arrow_down, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Statistics'),
                Tab(text: 'History data'),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(),
                Center(child: Text('Statistics')),
                Center(child: Text('History data')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStockInfo(),
            SizedBox(height: 24),
            _buildChart(),
            SizedBox(height: 24),
            _buildTimeButtons(),
            SizedBox(height: 24),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildStockInfo() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shopify Inc',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$190.00',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Text('\$12.18',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Text('Shares owned: $_shares',
                style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 1.5),
                FlSpot(2, 1.4),
                FlSpot(3, 3),
                FlSpot(4, 2),
                FlSpot(5, 2.2),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData:
                  BarAreaData(show: true, color: Colors.blue.withOpacity(0.1)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTimeButton('24h', true),
        _buildTimeButton('7d', false),
        _buildTimeButton('1m', false),
        _buildTimeButton('3m', false),
        _buildTimeButton('1y', false),
      ],
    );
  }

  Widget _buildTimeButton(String text, bool isSelected) {
    return ElevatedButton(
      child: Text(text),
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: () {},
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            child: Text('Buy', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _buyStock,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            child: Text('Sell', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _sellStock,
          ),
        ),
        SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
