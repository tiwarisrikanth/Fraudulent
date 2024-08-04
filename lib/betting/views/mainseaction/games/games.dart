import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraudulent/betting//global/colors.dart';
import 'package:fraudulent/betting//global/widgets.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class Games extends StatelessWidget {
  List games = [
    "Single Digits",
    "Single Digits Bulk",
    "Jodi Digits",
    "Jodi Digits Bulk",
    "Single Pana",
    "Single Pana Bulk",
    "Double Pana",
    "Double Pana Bulk",
    "Triple Pana",
    "Panel Group",
    "Red Brackets",
    "SB DP TP",
    "Check Pana SPDP",
    "SP Motor",
    "Group Jodi",
    "SB DP TP",
    "Check Pana SPDP",
  ];

  // List of icons corresponding to each game
  List<IconData> gameIcons = [
    Icons.looks_one,
    Icons.format_list_numbered,
    Icons.link,
    Icons.layers,
    Icons.filter_1,
    Icons.filter_2,
    Icons.filter_3,
    Icons.layers_clear,
    Icons.threesixty,
    Icons.group_work,
    Icons.border_all,
    Icons.format_shapes,
    Icons.check_circle,
    Icons.motorcycle,
    Icons.group,
    Icons.layers_clear,
    Icons.check_circle,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(title: "Radha Day"),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items in a row
                  crossAxisSpacing: 3.0, // Spacing between items horizontally
                  mainAxisSpacing: 3.0, // Spacing between items vertically
                ),
                itemCount: games.length, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  final item = games[index];
                  final icon = gameIcons[index];
                  return InkWell(
                    onTap: () {
                      toScreen(context: context, page: EnterGame());
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: lev_three,
                        border: Border.all(
                          color: white,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            round(
                              widget: Center(
                                child: Icon(
                                  icon,
                                  size: 50,
                                  color: lev_one,
                                ),
                              ),
                              radius: 100,
                              color: white,
                              h: 120,
                              w: 120,
                            ),
                            h(h: 10),
                            mdm(text: item, size: 12),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EnterGame extends StatefulWidget {
  @override
  _EnterGameState createState() => _EnterGameState();
}

class _EnterGameState extends State<EnterGame> {
  List<String> gameTypes = ['Single', 'Double'];
  String selectedGameType = 'Single';
  TextEditingController pointsController = TextEditingController();
  TextEditingController digitController = TextEditingController();
  List<String> itemList = [];
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay!.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    finldailg(context);
    // _showAlertDialog('Stay away from such fake frauds');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _showAlertDialog('Payment failed. Please try again.');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    _showAlertDialog('External wallet selected');
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: <Widget>[
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
  void finldailg(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(
                'https://upload.wikimedia.org/wikipedia/en/e/ea/Appolice%28emblem%29.png',
                height: 100.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'This is a simulation meant to show you how frauds are done. Stay away from these.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          actions: <Widget>[
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
  void _showPrizeAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text(
              'You have won a lucky draw worth 150000. Click below to withdraw.'),
          actions: <Widget>[
            TextButton(
              child: Text('Withdraw'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaymentScreen(openRazorpay: _openRazorpay)),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _openRazorpay() {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag', // Replace with your Razorpay API key
      'amount': 2000 * 100, // Amount is in paise
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

  void _addItem() {
    if (pointsController.text.isEmpty || digitController.text.isEmpty) {
      _showAlertDialog('Please enter valid values.');
      return;
    }

    setState(() {
      String newItem =
          '$selectedGameType - Points: ${pointsController.text}, Digit: ${digitController.text}';
      itemList.add(newItem);
      pointsController.clear();
      digitController.clear();
    });

    _showPrizeAlert();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Single Digit Board")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField(
              value: selectedGameType,
              items: gameTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGameType = value.toString();
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Game Type',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: pointsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Points',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: digitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Single Digit',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(itemList[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            itemList.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  final VoidCallback openRazorpay;

  PaymentScreen({required this.openRazorpay});

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
              'Withdrawal Process',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Stepper(
              steps: [
                Step(
                  title: Text('Step 1: Investment'),
                  content: Text(
                      'To process your withdrawal, you need to invest 2000 INR.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Step 2: Receive Code'),
                  content: Text(
                      'After your investment, you will receive a unique code.'),
                  isActive: false,
                ),
                Step(
                  title: Text('Step 3: Withdrawal'),
                  content: Text(
                      'Use the code to complete the withdrawal process.'),
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
                  Image.network(
                    'https://imgs.search.brave.com/wclxQzjj95qIWho2aQsO7g2QHtDHbsKfERKxbav-2JY/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTgz/NTM5NTY4L3Bob3Rv/L3BvdW5kLWdpZnQu/d2VicD9iPTEmcz0x/NzA2NjdhJnc9MCZr/PTIwJmM9UWxkRER5/MlNVMjJjbF9zbHBn/b011VmVHaWVCUHV4/ZmNHMEdMRmZZN1N4/MD0',
                    height: 200,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: openRazorpay,
                    child: Text('Pay 2000'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
