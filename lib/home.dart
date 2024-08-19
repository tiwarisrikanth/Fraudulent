// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:fraudulent/adhaar/firstScreen.dart';
// import 'package:fraudulent/betting/views/auth/logIn.dart';
// import 'package:fraudulent/betting/views/auth/phone.dart';
// import 'package:fraudulent/digitalarrest/incomming%20call.dart';
// import 'package:fraudulent/jobFraud/firstScreen.dart';
// import 'package:fraudulent/partTime/auth/login.dart';
// import 'package:fraudulent/sextortaion/incoming_video_call.dart';
// import 'package:fraudulent/stockexchange/stock_main.dart';
// import 'package:fraudulent/stockexchange/stockexlogin.dart';
// import 'package:fraudulent/stockexchange/trading.warning.dart';

// class FraudTypesGrid extends StatefulWidget {
//   @override
//   _FraudTypesGridState createState() => _FraudTypesGridState();
// }

// class _FraudTypesGridState extends State<FraudTypesGrid>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   final List<Map<String, dynamic>> fraudTypes = [
//     {'name': 'Digital Arrest', 'icon': Icons.gavel},
//     {'name': 'Sextortion', 'icon': Icons.warning},
//     {'name': 'Online Gaming Frauds', 'icon': Icons.sports_esports},
//     {'name': 'Job Frauds', 'icon': Icons.work_off},
//     {'name': 'Share Marketing', 'icon': Icons.trending_up},
//     {'name': 'Loan Apps Harassment', 'icon': Icons.money_off},
//     {'name': 'Honey Trap', 'icon': Icons.favorite},
//     {'name': 'Aadhar Enabled Payment System', 'icon': Icons.fingerprint},

//     {'name': 'Online Shopping Frauds', 'icon': Icons.shopping_cart},
//     {'name': 'Work From Home', 'icon': Icons.work_history},

//     // {'name': 'APK File/Link Opening Frauds', 'icon': Icons.link_off},
//     // {'name': 'Investment Frauds', 'icon': Icons.attach_money},
//     // {'name': 'Cyber Bullying', 'icon': Icons.person_off},
//     // {'name': 'Crypto Currency/Bitcoin Trading', 'icon': Icons.currency_bitcoin},
//     // {'name': 'Lottery Frauds', 'icon': Icons.casino},
//     // {'name': 'Social Media Harassment', 'icon': Icons.people},
//     // {'name': 'Customer Care Frauds', 'icon': Icons.headset_mic},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     )..repeat(reverse: true);
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Color getRandomColor() {
//     return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
//         .withOpacity(0.7);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title:
//             Text('Be a cyber citizen', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           // Positioned(
//           //   top: -20,
//           //   left: -40,
//           //   child: AnimatedBuilder(
//           //     animation: _animation,
//           //     builder: (context, child) {
//           //       return Opacity(
//           //         opacity: 0.1 + (_animation.value * 0.2),
//           //         child: Container(
//           //           decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(90),
//           //             gradient: LinearGradient(
//           //               colors: [Colors.blue.shade200, Colors.purple.shade200],
//           //               begin: Alignment.topLeft,
//           //               end: Alignment.bottomRight,
//           //             ),
//           //           ),
//           //           width: MediaQuery.of(context).size.width *
//           //               (0.5 + (_animation.value * 0.5)),
//           //           height: MediaQuery.of(context).size.height *
//           //               (0.5 + (_animation.value * 0.5)),
//           //         ),
//           //       );
//           //     },
//           //   ),
//           // ),
//           GridView.builder(
//             padding: EdgeInsets.all(16),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.75,
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//             ),
//             itemCount: fraudTypes.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 color: getRandomColor(),
//                 child: InkWell(
//                   onTap: () {
//                     switch (index) {
//                       case 0: // Digital Arrest
//                         Navigator.push(
//                           context,
//                           FadePageRoute(
//                             page: IncomingCallScreen2(),
//                           ),
//                         );
//                         // _showLoanAppsHarassmentInfo(context);
//                         break;
//                       case 1: // Sextortation
//                         Navigator.push(
//                           context,
//                           FadePageRoute(
//                             page: IncomingCallScreen(),
//                           ),
//                         );
//                         // _showShareMarketingInfo(context);
//                         break;
//                       case 2: // Job Frauds
//                         Navigator.push(
//                           context,
//                           FadePageRoute(
//                             page: EmailListScreen(),
//                           ),
//                         );
//                         break;
//                       case 3:
//                         Navigator.push(
//                           context,
//                           FadePageRoute(
//                             page: InfoScreen(),
//                           ),
//                         );

//                         break;
//                       case 4:
//                         break;
//                       case 5:
//                         Navigator.push(
//                           context,
//                           FadePageRoute(
//                             page: login6(),
//                           ),
//                         );

//                         break;
//                       case 8:
//                         Navigator.push(
//                           context,
//                           FadePageRoute(
//                             page: IncomingCallScreen(),
//                           ),
//                         );

//                         break;
//                       case 9:
//                         Navigator.push(
//                           context,
//                           FadePageRoute(page: TradingWarningScreen()
//                               // StockExHomePage()
//                               // page: StockLoginScreen(),
//                               ),
//                         );

//                         break;
//                       // Add cases for other indices
//                       case 15: // Online Gaming Frauds
//                         Navigator.push(
//                           context,
//                           FadePageRoute(
//                             page: Enter_Phone(),
//                           ),
//                         );
//                         break;
//                       default:
//                       // _showGenericFraudInfo(context, fraudTypes[index]['name']);
//                     }
//                   },
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         fraudTypes[index]['icon'],
//                         size: 40,
//                         color: Colors.white,
//                       ),
//                       SizedBox(height: 8),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 4),
//                         child: Text(
//                           fraudTypes[index]['name'],
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:math';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:direct_caller_sim_choice/direct_caller_sim_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fraudulent/adhaar/firstScreen.dart';
import 'package:fraudulent/apk_file/apkmain.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/betting/views/auth/logIn.dart';
import 'package:fraudulent/betting/views/auth/phone.dart';
import 'package:fraudulent/certificate/certificatedScr.dart';
import 'package:fraudulent/crypto/crypt.dart';
import 'package:fraudulent/customercare/customer.dart';
import 'package:fraudulent/cyber-bullying/cybersplash.dart';
import 'package:fraudulent/digitalarrest/incomming%20call.dart';
import 'package:fraudulent/honeytraps/incoming_video_call.dart';
import 'package:fraudulent/jobFraud/firstScreen.dart';
import 'package:fraudulent/loan/load_home.dart';
import 'package:fraudulent/olx/olx.dart';
import 'package:fraudulent/partTime/auth/login.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';
import 'package:fraudulent/social%20media/splash.dart';
import 'package:fraudulent/stockexchange/chat/whatsappchat.dart';
import 'package:fraudulent/stockexchange/stock_main.dart';
import 'package:fraudulent/stockexchange/stockexlogin.dart';
import 'package:fraudulent/stockexchange/trading.warning.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class FraudTypesGrid extends StatefulWidget {
  @override
  _FraudTypesGridState createState() => _FraudTypesGridState();
}

