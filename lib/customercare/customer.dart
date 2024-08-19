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
                primary: Colors.grey[200],
                onPrimary: Colors.black,
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Handle I'm Feeling Lucky action
              },
              child: Text("I'm Feeling Lucky"),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[200],
                onPrimary: Colors.black,
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

  List<Map<String, String>> messages = [
    {
      "sender": "Person",
      "message": "Hello, Can you please help me with my loan Pre-Closure"
    },
    {"sender": "Banker", "message": "Yeah, Sure we will help you out."},
    {
      "sender": "Banker",
      "message": "For loan Pre-Closure i will guide you a step by step process"
    },
    {
      "sender": "Banker",
      "message":
          "Please make sure the call does not gets disconnected. Untill Pre-Closure process"
    },
    {"sender": "Person", "message": "Okay Sure. I will follow your guidance"},
    {
      "sender": "Banker",
      "message":
          "For Pre-Closure you need to pay the full amount to the Bank's main account\nHere is the account number\n765654543434"
    },
    {
      "sender": "Banker",
      "message":
          "Click here to pay full amount of 6 lakhs, So that you will get 3 EMIs amount as a refund"
    },
    {
      "sender": "Banker",
      "message": "This refund is applicable only if you pay now."
    },
  ];

  int _currentMessageIndex = 0;

  @override
  void initState() {
    super.initState();
    _speakAndDisplayNextMessage();
  }

  void _speakAndDisplayNextMessage() async {
    if (_currentMessageIndex < messages.length) {
      String message = messages[_currentMessageIndex]['message']!;

      // Display the current message
      setState(() {
        _currentMessageIndex++;
      });
      _scrollToBottom();

      // Delay to ensure message is fully displayed before speaking
      await Future.delayed(Duration(milliseconds: 500));

      // Speak the message and wait until it's finished
      await _flutterTts.speak(message);
      await _flutterTts.awaitSpeakCompletion(true);

      // Display the next message after the current one is read completely
      _speakAndDisplayNextMessage();
    } else {
      // Navigate to the final screen after all messages are completed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaymentScreensss()),
      );
    }
  }

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
    super.dispose();
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
              itemCount: _currentMessageIndex,
              itemBuilder: (context, index) {
                bool isPerson = messages[index]['sender'] == 'Person';
                return Align(
                  alignment:
                      isPerson ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color:
                          isPerson ? Colors.lightBlue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      messages[index]['message']!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
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
                  primary: Colors.blueGrey[900],
                  onPrimary: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This transaction will reflect in your bank account in 2 working days and will mail you the clouser certificate. ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
                textAlign: TextAlign.center,
              ),
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
              'After 3 days the customer care number wont be reach able\n\nthen the citizen will approch banks branch and will come to know that he was cheated by the fake tool free number which is obtained though google search.\n\nDo not trust all teh data you find on while Google Search',
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
                        'amount': 1000 * 100,
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
                    child: Text('Pay 600000'),
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


//