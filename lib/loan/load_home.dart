import 'package:flutter/material.dart';
import 'package:fraudulent/loan/congsg.dart';
import 'package:fraudulent/partTime/global/packages.dart';
import 'package:fraudulent/partTime/main.dart';

class LoanSection extends StatefulWidget {
  const LoanSection({super.key});

  @override
  State<LoanSection> createState() => _LoanSectionState();
}

class _LoanSectionState extends State<LoanSection> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Loan Harrassment"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Aadhaar Number',
                  hintText: 'Enter your Aadhaar Number',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PAN Number',
                  hintText: 'Enter your PAN Number',
                ),
                keyboardType: TextInputType.text,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Allow app to access your contacts & call logs',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Bounce(
                  onTap: () async {
                    toScreen(context: context, page: LoanApproved());
                  },
                  child: btn(name: "Submit")),
            ],
          ),
        ));
  }
}
