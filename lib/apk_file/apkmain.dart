import 'package:flutter/material.dart';
import 'package:fraudulent/apk_file/fb.dart';
import 'package:fraudulent/apk_file/gamail.dart';
import 'package:fraudulent/apk_file/tele.dart';
import 'package:fraudulent/apk_file/whats.dart';
import 'package:fraudulent/betting/global/colors.dart';

class SocialListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: white),
        title: Text(
          'Social Apps',
          style: TextStyle(color: white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildListItem('Facebook', Icons.facebook, Colors.blue, context),
          SizedBox(height: 16),
          _buildListItem('Gmail', Icons.email, Colors.red, context),
          SizedBox(height: 16),
          _buildListItem('WhatsApp', Icons.chat, Colors.green, context),
          SizedBox(height: 16),
          _buildListItem(
              'Telegram', Icons.telegram, Colors.lightBlueAccent, context),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon, Color color, context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10),
          child: Icon(icon, color: color, size: 30),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          // Handle tap event here
          title == "Facebook"
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreenFB()))
              : title == "Gmail"
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GmailChatScreen()))
                  : title == "WhatsApp"
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WhatsAppChatScreen()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelegramChatScreen(),
                          ),
                        );
        },
      ),
    );
  }
}

void showBottomSheetSocial(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 40,
            ),
            SizedBox(height: 20),
            Text(
              "Warning",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "The apk is being downloaded. By downloading this, your personal data might be breached.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OTPShareScreen()
                      // ,
                      ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 16, color: white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class OTPShareScreen extends StatelessWidget {
  const OTPShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/waOTP.jpeg',
              height: 500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Congra(),
                  ),
                );
              },
              child: Text("Next"))
        ],
      ),
    );
  }
}
