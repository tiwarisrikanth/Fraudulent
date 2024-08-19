import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fraudulent/jobFraud/fake%20mail.dart';
import 'package:fraudulent/warning.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// void main() {
//   runApp(JobFraudAwarenessApp());
// }

class JobFraudAwarenessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Fraud Awareness',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: EmailListScreen(),
    );
  }
}

class EmailListScreen extends StatefulWidget {
  @override
  State<EmailListScreen> createState() => _EmailListScreenState();
}

class _EmailListScreenState extends State<EmailListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 1), () {
      _showAlertDialog(context);
    });
    super.initState();
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Image.asset(
                'assets/images/imagg.jpeg',
                height: 150,
                width: double.infinity,
              ),
              SizedBox(
                height: 5,
              ),
              Text("We are Hiring"),
            ],
          ),
          content:
              Text("Are you interested to work in Multi National Company?"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                // Perform some action
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmailScreensssss()));
                // Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  String pdfurl =
      "https://community.pepperdine.edu/studentemployment/content/job-offer-letter-template.pdf";

  final List<Email> emails = [
    Email(
      subject: "You got selected!",
      sender: "HR Department",
      snippet: "Congratulations! You have been selected...",
      time: "2:45 PM",
      pdfUrl:
          "https://community.pepperdine.edu/studentemployment/content/job-offer-letter-template.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
    ),
    Email(
      subject: "Interview Confirmation",
      sender: "Recruitment Team",
      snippet: "Your interview is scheduled for next week...",
      time: "10:30 AM",
      pdfUrl:
          "https://community.pepperdine.edu/studentemployment/content/job-offer-letter-template.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
    ),
    Email(
      subject: "Orientation Program",
      sender: "HR Department",
      snippet: "We are pleased to invite you to our orientation program...",
      time: "9:15 AM",
      pdfUrl:
          "https://community.pepperdine.edu/studentemployment/content/job-offer-letter-template.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/men/2.jpg",
    ),
    Email(
      subject: "Document Submission",
      sender: "Admin Team",
      snippet: "Please submit the necessary documents...",
      time: "4:00 PM",
      pdfUrl:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
    ),
    Email(
      subject: "Welcome to the Team!",
      sender: "CEO",
      snippet: "We are excited to have you on board...",
      time: "11:00 AM",
      pdfUrl:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/men/3.jpg",
    ),
    Email(
      subject: "Project Kickoff Meeting",
      sender: "Project Manager",
      snippet: "Join us for the project kickoff meeting...",
      time: "3:30 PM",
      pdfUrl:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/women/3.jpg",
    ),
    Email(
      subject: "Training Schedule",
      sender: "Training Coordinator",
      snippet: "Here is the training schedule for the next month...",
      time: "8:45 AM",
      pdfUrl:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/men/4.jpg",
    ),
    Email(
      subject: "Team Outing",
      sender: "HR Department",
      snippet: "We are organizing a team outing next weekend...",
      time: "5:15 PM",
      pdfUrl:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/women/4.jpg",
    ),
    Email(
      subject: "Performance Review",
      sender: "Manager",
      snippet: "Your performance review is scheduled for...",
      time: "2:00 PM",
      pdfUrl:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/men/5.jpg",
    ),
    Email(
      subject: "Holiday Announcement",
      sender: "Admin Team",
      snippet: "The office will be closed for the upcoming holiday...",
      time: "12:00 PM",
      pdfUrl:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      profileImageUrl: "https://randomuser.me/api/portraits/women/5.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Primary'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
          ],
        ),
        drawer: Drawer(
            // Implement navigation drawer
            ),
        body: ListView.builder(
          itemCount: emails.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(emails[index].profileImageUrl),
              ),
              title: Text(
                emails[index].subject,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(emails[index].sender),
                  Text(
                    emails[index].snippet,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: Text(emails[index].time),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EmailDetailScreen(email: emails[index]),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Implement compose email functionality
          },
          child: Icon(Icons.edit),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}

class EmailDetailScreen extends StatelessWidget {
  final Email email;

  EmailDetailScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "From: ${email.sender}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("To: me"),
            SizedBox(height: 8.0),
            Text("Date: ${email.time}"),
            SizedBox(height: 16.0),
            Text(
              "Dear Candidate,",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              "Congratulations! We are pleased to inform you that you have been selected for the position at our esteemed company.",
            ),
            SizedBox(height: 16.0),
            Text(
              "Company Info:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "Our company is a leading firm in the industry, known for its innovative solutions and dynamic work environment.",
            ),
            SizedBox(height: 16.0),
            Text(
              "Job Info:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("Position: Software Engineer"),
            Text("Location: New York, NY"),
            Text("Salary: \$90,000 per annum"),
            Text("Perks: Health insurance, 401k, Paid time off"),
            SizedBox(height: 16.0),
            Text(
              "Please find attached your offer letter for more details.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfViewScreen(pdfUrl: email.pdfUrl),
                  ),
                );
              },
              child: Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.picture_as_pdf, color: Colors.red),
                    SizedBox(width: 8.0),
                    Text("Offer_Letter.pdf"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Next Steps:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "1. Review the offer letter attached.\n2. Prepare the necessary documents listed in the offer letter.\n3. Confirm your acceptance by replying to this email.\n4. Complete the onboarding formalities as per the instructions.",
            ),
            SizedBox(height: 16.0),
            Text(
              "We look forward to welcoming you to our team and working together towards our common goals.",
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ),
                );
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfViewScreen extends StatefulWidget {
  final String pdfUrl;

  PdfViewScreen({required this.pdfUrl});

  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  String? localFilePath;

  @override
  void initState() {
    super.initState();
    _downloadAndSavePdf();
  }

  Future<void> _downloadAndSavePdf() async {
    final response = await http.get(Uri.parse(widget.pdfUrl));
    final bytes = response.bodyBytes;

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/temp.pdf');

    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      localFilePath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Offer'),
      ),
      body: localFilePath != null
          ? PDFView(
              filePath: localFilePath!,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message(sender: "HR", text: "Congratulations on your selection!"),
    Message(sender: "Candidate", text: "Thank you!"),
    Message(sender: "HR", text: "There are a few formalities to be completed."),
    Message(sender: "Candidate", text: "Okay."),
    Message(
        sender: "HR",
        text:
            "Please deposit the joining fee of ₹15000 for further processing."),
    Message(
        sender: "HR",
        text: "Make it fast so that you can join as early as possible."),
    Message(
        sender: "HR",
        text: "Click on the button below to complete the process."),
  ];

  final ScrollController _scrollController = ScrollController();
  Razorpay _razorpay = Razorpay();
  bool _showPayButton = false;

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      messages.add(
          Message(sender: "Candidate", text: "Hi mam, I have done payment."));
      messages.add(Message(sender: "Candidate", text: "Mam, please reply."));
      _showPayButton = false; // Hide button after payment
    });
    _scrollToBottom();
    Future.delayed(Duration(seconds: 5), () {
      if (messages.last.sender == "Candidate" &&
          !messages
              .any((msg) => msg.sender == "HR" && msg.text.contains("Reply"))) {
        _showScamWarning();
      }
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
  }

  void _makePayment() {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 15000 * 100, // amount in paise
      'name': 'Company Name',
      'description': 'Joining Fee',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _showScamWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://imgs.search.brave.com/55VMqdL7AYhtmBddtxIWypBMvrBlBIRUo3CCjfzlDlQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvZW4vdGh1bWIv/ZS9lYS9BcHBvbGlj/ZSUyOGVtYmxlbSUy/OS5wbmcvNTEycHgt/QXBwb2xpY2UlMjhl/bWJsZW0lMjkucG5n',
                height: 100,
              ),
              SizedBox(height: 16.0),
              Text(
                'This is a simulation meant for your awareness by AP Police.',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                'People that offer you a job should give you money, not the other way around.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                'Stay away from such frauds.',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  bool _shouldShowPayButton() {
    // Check if the last HR message contains the payment instruction
    return messages.isNotEmpty &&
        messages.last.sender == "HR" &&
        messages.last.text
            .contains("Click on the button below to complete the process.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with HR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isHR = message.sender == "HR";
                return Align(
                  alignment:
                      isHR ? Alignment.centerLeft : Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isHR ? Colors.blue[100] : Colors.green[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.sender,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isHR ? Colors.blue : Colors.green,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(message.text),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_shouldShowPayButton())
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _makePayment();
                  },
                  child: Text("Pay Now"),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Implement message sending functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

class Email {
  final String subject;
  final String sender;
  final String snippet;
  final String time;
  final String pdfUrl;
  final String profileImageUrl;

  Email({
    required this.subject,
    required this.sender,
    required this.snippet,
    required this.time,
    required this.pdfUrl,
    required this.profileImageUrl,
  });
}
