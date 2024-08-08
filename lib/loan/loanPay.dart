import 'package:flutter/material.dart';
import 'package:fraudulent/loan/chat.dart';
import 'package:google_fonts/google_fonts.dart';

class PayBack extends StatefulWidget {
  const PayBack({super.key});

  @override
  State<PayBack> createState() => _PayBackState();
}

class _PayBackState extends State<PayBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Even after full repayment, they continue to harass us with repeated demands for money. These demands are accompanied by threats and blackmail, often involving manipulated images (photomorphing).",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Example of photo morphing",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15),
          Image.network("https://i.ytimg.com/vi/-_5tWvyn56I/sddefault.jpg"),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Your pic is extracted form your Aadhar and Pancard which you submitted at the time of taking the loan",
              style: GoogleFonts.poppins(
                  fontSize: 16, color: Colors.red, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CHatDryy()));
              },
              child: Text("Next process"))
        ],
      ),
    ));
  }
}
//