import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fraudulent/warning.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final FlutterTts _flutterTts = FlutterTts();
  final List<String> _messages = [
    'Incoming call',
    'Accepted call',
    'We have got a courier on your name and it contains Drugs. Come to FedEx MUMBAI for official paperwork.',
    'I do not have any order coming or any expected order from anywhere.\nCall hung up',
    'Incoming call with different number',
    'Accepted call',
    'If you do not come to the office, we will put your name on a Money laundering or Drugs Supply case.',
    'But I did not do anything.',
    'We do not know anything. If you do not proceed with us, we will file a case against you.',
    'What can I do to avoid the cases or charges against me?',
    'There is another way to drop all the charges against you.',
    'What?',
    'You can pay the challan amount on the number or bank account below, and all the charges will be dropped.',
    'Ok sir. I will please drop all the charges.',
    'Ok, first transfer that amount...',
    'This whole conversation is a scam. The complaints and the person pretending to be office are not real. Please be aware of this issue and scams.',
    'We also know that you watch Adult sites...',
    'Umm... No, I do not...',
    'We know this because we keep track using IP address.',
    'Sir, please do not file a complaint. Please tell me what I need to do to drop all the charges.',
    'Send 25,000/- rupees ASAP within 1 hour on the below given bank details or UPI ID.',
    'Ok sir, I will send the money. Please drop all the charges.',
    'Ok, first transfer that amount...',
    'This whole conversation is a scam. The complaints and the person pretending to be office are not real. Please be aware of this issue and scams.',
  ];

  late List<String> _displayedMessages;
  late List<bool> _messageVisibility;
  late int _currentIndex;
  final Duration _messageDelay = Duration(seconds: 1);
  final Duration _endDelay =
      Duration(seconds: 5); // Delay after the last message
  late Completer<void> _speakCompleter;

  @override
  void initState() {
    super.initState();
    _displayedMessages = [];
    _messageVisibility = [];
    _currentIndex = -1;
    _flutterTts.setSpeechRate(0.5);
    _flutterTts.setCompletionHandler(() {
      _onSpeechComplete();
    });
    _startChatSequence();
  }

  void _startChatSequence() async {
    for (int i = 0; i < _messages.length; i++) {
      _scrollToBottom();
      await Future.delayed(_messageDelay);
      setState(() {
        _displayedMessages.add(_messages[i]);
        _messageVisibility.add(true);
        _currentIndex = i;
      });
      await _speakMessage(_messages[i], i.isEven);
    }
  }

  Future<void> _speakMessage(String message, bool isLeft) async {
    print(isLeft);

    _speakCompleter = Completer<void>();

    // Set the voice based on whether the message is left or right
    print(isLeft);
    if (isLeft) {
      await _flutterTts
          .setVoice({"name": 'en-us-x-iol-local', "locale": "en-US"});
    } else {
      await _flutterTts
          .setVoice({"name": 'en-us-x-sfg-local', "locale": "en-US"});
    }

    await _flutterTts.speak(message);
    return _speakCompleter.future;
  }

  void _onSpeechComplete() async {
    if (!_speakCompleter.isCompleted) {
      _speakCompleter.complete();
    }

    if (_currentIndex == _messages.length - 1) {
      // Last message spoken
      await Future.delayed(_endDelay); // Wait for 5 seconds
      _navigateToWarningScreen(); // Navigate to the warning screen
    } else {
      if (_currentIndex < _messages.length - 1) {
        setState(() {
          _currentIndex++;
        });
      }
    }
  }

  void _navigateToWarningScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScamWarningScreen()),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF25D366),
          title: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1742941097528115201/crQJwctw_200x200.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'FedEx MUMBAI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/d.png',
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            ListView.builder(
              controller: _scrollController,
              itemCount: _displayedMessages.length,
              itemBuilder: (context, index) {
                return AnimatedOpacity(
                  opacity: _messageVisibility[index] ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: _buildMessage(
                    _displayedMessages[index],
                    index,
                    isLeft: index.isEven,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(String text, int indexss, {required bool isLeft}) {
    return Container(
      alignment: indexss == 17 || indexss == 25
          ? Alignment.center
          : isLeft
              ? Alignment.centerLeft
              : Alignment.centerRight,
      padding: EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: indexss == 17 || indexss == 25
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.7),
        child: Card(
          elevation: 2,
          color: indexss == 17 || indexss == 25
              ? Colors.black
              : isLeft
                  ? Color(0xFF25D366)
                  : Colors.grey[300],
          margin: EdgeInsets.symmetric(vertical: 4.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              text,
              style: TextStyle(
                  color: indexss == 17 || indexss == 25
                      ? Colors.white
                      : isLeft
                          ? Colors.white
                          : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
