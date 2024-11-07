import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/home.dart';
import 'package:fraudulent/warning.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class GoogleSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle menu action
              },
            ),
          ],
        ),
        body: GoogleSearchBody(),
      ),
    );
  }
}

// class GoogleSearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           iconTheme: IconThemeData(color: Colors.grey),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.menu),
//               onPressed: () {
//                 // Handle menu action
//               },
//             ),
//           ],
//         ),
//         body: GoogleSearchBody(),
//       ),
//     );
//   }
// }

class GoogleSearchBody extends StatefulWidget {
  @override
  _GoogleSearchBodyState createState() => _GoogleSearchBodyState();
}

class _GoogleSearchBodyState extends State<GoogleSearchBody> {
  bool showResults = true;

  void _search() {
    setState(() {
      showResults = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      children: [
        // Google logo
        Center(
          child: Image.network(
            'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
            height: 92,
          ),
        ),
        SizedBox(height: 40),

        // Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Bank Customer Care Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.mic),
                onPressed: () {
                  // Handle voice search
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 20),

        // Buttons below search bar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _search,
              child: Text('Google Search'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[200],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Handle I'm Feeling Lucky action
              },
              child: Text("I'm Feeling Lucky"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[200],
              ),
            ),
          ],
        ),
        SizedBox(height: 40),

        // Fake search results
        if (showResults) ...[
          SearchResult(title: "XYZ Bank Customer Care", number: "1800-123-456"),
          SearchResult(title: "ABC Bank Customer Care", number: "1800-987-654"),
          SearchResult(title: "PQR Bank Customer Care", number: "1800-555-666"),
          SearchResult(title: "LMN Bank Customer Care", number: "1800-444-222"),
        ],
      ],
    );
  }
}

class SearchResult extends StatelessWidget {
  final String title;
  final String number;

  SearchResult({required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenNewData(),
              ),
            );
          },
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("Customer Care Number: $number"),
        ),
      ),
    );
  }
}

class ScreenNewData extends StatefulWidget {
  const ScreenNewData({super.key});

  @override
  State<ScreenNewData> createState() => _ScreenNewDataState();
}