class _FraudTypesGridState extends State<FraudTypesGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late List<Color> itemColors;
  late Set<int> clickedTiles; // Track clicked tiles
  late SharedPreferences prefs;

  final DirectCaller directCaller = DirectCaller();

  final List<Map<String, dynamic>> fraudTypes = [
    {'name': 'Digital Arrest', 'icon': Icons.gavel},
    {'name': 'Sextortion', 'icon': Icons.warning},
    {'name': 'Online Gaming Frauds', 'icon': Icons.sports_esports},
    {'name': 'Job Frauds', 'icon': Icons.work_off},
    {'name': 'Share Marketing', 'icon': Icons.trending_up},
    {'name': 'Loan Apps Harassment', 'icon': Icons.money_off},
    {'name': 'Honey Trap', 'icon': Icons.favorite},
    {'name': 'Aadhar Enabled Payment System', 'icon': Icons.fingerprint},
    {'name': 'Online Shopping Frauds', 'icon': Icons.shopping_cart},
    {'name': 'Work From Home', 'icon': Icons.work_history},
    {'name': 'Social Media Harassment', 'icon': Icons.groups},
    {'name': 'APK File / Link opening frauds', 'icon': Icons.file_copy},

    // {'name': 'Cyberbullying', 'icon': Icons.crisis_alert},

    {'name': 'Cryto currency / Bitcoin', 'icon': Icons.circle_outlined},
    {'name': 'Customer care frauds', 'icon': Icons.person},
    {
      'name':
          'Report to NCRP\nIf you are a victim of cyber frauds click below NCRP or 1930',
      'icon': Icons.link
    },
    {
      'name':
          'Dial 1930\nIf you are a victim of cyber frauds click below NCRP or 1930',
      'icon': Icons.call
    },
  ];
  //If you are a victim of cyber frauds click below NCRP or 1930

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    itemColors = List.generate(fraudTypes.length, (index) => getRandomColor());
    clickedTiles = {}; // Initialize clicked tiles set
    _loadClickedTiles(); // Load clicked tiles from SharedPreferences
    Future.delayed(Duration(seconds: 1), () {
      requestCallPhonePermission();
    });
  }

  Future<void> requestCallPhonePermission() async {
    var status = await Permission.phone.status;

    if (status.isDenied) {
      // Request the permission
      status = await Permission.phone.request();
    }

    if (status.isGranted) {
      // Permission granted, proceed with the action
      print('CALL_PHONE permission granted');
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, open app settings
      print('CALL_PHONE permission is permanently denied');
      openAppSettings();
    } else {
      // Permission denied
      print('CALL_PHONE permission denied');
    }
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

  Future<void> _loadClickedTiles() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      clickedTiles = (prefs.getStringList('clickedTiles') ?? [])
          .map((index) => int.parse(index))
          .toSet();
    });
  }

  Future<void> _saveClickedTile(int index) async {
    setState(() {
      clickedTiles.add(index);
    });
    await prefs.setStringList(
        'clickedTiles', clickedTiles.map((index) => index.toString()).toList());

    // Check if all tiles are clicked
    if (clickedTiles.length == fraudTypes.length) {
      setState(() {});
    }
  }

  void _navigateToScreen(int index) {
    if (index != 14 && index != 15) {
      if (clickedTiles.contains(index)) {
        // If the tile is already clicked, do not navigate again
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('${fraudTypes[index]['name']} already viewed!')),
        );
        return;
      }

      _saveClickedTile(index);
    }

    switch (index) {
      case 0: // Digital Arrest
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IncomingCallScreen2(),
          ),
        );
        break;
      case 1: // Sextortion
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IncomingCallScreen(),
          ),
        );
        break;
      case 2: // Online Gaming Frauds
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Enter_Phone(),
          ),
        );
        break;
      case 3: // Job Frauds
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobFraudAwarenessApp(),
          ),
        );
        break;
      case 4: // Share Marketing
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StockChatWhat(),
          ),
        );
        break;
      case 5: // Loan Apps Harassment
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoanSection(),
          ),
        );
        break;
      case 6: // Honey Trap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IncomingCallScreenH(),
          ),
        );
        break;
      case 7: // Aadhar Enabled Payment System
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoScreen(),
          ),
        );
        break;
      case 8: // Online Shopping Frauds
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OLXScreen(),
          ),
        );
        break;
      case 9: // Work From Home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const login6(),
          ),
        );
        break;
      case 10: // Work From Home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SplashScreen(),
          ),
        );
        break;
      case 11: // Work From Home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SocialListScreen(),
          ),
        );
        break;
      case 12: // Work From Home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreenCrypto(),
          ),
        );
        break;
      case 13: // Work From Home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoogleSearchScreen(),
          ),
        );
        break;
      case 14: // Work From Home
        launchUrl(Uri.parse('https://i4c.mha.gov.in/ncrp.aspx'));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => GoogleSearchScreen(),
        //   ),
        // );
        break;
      case 15: // Work From Home
        directCaller.makePhoneCall('1930', simSlot: 1);

        // launchUrl(Uri.parse('https://i4c.mha.gov.in/ncrp.aspx'));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => GoogleSearchScreen(),
        //   ),
        // );
        break;
      default:
      // Handle other cases
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: clickedTiles.length >= 14 ? false : true,
        title: Text('Be a Cyber Citizen',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (clickedTiles.length >= 14)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CertificateScreen(),
                  ),
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.purple.shade800.withOpacity(0.6)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: Text(
                    "View Certificate",
                    style: GoogleFonts.poppins(
                      color: white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
              ),
            ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Stack(
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
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
                color: itemColors[index],
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () => _navigateToScreen(index),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              fraudTypes[index]['icon'],
                              size: 40,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                fraudTypes[index]['name'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (clickedTiles.contains(index))
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent,
                          size: 24,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

          // if (clickedTiles.length == fraudTypes.length)
          //   Positioned(
          //     bottom: 16,
          //     right: 16,
          //     child: FloatingActionButton(
          //       onPressed: () async {
          //         SharedPreferences prefs = await SharedPreferences.getInstance();
          //         String? userName = prefs.getString('userName');
          //         if (userName == null) {
          //           // Handle the case where the user name is not available
          //           return;
          //         }

          //         DateTime currentDate = DateTime.now();

          //         CertificateGenerator generator = CertificateGenerator(
          //           imagePath: 'assets/images/img.jpeg', // path to your certificate image
          //         );

          //         File certificate = await generator.generateCertificate(userName, currentDate);

          //         // Display or save the certificate
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(content: Text('Certificate generated successfully!')),
          //         );
          //       },
          //       child: const Icon(Icons.check),
          //     ),
          //   ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 40,
        child: BottomAppBar(
          child: Container(
            child: Center(
                child: Text("Powered by: MSM Technologies",
                    style: TextStyle(color: Colors.blue.shade800))),
          ),
        ),
      ),
    );
  }
}
