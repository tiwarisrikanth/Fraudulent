import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fraudulent/home.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';
import 'package:fraudulent/warning.dart';

class ScreenshotGallery extends StatefulWidget {
  final List<String> screenshots;

  ScreenshotGallery({required this.screenshots});

  @override
  State<ScreenshotGallery> createState() => _ScreenshotGalleryState();
}

class _ScreenshotGalleryState extends State<ScreenshotGallery> {
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
                        'https://firebasestorage.googleapis.com/v0/b/blogged-out.appspot.com/o/anime-girl-window_777271-50156.jpg?alt=media&token=ad1f5fa2-dd32-4483-b5f2-c79355c77573'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Aurora',
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
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Hi Mahesh",
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Hi Swati",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:01 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Come to your video call baby.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:02 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Oh, sure.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:03 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Let's have some fun.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:04 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Yeah, I am ready.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:05 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Okay, then remove your clothes, Mahi.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:06 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Yeah, you too.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:07 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Okay",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:08 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Looking so handsome, baby.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:09 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "You too, looking gorgeous, baby.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:10 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(5),
                            height: 550,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green.shade200),
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 7,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: 680,
                                              child: Center(
                                                  child: imageDisplay(widget
                                                      .screenshots[index])),
                                            );
                                          });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white54,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // image: DecorationImage(image: FileImage(screenshots[index]))
                                            ),
                                            child: Image.file(
                                              File(
                                                widget.screenshots[index],
                                              ),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Hello, have you seen your images?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:11 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Who are you?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:12 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "I'm uploading your images in social media.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:13 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "No. What do you want?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:14 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "If you don't send me money, five lakh rupee, I will post them.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:15 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  " Wait, wait. I am sending I am sending money. Send me your account number. ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:16 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "I will send QR code to you, send screenshot, post, sending money.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:15 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 250,
                            width: 250,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://miro.medium.com/v2/resize:fit:789/1*A9YcoX1YxBUsTg7p-P6GBQ.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Ok, ok.Amount already sent",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "12:16 AM",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
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

  imageDisplay(image) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.file(
        File(
          image,
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
