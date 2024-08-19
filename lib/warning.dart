import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fraudulent/home.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';

class ScamWarningScreen extends StatefulWidget {
  @override
  _ScamWarningScreenState createState() => _ScamWarningScreenState();
}

class _ScamWarningScreenState extends State<ScamWarningScreen> {
  @override
  void initState() {
    super.initState();
    // Schedule the navigation to the Home page after 10 seconds
    Timer(Duration(seconds: 10), () {
      Navigator.pushAndRemoveUntil(
          context, FadePageRoute(page: FraudTypesGrid()), (route) => false);
    });
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/en/e/ea/Appolice%28emblem%29.png', // AP Police logo URL
                  height: 150,
                ),
                SizedBox(height: 20),
                Text(
                  'Beware of this kind of scams... Do not send or transfer any amount. Just ask for help from the police. We will guide you.\n\nBe aware. Be safe.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildCloseButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context, FadePageRoute(page: FraudTypesGrid()), (route) => false);
        },
        child: Text("Close"),
      ),
    );
  }
}

returnsssss(context) {
  Navigator.pushAndRemoveUntil(
      context, FadePageRoute(page: FraudTypesGrid()), (route) => false);
}
