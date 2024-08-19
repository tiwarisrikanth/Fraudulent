import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/home.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cyber Citizen',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: FraudTypesGrid(),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyber Citizen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserForm(),
    );
  }
}

final TextEditingController _addressController = TextEditingController();
final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkUserDetails();
  }

  Future<void> _checkUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    if (name != null) {
      _navigateToNextPage();
    }
  }

  Future<void> _saveUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('address', _addressController.text);
  }

  void _navigateToNextPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => FraudTypesGrid()),
    );
  }

  Future getLoginnsss() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://ntr-cyber-commando.kritvyap.com/api/v1/user/save-citizen-data'));
    request.body = json.encode({
      "soldierIdNo": _addressController.text,
      "citizenMobileNumber": _phoneController.text,
      "citizenMobileName": _nameController.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      _navigateToNextPage();
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter Your Details',
          style: TextStyle(color: white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      // TextFormField(
                      //   controller: _emailController,
                      //   decoration: const InputDecoration(
                      //     labelText: 'Email',
                      //     border: OutlineInputBorder(),
                      //     prefixIcon: Icon(Icons.email),
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your email';
                      //     } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      //       return 'Please enter a valid email address';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _phoneController,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          counterText: "",
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Please enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                            labelText: 'Reference ID',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.numbers),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _openQRScanner(context);
                                },
                                icon: Icon(Icons.qr_code))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          } else if (value.length < 10) {
                            return 'Address should be at least 10 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _saveUserDetails().then((_) {
                              getLoginnsss();
                              // _navigateToNextPage();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openQRScanner(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Scan the QR Code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: QRView(
                  key: _qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      _addressController.text = scanData.code!;
      Navigator.of(context).pop(); // Close the bottom sheet after scanning
      controller.dispose(); // Dispose the controller to avoid memory leaks
    });
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }
}
