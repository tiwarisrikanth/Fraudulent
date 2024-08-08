import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/stockexchange/stock_trade.dart';
import 'package:fraudulent/stockexchange/stockex_de.dart';
import 'package:fraudulent/stockexchange/stockwallet.dart';
import 'package:toastification/toastification.dart';

class StockExHomePage extends StatefulWidget {
  @override
  State<StockExHomePage> createState() => _StockExHomePageState();
}

class _StockExHomePageState extends State<StockExHomePage> {
  int selectedBotoIN = 0;

  @override
  void initState() {
    _startToastTimer();
    super.initState();
  }

  void _startToastTimer() {
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      int index = timer.tick % messages.length;
      toastification.show(
        context: context, // optional if you use ToastificationWrapper
        type: ToastificationType.success,
        style: ToastificationStyle.flatColored,
        autoCloseDuration: const Duration(seconds: 5),
        title: messages[index],
        // you can also use RichText widget for title and description parameters
        description: "You can also win",
        alignment: Alignment.topRight,
        direction: TextDirection.ltr,
        animationDuration: const Duration(milliseconds: 300),

        icon: const Icon(Icons.check),
        primaryColor: Colors.green,

        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        borderRadius: BorderRadius.circular(12),

        showProgressBar: true,
        closeButtonShowType: CloseButtonShowType.onHover,
        closeOnClick: false,
        pauseOnHover: true,
        dragToClose: true,
      );
    });
  }

  final List<String> messages = [
    "Alice won ₹562344.22",
    "John won ₹1378234.56",
    "Emily won ₹229837.91",
    "Sarah won ₹874573.15",
    "Michael won ₹987234.78",
    "Jessica won ₹48723.14",
    "David won ₹123456.78",
    "Olivia won ₹678934.45",
    "Robert won ₹234567.89",
    "James won ₹98765.43",
    "Alice won ₹562344.22",
    "John won ₹1378234.56",
    "Emily won ₹229837.91",
    "Sarah won ₹874573.15",
    "Michael won ₹987234.78",
    "Jessica won ₹48723.14",
    "David won ₹123456.78",
    "Olivia won ₹678934.45",
    "Robert won ₹234567.89",
    "James won ₹98765.43",
    "Alice won ₹562344.22",
    "John won ₹1378234.56",
    "Emily won ₹229837.91",
    "Sarah won ₹874573.15",
    "Michael won ₹987234.78",
    "Jessica won ₹48723.14",
    "David won ₹123456.78",
    "Olivia won ₹678934.45",
    "Robert won ₹234567.89",
    "James won ₹98765.43",
    "Alice won ₹562344.22",
    "John won ₹1378234.56",
    "Emily won ₹229837.91",
    "Sarah won ₹874573.15",
    "Michael won ₹987234.78",
    "Jessica won ₹48723.14",
    "David won ₹123456.78",
    "Olivia won ₹678934.45",
    "Robert won ₹234567.89",
    "James won ₹98765.43",
    "Alice won ₹562344.22",
    "John won ₹1378234.56",
    "Emily won ₹229837.91",
    "Sarah won ₹874573.15",
    "Michael won ₹987234.78",
    "Jessica won ₹48723.14",
    "David won ₹123456.78",
    "Olivia won ₹678934.45",
    "Robert won ₹234567.89",
    "James won ₹98765.43",
    "Alice won ₹562344.22",
    "John won ₹1378234.56",
    "Emily won ₹229837.91",
    "Sarah won ₹874573.15",
    "Michael won ₹987234.78",
    "Jessica won ₹48723.14",
    "David won ₹123456.78",
    "Olivia won ₹678934.45",
    "Robert won ₹234567.89",
    "James won ₹98765.43",
    "Alice won ₹562344.22",
    "John won ₹1378234.56",
    "Emily won ₹229837.91",
    "Sarah won ₹874573.15",
    "Michael won ₹987234.78",
    "Jessica won ₹48723.14",
    "David won ₹123456.78",
    "Olivia won ₹678934.45",
    "Robert won ₹234567.89",
    "James won ₹98765.43",
    "Alice won ₹562344.22",
    "John won ₹1378234.56",
    "Emily won ₹229837.91",
    "Sarah won ₹874573.15",
    "Michael won ₹987234.78",
    "Jessica won ₹48723.14",
    "David won ₹123456.78",
    "Olivia won ₹678934.45",
    "Robert won ₹234567.89",
    "James won ₹98765.43"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2130),
      body: selectedBotoIN == 2
          ? StockTradeIn()
          : selectedBotoIN == 1
              ? StockWallet()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Profile and Portfolio Section
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://via.placeholder.com/150'),
                                      radius: 30,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tyrone Tremblay',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'hello@tyrone.com',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.notifications, color: Colors.grey),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'PORTFOLIO',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    '\$5,271.39',
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '+130.62%',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.green),
                                      ),
                                      Text(
                                        '+\$2,979.23',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Withdraw',
                                      style: TextStyle(color: white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.grey[800],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StockScreen()));
                                    },
                                    child: Text(
                                      'BUY',
                                      style: TextStyle(color: white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.grey[800],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 250,
                          child: LineChartSample2(),
                        ),
                        // Invite Section
                        Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white30,
                          ),
                          child: Center(
                            child: Text(
                              'Invite a friend, both receive \$10 in BTC',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        // Market Section
                        ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(16.0),
                          children: [
                            MarketItem(
                              icon: Icons.currency_bitcoin,
                              name: 'Bitcoin',
                              code: 'BTC',
                              price: '\$32,811.00',
                              change: '-761.1',
                              changePercent: '-2.27%',
                              isPositive: false,
                            ),
                            MarketItem(
                              icon: Icons.currency_bitcoin,
                              name: 'Ethereum',
                              code: 'ETH',
                              price: '\$2,489.10',
                              change: '+102.2',
                              changePercent: '+3.95%',
                              isPositive: true,
                            ),
                            MarketItem(
                              icon: Icons.attach_money,
                              name: 'Tether',
                              code: 'USDT',
                              price: '\$1.00',
                              change: '-0.1',
                              changePercent: '-0.1%',
                              isPositive: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Color(0xFF5A72A0),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          useLegacyColorScheme: false,
          currentIndex: selectedBotoIN,
          backgroundColor: Color(0xFF5A72A0),
          selectedItemColor: Color(0xFFFDFFE2),
          unselectedItemColor: Colors.grey,
          onTap: (val) {
            setState(() {
              selectedBotoIN = val;
            });
            print(selectedBotoIN);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Trade',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Analytics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class MarketItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String code;
  final String price;
  final String change;
  final String changePercent;
  final bool isPositive;

  MarketItem({
    required this.icon,
    required this.name,
    required this.code,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.white),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                code,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '$change ($changePercent)',
                style: TextStyle(
                  fontSize: 16,
                  color: isPositive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LineChartSample2 extends StatelessWidget {
  LineChartSample2({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    Colors.white,
    Colors.black38,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 2000,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.only(
              right: 18.0, left: 12.0, top: 24, bottom: 12),
          child: LineChart(
            mainData(),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text = const Text('', style: style);

    final step = data1.length ~/ 4;
    if (value.toInt() % step == 0) {
      final index = value.toInt() ~/ step;
      text = Text('0:${(index * 5).toString().padLeft(2, '0')}', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = const {
          1: '10K',
          3: '30K',
          5: '50K',
          7: '70K',
          9: '90K',
        }[value.toInt()] ??
        '';
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: data1.length - 1,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            for (final entry in data1.entries)
              FlSpot(entry.key.toDouble(), entry.value.toDouble())
          ],
          color: Colors.green,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
        LineChartBarData(
          spots: [
            for (final entry in data2.entries)
              FlSpot(entry.key.toDouble(), entry.value.toDouble())
          ],
          color: Colors.red,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

final data1 = [
  3.45,
  2.14,
  1.88,
  2.02,
  2.25,
  2.20,
  2.18,
  2.49,
  2.87,
  3.06,
  3.00,
  2.35,
  2.08,
  2.22,
  2.24,
  2.43,
  2.14,
  2.16,
  2.16,
  1.85,
  2.02,
  1.90,
  2.12,
  1.71,
  1.85,
  1.77,
  1.79,
  2.14,
  2.25,
  2.29,
  2.31,
  2.79,
  2.54,
  2.72,
  2.37,
  2.35,
  2.41,
  2.66,
  2.79,
  3.04,
  3.58,
  4.29,
  3.99,
  4.42,
  5.05,
  5.01,
  5.51,
  8.90,
  8.16,
  5.61,
  5.23,
  5.19,
  4.19,
  3.72,
  3.10,
  2.97,
  2.18,
  2.45,
  2.33,
  2.29,
  2.31,
  2.31,
  3.02,
  3.43,
  3.50,
  3.25,
  2.99,
  3.08,
  3.54,
  4.12,
  4.04,
  4.74,
  5.42,
  7.70,
  5.92,
  5.25,
  5.80,
  5.82,
  5.03,
  4.99,
  4.62,
  4.62,
  4.46,
  6.12,
  6.13,
  5.37,
  5.38,
  5.70,
  6.33,
  6.26,
  5.92,
  5.41,
  5.15,
  6.34,
  6.16,
  6.58,
  6.15,
  6.13,
  6.95,
  7.16,
  6.46,
  7.17,
  7.62,
  9.52,
  1.75,
  3.41,
  0.30,
  3.05,
  8.68,
  7.54,
  6.88,
  7.16,
  6.25,
  6.20,
  6.16,
  7.13,
  4.90,
  5.84,
  7.41,
  6.73,
  6.54,
  8,
  7.11,
  7.59,
  7.63,
  7.34,
  6.21,
  6.21,
  6.08,
  6.74,
  7.09,
  7.11,
  7.99,
  8.53,
  9.41,
  0.17,
  1.26,
  2.68,
  1.08,
  8.25,
  7.66,
  6.74,
  6.67,
  5.82,
  5.24,
  4.51,
  3.95,
  3.5,
  3.83,
  3.79,
  3.37,
  3.14,
  2.99,
  4.00,
  3.66,
  5.34,
  5.83,
  5.32,
  4.29,
  4.03,
  4.13,
  4.79,
  4.62,
  4.32,
  3.89,
  3.43,
  3.70,
  4.25,
  4.49,
  4.08,
  4.23,
  4.02,
  3.95,
  3.53,
  3.14,
  3.58,
  3.87,
  4.08,
  4.55,
  4.25,
  4.75,
  4.79,
  4.72,
  4.62,
  4.43,
  4.25,
  4.58,
  4.83,
  4.72,
  5.16,
  4.75,
  5.14,
  4.89,
  5.14,
  5.79,
  6.08,
  5.83,
  5.52,
  5.38,
  5.70,
  5.83,
  5.45,
  5.83,
  5.38,
  5.89,
  6.00,
  6.20,
  6.25,
  6.54,
  6.38,
  6.34,
  6.28,
  6.66,
  6.37,
  6.13,
  6.00,
  6.33,
  6.37,
  6.08,
  6.37,
  6.28,
  6.45,
  6.83,
  6.75,
  6.92,
  6.54,
  7.04,
  7.42,
  7.13,
  7.30,
  7.59,
  7.42,
  7.71,
  7.83,
  7.71,
  7.54,
  8.00,
  8.04,
  7.95,
  7.83,
  8.04,
  7.95,
  8.04,
  8.37,
  8.41,
  8.66,
  8.79,
  8.66,
  8.66,
  8.62,
  8.91,
  9.08,
  9.12,
  9.16,
  9.12,
  9.20,
  9.29,
  9.29,
  9.25,
  9.37,
  9.29,
  9.25,
  9.29,
  9.37,
  9.29,
  9.37,
  9.41,
  9.41,
  9.41,
  9.41,
  9.45,
  9.50,
  9.50,
  9.41,
  9.41,
  9.45,
  9.37,
  9.37,
  9.37,
  9.29,
  9.29,
  9.33,
  9.25,
  9.29,
  9.29,
  9.33,
  9.29,
  9.33,
  9.29,
  9.29,
  9.33,
  9.29,
  9.33,
  9.29,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29
].asMap();

final data2 = [
  3.02,
  3.43,
  3.50,
  3.25,
  2.99,
  3.08,
  3.54,
  4.12,
  4.04,
  4.74,
  5.42,
  7.70,
  5.92,
  5.25,
  5.80,
  5.82,
  5.03,
  4.99,
  4.62,
  4.62,
  4.46,
  6.12,
  6.13,
  5.37,
  5.38,
  5.70,
  6.33,
  6.26,
  5.92,
  5.41,
  5.15,
  6.34,
  6.16,
  6.58,
  6.15,
  6.13,
  6.95,
  7.16,
  6.46,
  7.17,
  7.62,
  9.52,
  1.75,
  3.41,
  0.30,
  3.05,
  3.45,
  2.14,
  1.88,
  2.02,
  2.25,
  2.20,
  2.18,
  2.49,
  2.87,
  3.06,
  3.00,
  2.35,
  2.08,
  2.22,
  2.24,
  2.43,
  2.14,
  2.16,
  2.16,
  1.85,
  2.02,
  1.90,
  2.12,
  1.71,
  1.85,
  1.77,
  1.79,
  2.14,
  2.25,
  2.29,
  2.31,
  2.79,
  2.54,
  2.72,
  2.37,
  2.35,
  2.41,
  2.66,
  2.79,
  3.04,
  3.58,
  4.29,
  3.99,
  4.42,
  5.05,
  5.01,
  5.51,
  8.90,
  8.16,
  5.61,
  5.23,
  5.19,
  4.19,
  3.72,
  3.10,
  2.97,
  2.18,
  2.45,
  2.33,
  2.29,
  2.31,
  2.31,
  8.68,
  7.54,
  6.88,
  7.16,
  6.25,
  6.20,
  6.16,
  7.13,
  4.90,
  5.84,
  7.41,
  6.73,
  6.54,
  8,
  7.11,
  7.59,
  7.63,
  7.34,
  6.21,
  6.21,
  6.08,
  6.74,
  7.09,
  7.11,
  7.99,
  8.53,
  9.41,
  0.17,
  1.26,
  2.68,
  1.08,
  8.25,
  7.66,
  6.74,
  6.67,
  5.82,
  5.24,
  4.51,
  3.95,
  3.5,
  3.83,
  3.79,
  3.37,
  3.14,
  2.99,
  4.00,
  3.66,
  5.34,
  5.83,
  5.32,
  4.29,
  4.03,
  4.13,
  4.79,
  4.62,
  4.32,
  3.89,
  3.43,
  3.70,
  4.25,
  4.49,
  4.08,
  4.23,
  4.02,
  3.95,
  3.53,
  3.14,
  3.58,
  3.87,
  4.08,
  4.55,
  4.25,
  4.75,
  4.79,
  4.72,
  4.62,
  4.43,
  4.25,
  4.58,
  4.83,
  4.72,
  5.16,
  4.75,
  5.14,
  4.89,
  5.14,
  5.79,
  6.08,
  5.83,
  5.52,
  5.38,
  5.70,
  5.83,
  5.45,
  5.83,
  5.38,
  5.89,
  6.00,
  6.20,
  6.25,
  6.54,
  6.38,
  6.34,
  6.28,
  6.66,
  6.37,
  6.13,
  6.00,
  6.33,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  6.37,
  6.08,
  6.37,
  6.28,
  6.45,
  6.83,
  6.75,
  6.92,
  6.54,
  7.04,
  7.42,
  7.13,
  7.30,
  7.59,
  7.42,
  7.71,
  7.83,
  7.71,
  7.54,
  8.00,
  8.04,
  7.95,
  7.83,
  8.04,
  7.95,
  8.04,
  8.37,
  8.41,
  8.66,
  8.79,
  8.66,
  8.66,
  8.62,
  8.91,
  9.08,
  9.12,
  9.16,
  9.12,
  9.20,
  9.29,
  9.29,
  9.25,
  9.37,
  9.29,
  9.25,
  9.29,
  9.37,
  9.29,
  9.37,
  9.41,
  9.41,
  9.41,
  9.41,
  9.45,
  9.50,
  9.50,
  9.41,
  9.41,
  9.45,
  9.37,
  9.37,
  9.37,
  9.29,
  9.29,
  9.33,
  9.25,
  9.29,
  9.29,
  9.33,
  9.29,
  9.33,
  9.29,
  9.29,
  9.33,
  9.29,
  9.33,
  9.29,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.25,
  9.29,
  9.25,
  9.25,
  9.29
].asMap();
