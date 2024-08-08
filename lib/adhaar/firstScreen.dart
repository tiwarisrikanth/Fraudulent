import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Aadhaar Fingerprint Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfoScreen(),
    );
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Aadhaar Fingerprint Authentication'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Applications of Fingerprint Authentication with Aadhaar:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.blue),
              title: Text('Online Payment'),
            ),
            ListTile(
              leading: Icon(Icons.no_accounts, color: Colors.blue),
              title: Text('No UPI Required'),
            ),
            ListTile(
              leading: Icon(Icons.credit_card_off, color: Colors.blue),
              title: Text('No Cards, No MPINs, No UPI Numbers'),
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.blue),
              title: Text('Secure and Easy to Use'),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AadhaarInputScreen()),
                  );
                },
                child: Text('Proceed'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AadhaarInputScreen extends StatelessWidget {
  final TextEditingController aadhaarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aadhaar Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: aadhaarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Aadhaar Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Lottie.asset('assets/images/finger.json'),
            ElevatedButton(
              onPressed: () {
                // Simulate fingerprint authentication here
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Authentication Successful'),
                      content: Text('Fingerprint added successfully.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen()),
                            );
                          },
                          child: Text('Next'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Add Fingerprint'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  void _openLink() async {
    const url =
        'https://play.google.com/store/apps/details?id=in.gov.uidai.mAadhaarPlus&pcampaignid=web_share';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fingerprint,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Secure Payment',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You are about to pay ₹10 to a random user using fingerprint authentication.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(Icons.fingerprint),
              label: Text('Proceed to Pay'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                // Simulate payment process
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Scam Alert'),
                      content: Text(
                          'This is a scam. Stay away from these types of transactions.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Suggestion'),
                                  content: Text(
                                      'Secure your BioMetrics using mAadhar App\n\nhttps://play.google.com/store/apps/details?id=in.gov.uidai.mAadhaarPlus&pcampaignid=web_share'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        _openLink();
                                        // Navigator.popUntil(
                                        //     context, (route) => route.isFirst);
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            // Navigator.popUntil(context, (route) => route.isFirst);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
