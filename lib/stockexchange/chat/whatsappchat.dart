import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fraudulent/home.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';
import 'package:fraudulent/stockexchange/chat/telegram.dart';
import 'package:fraudulent/warning.dart';

class StockChatWhat extends StatefulWidget {
  @override
  State<StockChatWhat> createState() => _StockChatWhatState();
}

class _StockChatWhatState extends State<StockChatWhat> {
  late ScrollController _scrollController;

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      // Handle sending message
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

    // Schedule the scroll to happen after 6 seconds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 6), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        // Future.delayed(Duration(seconds: 14), () {
        // Navigator.push(
        //   context,
        //   FadePageRoute(
        //     page: ScamWarningScreen(),
        //   ),
        // );
        // });
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  returnss() {
    Navigator.pushAndRemoveUntil(
        context, FadePageRoute(page: FraudTypesGrid()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnss();
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF25D366),
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
                        'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
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
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Below message is sent to the user by a random guy over the whats app",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StockChatWhatTele()));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 6, 48, 154),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Hey There,\nHope you ar having a good day just wanted to let you know that there is group which can predit the next uprising Stock\n\nif you want to earn tremendos amount can follow teh link below\n\n\nhttps://t.me/642tr67tr6732r278/",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "12:00 AM",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "After looking at the message user clicked on linke provided to him in the above message and he is beign navigated to telegram group",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Align(
                        //   alignment: Alignment.centerRight,
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
                        //           "Hello, Who is this?",
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 16),
                        //         ),
                        //         SizedBox(height: 5),
                        //         Text(
                        //           "12:01 AM",
                        //           style: TextStyle(
                        //               color: Colors.white70, fontSize: 12),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
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
                        //           "If you are free now means Let's have fun !",
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 16),
                        //         ),
                        //         SizedBox(height: 5),
                        //         Text(
                        //           "12:03 AM",
                        //           style: TextStyle(
                        //               color: Colors.white70, fontSize: 12),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        // Align(
                        //   alignment: Alignment.centerRight,
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
                        //           "Yes, sure",
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 16),
                        //         ),
                        //         SizedBox(height: 5),
                        //         Text(
                        //           "12:04 AM",
                        //           style: TextStyle(
                        //               color: Colors.white70, fontSize: 12),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
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
                        //           "Remove your shirt",
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 16),
                        //         ),
                        //         SizedBox(height: 5),
                        //         Text(
                        //           "12:05 AM",
                        //           style: TextStyle(
                        //               color: Colors.white70, fontSize: 12),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Container(
                        //     width: 150,
                        //     height: 70,
                        //     margin: EdgeInsets.symmetric(
                        //         vertical: 5, horizontal: 10),
                        //     padding: EdgeInsets.all(5),
                        //     decoration: BoxDecoration(
                        //       color: Colors.blueAccent,
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: Container(
                        //       margin: EdgeInsets.symmetric(
                        //           vertical: 1, horizontal: 1),
                        //       padding: EdgeInsets.all(5),
                        //       decoration: BoxDecoration(
                        //         color: Colors.white54,
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         children: [
                        //           SizedBox(
                        //             width: 4,
                        //           ),
                        //           Container(
                        //             height: 30,
                        //             width: 30,
                        //             decoration: BoxDecoration(
                        //               borderRadius:
                        //                   BorderRadiusDirectional.circular(90),
                        //               color: Colors.blueAccent.withOpacity(0.4),
                        //             ),
                        //             child: Icon(
                        //               Icons.videocam,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: 4,
                        //           ),
                        //           Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                 "Video Call",
                        //                 style: TextStyle(
                        //                     color: Colors.white, fontSize: 16),
                        //               ),
                        //               Text(
                        //                 "28 mins",
                        //                 style: TextStyle(
                        //                     color: Colors.black, fontSize: 13),
                        //               ),
                        //             ],
                        //           ),
                        //           // SizedBox(height: 5),
                        //           // Text(
                        //           //   "12:03 AM",
                        //           //   style: TextStyle(color: Colors.white70, fontSize: 12),
                        //           // ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Container(
                        //     margin: EdgeInsets.symmetric(
                        //         vertical: 5, horizontal: 10),
                        //     padding: EdgeInsets.all(5),
                        //     height: 280,
                        //     width: 280,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(15),
                        //         color: Colors.blueAccent),
                        //     child: GridView.builder(
                        //         itemCount: 4,
                        //         gridDelegate:
                        //             SliverGridDelegateWithFixedCrossAxisCount(
                        //                 crossAxisCount: 2),
                        //         itemBuilder: (context, index) {
                        //           return InkWell(
                        //             onTap: () {
                        //               showModalBottomSheet<void>(
                        //                   isScrollControlled: true,
                        //                   context: context,
                        //                   builder: (BuildContext context) {
                        //                     return SizedBox(
                        //                       height: 680,
                        //                       child: Center(
                        //                           child: imageDisplay(widget
                        //                               .screenshots[index])),
                        //                     );
                        //                   });
                        //             },
                        //             child: ClipRRect(
                        //               borderRadius: BorderRadius.circular(15),
                        //               child: Padding(
                        //                 padding: const EdgeInsets.all(2.0),
                        //                 child: Container(
                        //                     decoration: BoxDecoration(
                        //                       color: Colors.white54,
                        //                       borderRadius:
                        //                           BorderRadius.circular(15),
                        //                       // image: DecorationImage(image: FileImage(screenshots[index]))
                        //                     ),
                        //                     child: Image.file(
                        //                       File(
                        //                         widget.screenshots[index],
                        //                       ),
                        //                       fit: BoxFit.fill,
                        //                     )),
                        //               ),
                        //             ),
                        //           );
                        //         }),
                        //   ),
                        // ),

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
                        //           "Send me 50,000/- rupees right away else i will forward this images to you contacts",
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 16),
                        //         ),
                        //         SizedBox(height: 5),
                        //         Text(
                        //           "12:55 AM",
                        //           style: TextStyle(
                        //               color: Colors.white70, fontSize: 12),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
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
                        //           "Send me more 50,000/- rupees right away else i will forward this images to you contacts",
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 16),
                        //         ),
                        //         SizedBox(height: 5),
                        //         Text(
                        //           "01:55 AM",
                        //           style: TextStyle(
                        //               color: Colors.white70, fontSize: 12),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        // ListView.builder(
                        //   itemCount: screenshots.length,
                        //   itemBuilder: (context, index) {
                        //     return Container(
                        //         height: 70,
                        //         width: 80,
                        //         child: Image.file(File(screenshots[index])));
                        //   },
                        // ),
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

  Widget _buildBottomBar() {
    return Container(
      color: Color(0xFF25D366),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.attach_file),
              onPressed: () {
                // Handle attach file
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
                // Handle camera
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

  // imageDisplay(image) {
  //   return Container(
  //     height: MediaQuery.of(context).size.height,
  //     width: MediaQuery.of(context).size.width,
  //     child: Image.file(
  //       File(
  //         image,
  //       ),
  //       fit: BoxFit.fill,
  //     ),
  //   );
  // }
}
