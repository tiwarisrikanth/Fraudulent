import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fraudulent/betting/views/auth/phone.dart';
import 'package:fraudulent/digitalarrest/incomming%20call.dart';
import 'package:fraudulent/jobFraud/firstScreen.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';

class FraudTypesGrid extends StatefulWidget {
  @override
  _FraudTypesGridState createState() => _FraudTypesGridState();
}

class _FraudTypesGridState extends State<FraudTypesGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> fraudTypes = [
    {'name': 'Loan Apps Harassment', 'icon': Icons.money_off},
    {'name': 'Share Marketing', 'icon': Icons.trending_up},
    {'name': 'Job Frauds', 'icon': Icons.work_off},
    {'name': 'Aadhar Enabled Payment System', 'icon': Icons.fingerprint},
    {'name': 'Digital Arrest', 'icon': Icons.gavel},
    {'name': 'APK File/Link Opening Frauds', 'icon': Icons.link_off},
    {'name': 'Online Shopping Frauds', 'icon': Icons.shopping_cart},
    {'name': 'Honey Trap', 'icon': Icons.favorite},
    {'name': 'Sextortion', 'icon': Icons.warning},
    {'name': 'Investment Frauds', 'icon': Icons.attach_money},
    {'name': 'Cyber Bullying', 'icon': Icons.person_off},
    {'name': 'Crypto Currency/Bitcoin Trading', 'icon': Icons.currency_bitcoin},
    {'name': 'Lottery Frauds', 'icon': Icons.casino},
    {'name': 'Social Media Harassment', 'icon': Icons.people},
    {'name': 'Customer Care Frauds', 'icon': Icons.headset_mic},
    {'name': 'Online Gaming Frauds', 'icon': Icons.sports_esports},

  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Fraud Types', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Positioned(
          //   top: -20,
          //   left: -40,
          //   child: AnimatedBuilder(
          //     animation: _animation,
          //     builder: (context, child) {
          //       return Opacity(
          //         opacity: 0.1 + (_animation.value * 0.2),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(90),
          //             gradient: LinearGradient(
          //               colors: [Colors.blue.shade200, Colors.purple.shade200],
          //               begin: Alignment.topLeft,
          //               end: Alignment.bottomRight,
          //             ),
          //           ),
          //           width: MediaQuery.of(context).size.width *
          //               (0.5 + (_animation.value * 0.5)),
          //           height: MediaQuery.of(context).size.height *
          //               (0.5 + (_animation.value * 0.5)),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: fraudTypes.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: getRandomColor(),
                child: InkWell(
                  onTap: () {
                    switch (index) {
                      case 0: // Loan Apps Harassment
                        // _showLoanAppsHarassmentInfo(context);
                        break;
                      case 1: // Share Marketing
                        // _showShareMarketingInfo(context);
                        break;
                      case 2: // Job Frauds
           Navigator.push(
                          context,
                          FadePageRoute(
                            page: EmailListScreen(),
                          ),
                        );
                        break;
                      case 4:
                        Navigator.push(
                          context,
                          FadePageRoute(
                            page: IncomingCallScreen2(),
                          ),
                        );

                        break;
                      case 8:
                        Navigator.push(
                          context,
                          FadePageRoute(
                            page: IncomingCallScreen(),
                          ),
                        );

                        break;
                      // Add cases for other indices
                      case 15: // Online Gaming Frauds
                            Navigator.push(
                          context,
                          FadePageRoute(
                            page: Enter_Phone(),
                          ),
                        );
                        break;
                      default:
                      // _showGenericFraudInfo(context, fraudTypes[index]['name']);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        fraudTypes[index]['icon'],
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          fraudTypes[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
