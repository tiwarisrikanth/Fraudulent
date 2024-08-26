import 'package:flutter/material.dart';
import 'package:fraudulent/loan/loanPay.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTestScreenb extends StatefulWidget {
  const NewTestScreenb({super.key});

  @override
  State<NewTestScreenb> createState() => _NewTestScreenbState();
}

class _NewTestScreenbState extends State<NewTestScreenb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pay your loan amount 55000/- with interest",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.green.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PayBack()));
                },
                child: Text("Pay Back Loan")),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
