import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fraudulent/home.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';
import 'package:fraudulent/stockexchange/stock_main.dart';
import 'package:fraudulent/warning.dart';

class StockChatWhatTele extends StatefulWidget {
  @override
  State<StockChatWhatTele> createState() => _StockChatWhatTeleState();
}

class _StockChatWhatTeleState extends State<StockChatWhatTele> {
  late ScrollController _scrollController;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, String>> messages = [
    {
      "message": "I earned 100000 by just investing 40000 in an hour",
      "time": "12:01 AM",
      "name": "Ganesh"
    },
    {
      "message": "I earned 150000 by just investing 50000 in two hours",
      "time": "12:08 AM",
      "name": "Jonathan"
    },
    {
      "message": "I earned 200000 by just investing 70000 in three hours",
      "time": "12:15 AM",
      "name": "John"
    },
    {
      "message": "I earned 250000 by just investing 80000 in four hours",
      "time": "12:22 AM",
      "name": "Bri"
    },
    {
      "message": "I earned 300000 by just investing 100000 in five hours",
      "time": "12:29 AM",
      "name": "Shiv"
    },
    {
      "message": "I earned 350000 by just investing 120000 in six hours",
      "time": "12:36 AM",
      "name": "Somesh"
    },
    {
      "message": "I earned 400000 by just investing 140000 in seven hours",
      "time": "12:43 AM",
      "name": "Sarthak"
    },
    {
      "message":
          "If you want to earn money like the people above are earning Buy the stock details given below and earn\nStock Details\n\nStock Name: Shopify Inc\nStock Price: \$ 95.38",
      "time": "12:43 AM",
      "name": "Admin"
    },
  ];

  int _currentIndex = 0;

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      print("Message Sent: ${_controller.text}");
      _controller.clear();
      Navigator.push(
        context,
        FadePageRoute(
          page: ScamWarningScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(Duration(seconds: 1), (Timer timer) {
        if (_currentIndex < messages.length) {
          setState(() {
            _currentIndex++;
          });
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return await Navigator.pushAndRemoveUntil(
      context,
      FadePageRoute(page: FraudTypesGrid()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          titleSpacing: 0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 69, 85, 255),
          title: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Some Scammers Group',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/d.png',
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "You joined using group link",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        for (int i = 0; i < _currentIndex; i++)
                          _buildMessage(messages[i]),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Action to be performed when the button is pressed
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StockExHomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 12.0), // Padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded corners
                              ),
                            ),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                fontSize: 16.0, // Font size
                                fontWeight: FontWeight.bold, // Font weight
                              ),
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Container(
                        //     margin: EdgeInsets.symmetric(
                        //         vertical: 5, horizontal: 10),
                        //     padding: EdgeInsets.all(10),
                        //     decoration: BoxDecoration(
                        //       color: Colors.black,
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: Text(
                        //         "Below message is sent to the user by a random guy over the WhatsApp",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 20),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Container(
                        //     margin: EdgeInsets.symmetric(
                        //         vertical: 5, horizontal: 10),
                        //     padding: EdgeInsets.all(10),
                        //     decoration: BoxDecoration(
                        //       color: Colors.blueAccent,
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.end,
                        //       children: [
                        //         Text(
                        //           "Hey There,\nHope you are having a good day just wanted to let you know that there is a group which can predict the next uprising Stock\n\nif you want to earn tremendous amount can follow the link below\n\n\nhttps://t.me/642tr67tr6732r278/",
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 16),
                        //         ),
                        //         SizedBox(height: 5),
                        //         Text(
                        //           "12:00 AM",
                        //           style: TextStyle(
                        //               color: Colors.white70, fontSize: 12),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 20),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Container(
                        //     margin: EdgeInsets.symmetric(
                        //         vertical: 5, horizontal: 10),
                        //     padding: EdgeInsets.all(10),
                        //     decoration: BoxDecoration(
                        //       color: Colors.black,
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: Text(
                        //         "After looking at the message user clicked on the link provided to him in the above message and he is being navigated to the telegram group",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                _buildBottomBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Map<String, String> message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width - 120,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${message['name']}: ${message['message']}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              message['time']!,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      color: Color.fromARGB(255, 69, 85, 255),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.attach_file),
              onPressed: () {
                Navigator.push(
                  context,
                  FadePageRoute(
                    page: ScamWarningScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                Navigator.push(
                  context,
                  FadePageRoute(
                    page: ScamWarningScreen(),
                  ),
                );
              },
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Type a message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
