import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fraudulent/apk_file/apkmain.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/jobFraud/fake%20mail.dart';
import 'package:fraudulent/warning.dart';

class WhatsAppChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with a profile image URL
            ),
            SizedBox(width: 10),
            Text('Bank'),
          ],
        ),
        actions: [
          Icon(Icons.videocam),
          SizedBox(width: 15),
          Icon(Icons.call),
          SizedBox(width: 15),
          Icon(Icons.more_vert),
        ],
      ),
      backgroundColor: Color(0xFFECE5DD),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildReceivedMessage(
                "Hey! You need to update your KYC details to reflect and update to your bank account"),
            // _buildSentMessage("No, what's it about?"),
            // _buildReceivedMessage(
            //     "It's amazing! You can get free coupons and discounts on almost anything."),
            // _buildSentMessage("Wow, that sounds awesome!"),
            // _buildReceivedMessage(
            //     "Yeah, I've saved so much money with it. You should check it out!"),
            _buildFakeLinkMessage("Click the link to download.", context),
          ],
        ),
      ),
    );
  }

  Widget _buildReceivedMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildSentMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFDCF8C6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildFakeLinkMessage(String text, context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          showBottomSheetSocial(context);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}

class Congra extends StatelessWidget {
  const Congra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KYC Update!"),
      ),
      body: Column(
        children: [
          Image.network(
              'https://zebpay.com/in/wp-content/uploads/2023/10/kyc-Zero-doc-start.png',
              height: 300),
          SizedBox(
            height: 20,
          ),
          Text(
            'From now onwards, All your data is being monitored by hacker and also can make transactions from your bank account (Because you installed apk and shared OTP)',
            style: TextStyle(color: red, fontSize: 23),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Click Next to see examples',
            style: TextStyle(color: red, fontSize: 23),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataBreachWarningScreen()));
              },
              child: Text("Next"))
        ],
      ),
    );
  }
}

class DataBreachWarningScreen extends StatefulWidget {
  @override
  State<DataBreachWarningScreen> createState() =>
      _DataBreachWarningScreenState();
}

class _DataBreachWarningScreenState extends State<DataBreachWarningScreen> {
  // @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 15), () {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => ScamWarningScreen()));
  //   });
  //   super.initState();
  // }

  final List<String> imgList = [
    'assets/images/wafa.jpeg',
    'assets/images/waconta.jpeg',
    'assets/images/wagallery.jpeg',
    'assets/images/waaccc.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(color: white),
        title: Text(
          'Warning',
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        backgroundColor: Colors.black,
        actions: [
          Align(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScamWarningScreen()));
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Got it!",
                      style: TextStyle(color: white),
                    ),
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                              child: Image.asset(item,
                                  fit: BoxFit.cover, width: 1000),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Text(
                "Your Data Could Be at Risk",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "By downloading the app, your personal data such as contacts, bank accounts, and social media could be accessed by hackers. They can use IMPS to steal your money and misuse your information.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              _buildImageRow(
                context,
                'assets/images/contsss.png', // Replace with your asset path
                'Contacts',
                'Hackers could access your contact list and spam or scam your friends and family.',
              ),
              SizedBox(height: 20),
              _buildImageRow(
                context,
                'assets/images/bankacc.jpg', // Replace with your asset path
                'Bank Accounts',
                'Sensitive information from your bank accounts could be compromised and used for unauthorized transactions.',
              ),
              SizedBox(height: 20),
              _buildImageRow(
                context,
                'assets/images/social.png', // Replace with your asset path
                'Social Media',
                'Your social media accounts could be hacked and used to impersonate you, leading to identity theft.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageRow(BuildContext context, String imagePath, String title,
      String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
