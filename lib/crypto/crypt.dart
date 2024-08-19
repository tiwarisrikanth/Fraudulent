import 'package:flutter/material.dart';
import 'package:fraudulent/crypto/buycrypto.dart';
import 'package:fraudulent/crypto/deposit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MainScreenCrypto extends StatefulWidget {
  @override
  _MainScreenCryptoState createState() => _MainScreenCryptoState();
}

class _MainScreenCryptoState extends State<MainScreenCrypto> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WalletScreen(),
    HelpCenterPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.blueAccent,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'BYBIT Web3',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_balance_wallet_outlined,
                color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 16.0),
              _buildPromoBanner(),
              SizedBox(height: 16.0),
              _buildQuickActionsRow(context),
              SizedBox(height: 16.0),
              _buildHomeActionCards(context),
              SizedBox(height: 16.0),
              _buildSection(context, 'IDO', IDOCard()),
              _buildSection(context, 'Staking', StakingCard()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search by project or token name',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          'Web3 USDC Odyssey Trading Competition\nNow Live!',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildQuickActionsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeIconButton(
          icon: Icons.trending_up,
          label: 'IDO',
          onTap: () => _navigateToMarketsScreen(context),
        ),
        HomeIconButton(
          icon: Icons.show_chart,
          label: 'APEX',
          onTap: () => _navigateToMarketsScreen(context),
        ),
        HomeIconButton(
          icon: Icons.attach_money,
          label: 'Staking',
          onTap: () => _navigateToMarketsScreen(context),
        ),
        HomeIconButton(
          icon: Icons.card_giftcard,
          label: 'Rewards',
          onTap: () => _navigateToMarketsScreen(context),
        ),
      ],
    );
  }

  Widget _buildHomeActionCards(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeActionCard(title: 'Deposit', icon: Icons.arrow_forward),
        SizedBox(width: 16.0), // Added spacing between cards
        HomeActionCard(title: 'Buy Crypto', icon: Icons.arrow_forward),
      ],
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        content,
      ],
    );
  }

  void _navigateToMarketsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MarketsScreen()),
    );
  }
}

class HomeIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  HomeIconButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24.0,
            backgroundColor: Colors.yellow[700],
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 8.0),
          Text(label, style: TextStyle(fontSize: 12.0)),
        ],
      ),
    );
  }
}

class HomeActionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  HomeActionCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          title == "Deposit"
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DepositScreen()))
              : Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BuyCrypto()));
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(icon, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class IDOCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Project: Infinity Pad', style: TextStyle(color: Colors.white)),
          SizedBox(height: 8.0),
          Text(
            'Participate now!',
            style: TextStyle(
                color: Colors.yellow[700], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class StakingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Staking Pool', style: TextStyle(color: Colors.white)),
          SizedBox(height: 8.0),
          Text(
            'Earn up to 20% APY!',
            style: TextStyle(
                color: Colors.green[400], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MarketsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> marketData = [
    {
      "pair": "BTC/USDT",
      "volume": "512.06M USDT",
      "price": "43,642.00",
      "change": "-0.25%",
      "isPositive": false
    },
    {
      "pair": "ETH/USDT",
      "volume": "306.50M USDT",
      "price": "2,330.78",
      "change": "+3.51%",
      "isPositive": true
    },
    {
      "pair": "SOL/USDT",
      "volume": "115.71M USDT",
      "price": "65.32",
      "change": "+4.28%",
      "isPositive": true
    },
    {
      "pair": "PYTH/USDT",
      "volume": "8.64M USDT",
      "price": "0.44623",
      "change": "-2.51%",
      "isPositive": false
    },
    {
      "pair": "USDC/USDT",
      "volume": "82.75M USDT",
      "price": "1.0000",
      "change": "0.00%",
      "isPositive": true
    },
    {
      "pair": "MNT/USDT",
      "volume": "137.66M USDT",
      "price": "0.6326",
      "change": "+3.81%",
      "isPositive": true
    },
    {
      "pair": "XRP/USDT",
      "volume": "114.20M USDT",
      "price": "0.6370",
      "change": "+1.59%",
      "isPositive": true
    },
    {
      "pair": "LINK/USDT",
      "volume": "20.26M USDT",
      "price": "15.3107",
      "change": "-1.28%",
      "isPositive": false
    },
    {
      "pair": "DOGE/USDT",
      "volume": "62.12M USDT",
      "price": "0.09587",
      "change": "-4.03%",
      "isPositive": false
    },
    {
      "pair": "BONK/USDT",
      "volume": "15.96M USDT",
      "price": "0.0000110705",
      "change": "+35.46%",
      "isPositive": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Markets', style: TextStyle(color: Colors.black)),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'USDT'),
              Tab(text: 'USDC'),
              Tab(text: 'EUR'),
              Tab(text: 'BTC'),
              Tab(text: 'DAI'),
              Tab(text: 'BRZ'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMarketList(),
            _buildMarketList(),
            _buildMarketList(),
            _buildMarketList(),
            _buildMarketList(),
            _buildMarketList(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: 'Markets'),
            BottomNavigationBarItem(
                icon: Icon(Icons.swap_horiz), label: 'Trade'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Assets'),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketList() {
    return ListView.builder(
      itemCount: marketData.length,
      itemBuilder: (context, index) {
        final data = marketData[index];
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['pair'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(data['volume'], style: TextStyle(color: Colors.grey)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(data['price'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(data['change'],
                      style: TextStyle(
                        color: data['isPositive'] ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ],
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text('10x',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Wallet',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WalletCard(),
            SizedBox(height: 20),
            Text(
              'Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TransactionList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
// Action to add a new wallet
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: [Colors.black, Colors.grey[850]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wallet Name', style: TextStyle(color: Colors.white)),
          SizedBox(height: 8.0),
          Text(
            'Balance: 2.4 BTC',
            style: TextStyle(
                color: Colors.yellow[700], fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TermsAndConditionsScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text('Withdraw'),
          ),
        ],
      ),
    );
  }
}

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool isChecked = false;
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text.rich(
                  TextSpan(
                    text:
                        'To proceed with the withdrawal, you must agree to the following terms and conditions. ',
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text:
                            '\n\nNOTE: An additional amount of ₹5000 is required to withdraw your total balance.',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            '\n\n1. The withdrawal process may take up to 48 hours to complete.',
                      ),
                      TextSpan(
                        text:
                            '\n\n2. A processing fee of 2% will be deducted from the total withdrawal amount.',
                      ),
                      TextSpan(
                        text:
                            '\n\n3. By proceeding, you confirm that the funds in your wallet are obtained through legal means.',
                      ),
                      TextSpan(
                        text:
                            '\n\n4. This is a simulated transaction for testing purposes. No actual funds will be transferred.',
                      ),
// Add more terms and conditions if needed
                    ],
                  ),
                ),
              ),
            ),
            CheckboxListTile(
              title: Text('I agree to the terms and conditions'),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
            ElevatedButton(
              onPressed: isChecked ? () => _startPayment() : null,
              child: Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }

  void _startPayment() {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag', // Test key
      'amount': 5000 * 100, // Amount is in paise (5000 INR)
      'name': 'Fake Withdrawal',
      'description': 'Add ₹5000 to proceed with withdrawal',
      'prefill': {'contact': '', 'email': ''},
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Scam Alert!'),
          content: Text('This is a scam. Stay away from such scams!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Failed'),
          content: Text('The payment process failed. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {"type": "Received", "amount": 0.5, "date": "2024-08-10", "id": "TX12345"},
    {"type": "Sent", "amount": 0.3, "date": "2024-08-09", "id": "TX67890"},
    {"type": "Received", "amount": 1.2, "date": "2024-08-08", "id": "TX54321"},
    {"type": "Received", "amount": 0.4, "date": "2024-08-07", "id": "TX11223"},
    {"type": "Sent", "amount": 0.6, "date": "2024-08-06", "id": "TX44556"},
    {"type": "Received", "amount": 2.0, "date": "2024-08-05", "id": "TX78901"},
    {"type": "Sent", "amount": 0.8, "date": "2024-08-04", "id": "TX99887"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final color = transaction['type'] == 'Received'
            ? Colors.green[400]
            : Colors.red[400];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(
              transaction['type'] == 'Received'
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              color: color,
            ),
            title: Text(transaction['type']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${transaction['date']}'),
                Text('ID: ${transaction['id']}'),
              ],
            ),
            trailing: Text(
              '${transaction['amount']} BTC',
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Help Center',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'How can we help you?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text('Popular Topics',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ListTile(
                    leading: Icon(Icons.account_balance_wallet),
                    title: Text('How to add a new wallet?'),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Securing your account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text('General questions'),
                  ),
                  SizedBox(height: 20),
                  Text('Live Chat',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey[200],
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(16.0),
                      children: [
                        Text('You: How can I add a new wallet?',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        Text(
                            'Support: Go to the wallet screen and tap on the "+" button to add a new wallet.'),
                        SizedBox(height: 16.0),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Type a message...',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
