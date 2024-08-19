import 'package:flutter/material.dart';
import 'package:fraudulent/apk_file/apkmain.dart';

class TelegramChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0088CC),
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
          Icon(Icons.call),
          SizedBox(width: 15),
          Icon(Icons.more_vert),
        ],
      ),
      backgroundColor: Colors.white,
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
          color: Color(0xFFEAEAEA),
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
          color: Color(0xFFD2F8D2),
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
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
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
