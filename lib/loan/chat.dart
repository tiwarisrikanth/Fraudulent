import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fraudulent/home.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';
import 'package:fraudulent/stockexchange/stock_main.dart';
import 'package:fraudulent/warning.dart';

class CHatDryy extends StatefulWidget {
  @override
  State<CHatDryy> createState() => _CHatDryyState();
}

class _CHatDryyState extends State<CHatDryy> {
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
                'Some Scammer',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Container(
                        //     margin: EdgeInsets.symmetric(
                        //         vertical: 5, horizontal: 10),
                        //     padding: EdgeInsets.all(10),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white.withOpacity(0.3),
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(2.0),
                        //       child: Text(
                        //         "You joined using group link",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // for (int i = 0; i < _currentIndex; i++)
                        //   _buildMessage(messages[i]),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaaTXUYGAPK0WaL-6haJqE9KRbY8F2OcKc3_dCdqcIwDVIVZ5WJU7HtvLLCIbJeduq9sw&usqp=CAU"),
                                SizedBox(height: 6),
                                Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaaTXUYGAPK0WaL-6haJqE9KRbY8F2OcKc3_dCdqcIwDVIVZ5WJU7HtvLLCIbJeduq9sw&usqp=CAU"),
                                SizedBox(height: 6),
                                Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaaTXUYGAPK0WaL-6haJqE9KRbY8F2OcKc3_dCdqcIwDVIVZ5WJU7HtvLLCIbJeduq9sw&usqp=CAU"),
                                SizedBox(height: 6),
                                Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaaTXUYGAPK0WaL-6haJqE9KRbY8F2OcKc3_dCdqcIwDVIVZ5WJU7HtvLLCIbJeduq9sw&usqp=CAU"),
                                SizedBox(height: 6),
                                Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaaTXUYGAPK0WaL-6haJqE9KRbY8F2OcKc3_dCdqcIwDVIVZ5WJU7HtvLLCIbJeduq9sw&usqp=CAU"),
                              ],
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       // Action to be performed when the button is pressed
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => StockExHomePage()));
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       primary: Colors.blue, // Background color
                        //       onPrimary: Colors.white, // Text color
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: 20.0, vertical: 12.0), // Padding
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(
                        //             8.0), // Rounded corners
                        //       ),
                        //     ),
                        //     child: Text(
                        //       'Buy Now',
                        //       style: TextStyle(
                        //         fontSize: 16.0, // Font size
                        //         fontWeight: FontWeight.bold, // Font weight
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                // controller: _controller,
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
            IconButton(icon: Icon(Icons.send), onPressed: () {}
                // _sendMessage,
                ),
          ],
        ),
      ),
    );
  }
}
