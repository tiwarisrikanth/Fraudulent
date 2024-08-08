import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StockTradeIn extends StatefulWidget {
  @override
  State<StockTradeIn> createState() => _StockTradeInState();
}

class _StockTradeInState extends State<StockTradeIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://example.com/profile.jpg'), // replace with your image
          ),
        ),
        title: Text('Ralph Edwards'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
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
              Text(
                'YOUR BALANCE',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '\$88,648.43',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {},
                  ),
                ],
              ),
              Text(
                '+\$18,540.00 (+10.9%)',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 3.1),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilterButton(label: '1D'),
                  FilterButton(label: '1W'),
                  FilterButton(label: '1M'),
                  FilterButton(label: '3M'),
                  FilterButton(label: '6M', isSelected: true),
                  FilterButton(label: '1Y'),
                ],
              ),
              SizedBox(height: 16),
              PortfolioSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  FilterButton({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }
}

class PortfolioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Portfolio',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'Market',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            PortfolioItem(
              iconPath: 'assets/ethereum.svg',
              name: 'Ethereum',
              shortName: 'ETH',
              amount: '3.13',
              value: '\$24,849.71',
            ),
            PortfolioItem(
              iconPath: 'assets/bitcoin.svg',
              name: 'Bitcoin',
              shortName: 'BTC',
              amount: '0.49',
              value: '\$14,609.69',
            ),
            PortfolioItem(
              iconPath: 'assets/polygon.svg',
              name: 'Polygon',
              shortName: 'MATIC',
              amount: '13,370.64',
              value: '\$10,305.42',
            ),
          ],
        ),
      ),
    );
  }
}

class PortfolioItem extends StatelessWidget {
  final String iconPath;
  final String name;
  final String shortName;
  final String amount;
  final String value;

  PortfolioItem({
    required this.iconPath,
    required this.name,
    required this.shortName,
    required this.amount,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                shortName,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