class _ScreenNewDataState extends State<ScreenNewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Banker Chat',
      //     style: TextStyle(color: white),
      //   ),
      //   backgroundColor: Colors.blueGrey[900],
      // ),
      body: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
              // ChatScreen
            },
            child: Image.network(
              "https://i.sstatic.net/7Bv4z.png",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _messageController = TextEditingController();

  // List<Map<String, String>> messages = [
  //   {
  //     "sender": "Person",
  //     "message": "Hello, Can you please help me with my loan Pre-Closure"
  //   },
  //   {"sender": "Banker", "message": "Yeah, Sure we will help you out."},
  //   {
  //     "sender": "Banker",
  //     "message": "For loan Pre-Closure i will guide you a step by step process"
  //   },
  //   {
  //     "sender": "Banker",
  //     "message":
  //         "Please make sure the call does not gets disconnected. Untill Pre-Closure process"
  //   },
  //   {"sender": "Person", "message": "Okay Sure. I will follow your guidance"},
  //   {
  //     "sender": "Banker",
  //     "message":
  //         "For Pre-Closure you need to pay the full amount to the Bank's main account\nHere is the account number\n765654543434"
  //   },
  //   {
  //     "sender": "Banker",
  //     "message":
  //         "Click here to pay full amount of 6 lakhs, So that you will get 3 EMIs amount as a refund"
  //   },
  //   {
  //     "sender": "Banker",
  //     "message": "This refund is applicable only if you pay now."
  //   },
  // ];

  int _currentMessageIndex = 0;
  Timer? time;

  @override
  void initState() {
    super.initState();
    // _speakAndDisplayNextMessage();
    _audioPlayer = AudioPlayer();
    _playAudio();
    _displayMessages();

    time = Timer.periodic(Duration(seconds: 1), (timer) {
      _scrollToBottom();
      setState(() {});
    });

    Future.delayed(Duration(seconds: 82), () {
      // _flutterTts.stop();
      // _scrollController.dispose();
      // _messageController.dispose();
      // _stopAudio();
      // _audioPlayer.dispose();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaymentScreensss()),
      );
    });
  }

  // void _speakAndDisplayNextMessage() async {
  //   if (_currentMessageIndex < messages.length) {
  //     String message = messages[_currentMessageIndex]['message']!;

  //     // Display the current message
  //     setState(() {
  //       _currentMessageIndex++;
  //     });
  //     _scrollToBottom();

  //     // Delay to ensure message is fully displayed before speaking
  //     await Future.delayed(Duration(milliseconds: 500));

  //     // Speak the message and wait until it's finished
  //     await _flutterTts.speak(message);
  //     await _flutterTts.awaitSpeakCompletion(true);

  //     // Display the next message after the current one is read completely
  //     _speakAndDisplayNextMessage();
  //   } else {
  //     // Navigate to the final screen after all messages are completed
  // Navigator.pushReplacement(
  //   context,
  //   MaterialPageRoute(builder: (context) => PaymentScreensss()),
  // );
  //   }
  // }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _scrollController.dispose();
    _messageController.dispose();
    _stopAudio();
    _audioPlayer.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _messages = [
    {
      "text": "Good morning, sir.",
      "isSender": false,
      "time": "09:00 AM",
      "delay": 0
    },
    {
      "text": "Good morning. Is it a DB customer care?",
      "isSender": true,
      "time": "09:01 AM",
      "delay": 2
    },
    {
      "text": "Yes, I'm Navia. And how may I help you, sir?",
      "isSender": false,
      "time": "09:02 AM",
      "delay": 3
    },
    {
      "text":
          "Ma'am, I would like to clear my loan. What will be the next step for closing the loan?",
      "isSender": true,
      "time": "09:03 AM",
      "delay": 5
    },
    {
      "text":
          "Definitely. Could you please share your loan account number, sir?",
      "isSender": false,
      "time": "09:04 AM",
      "delay": 5
    },
    {
      "text": "Ma'am, just a moment. My account number is 18254367891.",
      "isSender": true,
      "time": "09:05 AM",
      "delay": 4
    },
    {
      "text":
          "Thank you, sir. Could you also please confirm your name, date of birth, and address?",
      "isSender": false,
      "time": "09:06 AM",
      "delay": 11
    },
    {
      "text":
          "Ma'am, my name is Venkatesh Rao. Date of birth is 28-05-76, Sathyanarayanapuram, Vijayawada.",
      "isSender": true,
      "time": "09:07 AM",
      "delay": 7
    },
    {
      "text":
          "Thank you for confirming the details, sir. Your overall due amount as on date is rupees 3,86,428. Are you sure you would like to clear your loan?",
      "isSender": false,
      "time": "09:08 AM",
      "delay": 12
    },
    {"text": "Yes, ma'am.", "isSender": true, "time": "09:09 AM", "delay": 13},
    {
      "text": "I'll share a link where your payment can be made, sir.",
      "isSender": false,
      "time": "09:10 AM",
      "delay": 2
    },
    {
      "text":
          "Ma'am, I received the link and I'm transferring the amount right now.",
      "isSender": true,
      "time": "09:11 AM",
      "delay": 3
    },
    {
      "text": "Sure, sir. Could you please share the screenshot?",
      "isSender": false,
      "time": "09:12 AM",
      "delay": 5
    },
    {
      "text": "Ma'am, I paid the amount and sending the screenshot.",
      "isSender": true,
      "time": "09:13 AM",
      "delay": 4
    },
    {
      "text":
          "Thank you, sir. We received your screenshot and the loan amount will be updated within 2 to 3 working days. You'll receive a confirmation message from our end. Thank you, sir. Have a good day.",
      "isSender": false,
      "time": "09:14 AM",
      "delay": 6
    },
  ];

  List<Map<String, dynamic>> _visibleMessages = [];

  Future<void> _displayMessages() async {
    for (int i = 0; i < _messages.length; i++) {
      await Future.delayed(
          Duration(seconds: _messages[i]['delay'])); // Use the custom delay
      setState(() {
        _visibleMessages.add(_messages[i]);
      });
    }
  }

  late AudioPlayer _audioPlayer;

  Future<void> _playAudio() async {
    await _audioPlayer.play(AssetSource('audio/customercare.mp3'), volume: 1.0);
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Banker Chat',
          style: TextStyle(color: white),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _visibleMessages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  text: _visibleMessages[index]['text'],
                  isSender: _visibleMessages[index]['isSender'],
                  time: _visibleMessages[index]['time'],
                );
              },
            ),
          ),
          // child: Container(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         ChatBubble(
          //           text: "Good morning, sir.",
          //           isSender: false,
          //           time: "09:00 AM",
          //         ),
          //         ChatBubble(
          //           text: "Good morning. Is it a DB customer care?",
          //           isSender: true,
          //           time: "09:01 AM",
          //         ),
          //         ChatBubble(
          //           text: "Yes, I'm Navia. And how may I help you, sir?",
          //           isSender: false,
          //           time: "09:02 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Ma'am, I would like to clear my loan. What will be the next step for closing the loan?",
          //           isSender: true,
          //           time: "09:03 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Definitely. Could you please share your loan account number, sir?",
          //           isSender: false,
          //           time: "09:04 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Ma'am, just a moment. My account number is 18254367891.",
          //           isSender: true,
          //           time: "09:05 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Thank you, sir. Could you also please confirm your name, date of birth, and address?",
          //           isSender: false,
          //           time: "09:06 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Ma'am, my name is Venkatesh Rao. Date of birth is 28-05-76, Sathyanarayanapuram, Vijayawada.",
          //           isSender: true,
          //           time: "09:07 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Thank you for confirming the details, sir. Your overall due amount as on date is rupees 3,86,428. Are you sure you would like to clear your loan?",
          //           isSender: false,
          //           time: "09:08 AM",
          //         ),
          //         ChatBubble(
          //           text: "Yes, ma'am.",
          //           isSender: true,
          //           time: "09:09 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "I'll share a link where your payment can be made, sir.",
          //           isSender: false,
          //           time: "09:10 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Ma'am, I received the link and I'm transferring the amount right now.",
          //           isSender: true,
          //           time: "09:11 AM",
          //         ),
          //         ChatBubble(
          //           text: "Sure, sir. Could you please share the screenshot?",
          //           isSender: false,
          //           time: "09:12 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Ma'am, I paid the amount and sending the screenshot.",
          //           isSender: true,
          //           time: "09:13 AM",
          //         ),
          //         ChatBubble(
          //           text:
          //               "Thank you, sir. We received your screenshot and the loan amount will be updated within 2 to 3 working days. You'll receive a confirmation message from our end. Thank you, sir. Have a good day.",
          //           isSender: false,
          //           time: "09:14 AM",
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt, color: Colors.blueGrey[700]),
            onPressed: () {
              // Handle camera action
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.blueGrey[700]),
            onPressed: () {
              // Handle attach action
            },
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration.collapsed(
                hintText: "Enter message...",
              ),
              onSubmitted: (value) {
                // Handle message send action
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blueGrey[700]),
            onPressed: () {
              // Handle send action
            },
          ),
        ],
      ),
    );
  }
}

class FinalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Important Notice',
          style: TextStyle(color: white),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Do not trust all the customer care numbers you find on Google.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalScreennnsss(),
                    ),
                  );
                  // Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey[900],
                ),
              ),
              // SizedBox(height: 20),
              // Text(
              //   'This transaction will reflect in your bank account in 2 working days and will mail you the clouser certificate. ',
              //   style: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.redAccent,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class FinalScreennnsss extends StatelessWidget {
  const FinalScreennnsss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'After 3 days this customer care number will not be reachable.\nThen the citizen will approach banks branch and will come to know that he was cheated by fake toll-free number which is obtained through Google Search.\nDo not trust all the data you find through Google Search',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FraudTypesGrid()),
                      (route) => false);
                },
                child: Text("Close"))
          ],
        ),
      ),
    );
  }
}

class PaymentScreensss extends StatefulWidget {
  @override
  State<PaymentScreensss> createState() => _PaymentScreensssState();
}

class _PaymentScreensssState extends State<PaymentScreensss> {
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FinalScreen()),
    );
    // showAlertDialog(context, "Payment Failed",
    //     "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FinalScreen()),
    );
    // showAlertDialog(
    //     context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FinalScreen()),
    );
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loan Pre-Closure Process',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Stepper(
              steps: [
                Step(
                  title: Text('Step 1: Payamount'),
                  content: Text(
                      'To process your paying back your loan, you need to pay 6 lakhs INR.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Step 2: Confirmation'),
                  content: Text(
                      'Once payment is done you will have to wait till the banks confirmation'),
                  isActive: false,
                ),
                Step(
                  title: Text('Step 3: Success'),
                  content: Text('Loan will be Pre-Closure'),
                  isActive: false,
                ),
              ],
              currentStep: 0,
              onStepTapped: (step) {},
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Container();
              },
            ),
            SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  // Image.network(
                  //   'https://imgs.search.brave.com/wclxQzjj95qIWho2aQsO7g2QHtDHbsKfERKxbav-2JY/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTgz/NTM5NTY4L3Bob3Rv/L3BvdW5kLWdpZnQu/d2VicD9iPTEmcz0x/NzA2NjdhJnc9MCZr/PTIwJmM9UWxkRER5/MlNVMjJjbF9zbHBn/b011VmVHaWVCUHV4/ZmNHMEdMRmZZN1N4/MD0',
                  //   height: 200,
                  // ),
                  // SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Razorpay razorpay = Razorpay();
                      var options = {
                        'key': 'rzp_test_1DP5mmOlF5G5ag',
                        'amount': 386428 * 100,
                        'name': 'Acme Corp.',
                        'description': 'Fine T-Shirt',
                        'retry': {'enabled': true, 'max_count': 1},
                        'send_sms_hash': true,
                        'prefill': {
                          'contact': '8888888888',
                          'email': 'test@razorpay.com'
                        },
                        'external': {
                          'wallets': ['paytm']
                        }
                      };
                      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                          handlePaymentErrorResponse);
                      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                          handlePaymentSuccessResponse);
                      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                          handleExternalWalletSelected);
                      razorpay.open(options);
                    },
                    child: Text('Pay 3,86,428'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openRazorpay() {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag', // Replace with your Razorpay API key
      'amount': 600000 * 100, // Amount is in paise
      'name': 'Sara Plus',
      'description': 'Investment for withdrawal',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    };
    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;

  ChatBubble({required this.text, required this.isSender, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSender ? Colors.blueAccent : Colors.grey[300],
          borderRadius: isSender
              ? BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                color: isSender ? Colors.white70 : Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//