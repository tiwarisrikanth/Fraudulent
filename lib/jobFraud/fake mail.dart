import 'dart:async';

import 'package:flutter/material.dart';

class EmailScreensssss extends StatefulWidget {
  @override
  State<EmailScreensssss> createState() => _EmailScreensssssState();
}

class _EmailScreensssssState extends State<EmailScreensssss> {
  void showProcessingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProcessingDialog();
      },
    );

    Timer(Duration(seconds: 3), () {
      Navigator.pop(context); // Close the dialog
      showSuccessDialog(context);
    });
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessDialog();
      },
    );

    Timer(Duration(seconds: 4), () {
      Navigator.pop(context); // Close the success dialog
      showBottomSheet(context);
    });
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return BottomSheetContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Compose', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle send action
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              // Handle attachment action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more actions
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "To: personemail@gmail.com",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Subject: Interview Invitation for Flutter Developer Position",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Dear [Candidate's Name],\n\n"
                "I hope this message finds you well.\n\n"
                "We are pleased to inform you that you have been shortlisted for an interview for the position of Flutter Developer at [Company Name]. We were impressed with your qualifications and experience, and we are excited to learn more about your skills and how you can contribute to our team.\n\n"
                "Interview Details:\n"
                "- Date: [Tomorrow's Date]\n"
                "- Time: 10:00 AM\n"
                "- Position: Flutter Developer\n\n"
                "The interview will be conducted [mention the mode: in-person, via video call, etc.]. If it is a video call, we will share the meeting link with you soon.\n\n"
                "Please ensure that you are available at the specified time and date. If you need to reschedule or have any questions, feel free to contact us at [Your Contact Information].\n\n"
                "We look forward to speaking with you and discussing how you can be a valuable addition to our team.\n\n"
                "Thank you for your interest in [Company Name].\n\n"
                "Best regards,\n\n"
                "personname\n"
                "Flutter Developer\n"
                "So and So\n"
                "\n"
                "personemail@gmail.com\n"
                "987654321234",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'I can register your spot for the position if you pay me 10000/- rupees',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        showProcessingDialog(context);

                        // Add your payment logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        // onPrimary: Colors.blue, // Text color
                      ),
                      child: Text('Pay Now',style: TextStyle(color: Colors.blue),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Processing your payment...'),
        ],
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 60),
          SizedBox(height: 20),
          Text(
              'Your payment was successful.\n\nPlease wait for further notice...'),
        ],
      ),
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  void showProcessingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProcessingDialog();
      },
    );

    Timer(Duration(seconds: 3), () {
      Navigator.pop(context); // Close the dialog
      showFinalSuccessDialog(context);
    });
  }

  void showFinalSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessDialog();
      },
    );

    Timer(Duration(seconds: 4), () {
      Navigator.pop(context); // Close the success dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WarningScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "I hope you're doing well. \n\nI am contacting you today with a friendly reminder about caution deposit for your job placement confirmation,pls pay 1Lakh rupees and so that i can confirm your job",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigator.pop(context); // Close the bottom sheet
              showProcessingDialog(context);
            },
            child: Text('Pay Now'),
          ),
        ],
      ),
    );
  }
}

class WarningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Warning')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'After that, the person never contacts you or lifts your calls or replies to your messages.\n\nBeware of these scams as jobs are important and getting them this lightly is not possible. Make sure you visit a company once before making any payments.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
