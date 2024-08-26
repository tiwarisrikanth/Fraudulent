import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fraudulent/loan/loanPay.dart';
import 'package:fraudulent/loan/new%20screen.dart';
import 'package:fraudulent/partTime/global/packages.dart';

class LoanApproved extends StatefulWidget {
  const LoanApproved({super.key});

  @override
  State<LoanApproved> createState() => _LoanApprovedState();
}

class _LoanApprovedState extends State<LoanApproved> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EMIInfo()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congratulations...",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Your loan has been approved and the loan amount was transfered to your account...",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class EMIInfo extends StatefulWidget {
  const EMIInfo({super.key});

  @override
  State<EMIInfo> createState() => _EMIInfoState();
}

class _EMIInfoState extends State<EMIInfo> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playAudio();
    Future.delayed(Duration(seconds: 117), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewTestScreenb()));
    });
  }

  @override
  void dispose() {
    _stopAudio();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    await _audioPlayer.play(AssetSource('audio/loan.mp3'), volume: 1.0);
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This is how they use vulguar language to harass and recover their money.",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              height: 335,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.red,
                ),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/images/d.jpg',
                      height: 335,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "मकेलोड पैसे दे मेरे लोन पर लिया ना रे साला",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "12:00 AM",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "चुटिया समझ रा रे सेल पैसे निकल फ़ेले",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "12:00 AM",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "गांडू साले अम्मा बहन पे आजतुउ फिर माई पहले पैसे निकल बोला ना मकेलूदे",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "12:00 AM",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "गांडू साले पैसे दे मेरे",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "12:00 AM",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewTestScreenb()));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
    ;
  }
}
