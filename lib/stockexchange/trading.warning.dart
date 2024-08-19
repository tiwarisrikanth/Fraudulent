import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fraudulent/stockexchange/stock_main.dart';
import 'package:fraudulent/warning.dart';

class TradingWarningScreen extends StatefulWidget {
  @override
  _TradingWarningScreenState createState() => _TradingWarningScreenState();
}

class _TradingWarningScreenState extends State<TradingWarningScreen> {
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _flutterTts.setLanguage("te-TE");

    _speakAndNavigate();

    Future.delayed(Duration(seconds: 90), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StockExHomePage(),
        ),
      );
    }); // Set language to Telugu
  }

  void _speakAndNavigate() async {
    await _flutterTts.speak(
        "మీరు WhatsApp ద్వారా లింక్ పంపబడింది. Telegram లో మీకు APK డౌన్లోడ్ చేయమని అడుగుతారు. ట్రేడింగ్ ప్రారంభించండి మరియు అధిక మొత్తంలో డబ్బు సంపాదించండి. ఈ మోసాలు ఎలా జరిగే విధానం గురించి మీకు సూచించడానికి మేము ఒక సిమ్యులేషన్ ప్రాసెస్ ను తీసుకువస్తున్నాం.");

    // Optionally, you can add a delay here to ensure speech completion
    await Future.delayed(Duration(seconds: 5));

    // // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StockExHomePage()),
    );
  }

  void _speakAnNavigate() async {
    // await _flutterTts.speak(
    //     "మీరు WhatsApp ద్వారా లింక్ పంపబడింది. Telegram లో మీకు APK డౌన్లోడ్ చేయమని అడుగుతారు. ట్రేడింగ్ ప్రారంభించండి మరియు అధిక మొత్తంలో డబ్బు సంపాదించండి. ఈ మోసాలు ఎలా జరిగే విధానం గురించి మీకు సూచించడానికి మేము ఒక సిమ్యులేషన్ ప్రాసెస్ ను తీసుకువస్తున్నాం.");

    // Optionally, you can add a delay here to ensure speech completion

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StockExHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Important Notice'),
          actions: [
            ElevatedButton(
              onPressed: _speakAnNavigate,
              child: Text("Next"),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Important Notice:",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _speakAndNavigate,
                      child: Text("Read Aloud"),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  " Important Notice:\nYou have recently received a link through WhatsApp. When you click on this link, it will direct you to a Telegram chat. In this chat, you will be prompted to download an APK (Android Application Package) file. This file is intended to install an application that promises significant earnings through trading activities.\nHere are some critical details to consider:\nWhatsApp Link: The link you received on WhatsApp is designed to redirect you to another platform. This could be a strategy to get you to install an application outside of official channels.\nRedirection to Telegram: Once you click on the link, you will be taken to a Telegram chat. Telegram is a messaging platform used here to communicate and manage the process of installing the APK.\nAPK Download: You will be asked to download an APK file. APKs are files used to install applications on Android devices. However, downloading APKs from unofficial sources can be risky and may expose your device to potential threats.\nTrading Application: The APK is for a trading application that claims to offer significant financial gains. While such applications may seem appealing, it's important to exercise extreme caution. Many such offers can be scams or fraudulent schemes designed to exploit users.\nRisk Awareness: It is crucial to be aware of the potential risks involved. Installing applications from unknown sources can lead to various issues, including security vulnerabilities, data theft, or loss of personal information. Ensure you are fully informed about the application, its developers, and its legitimacy before proceeding.\nPlease Exercise Caution:\nWe urge you to carefully consider the risks before downloading and installing any APK from sources that are not official or well-known. Always verify the authenticity of such applications and consult with trusted sources or experts if you have any doubts.\n\nStay safe and make informed decisions.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
