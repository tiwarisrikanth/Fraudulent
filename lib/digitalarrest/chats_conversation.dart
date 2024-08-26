import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fraudulent/warning.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _conversation = [
    {
      'హలో ఎవరండి':
          'This is from Fedex Courier Service, Mumbai. We received a parcel on your name and your aadhar number is 6683 2435 8977 is it correct.'
    },
    {
      'అవును ఆధార్ నంబర్ నాదే':
          'We noticed Drugs, Credit Cards, Foreign Currency, and Weapons, and as per our norms and the instructions of Cyber Crime DCP, we are reporting the matter to Cyber Crime Police, Mumbai. They will contact you in this matter.'
    },
    {
      'సార్ ఏమి మాట్లాడుతున్నారు సార్,సార్\nహలో నాకేం తెలియదు ఆ పార్సెల్ నాది కాదు':
          ''
    },
    {
      'హలో ఎవరండి':
          'में मुंबई साइबर क्राइम पुलिस थाना से बातकरा हुं ,आपके ऊपर एक ड्रग्स केस बना हुआ है, पूछताछ करने के लिए आपको मुंबई आना पड़ेगा'
    },
    {'మీరేమి మాట్లాడుతున్నారో అర్ధం కావడం లేదు': 'क्या बाशा जानती नई'},
    {'అర్ధం కావడం లేదు సార్': 'Are you comfortable in English or Telugu?'},
    {'తెలుగు తెలుగు సార్': 'हमारा आदमी बातकरेगा '},
    {
      'Okay Sir':
          'Hello మంజుల న మాట్లాడేది,నేను సైబర్ క్రైమ్ DCP మాట్లాడుతున్నాను'
    },
    {
      'సార్ నా పేరు మంజుల నే సార్ నమస్కారం సార్':
          'మీ పైన ముంబై పోలీస్ స్టేషన్ లో కేసు రిజిస్టర్ అయినది. మీకు వాట్సాప్ లో కేసుకు సంభందించిన FIR, అలాగే అరెస్ట్ వారెంట్ పంపిచాను. ఒకసారి చూసుకోండి.'
    },
    {
      'సార్ మీరు ఏమి మాట్లాడుతున్నారు సార్,అసలు ఆ కేసుకి నాకు ఏ సంబంధమూ లేదు,నేను ఏమి చెయ్యలేదు సార్':
          'అలా కాదమ్మా,నuvvu ఏమి మాట్లాడాలనుకున్న ముంబై పోలీస్ స్టేషన్ కి వచ్చి matlaadu.'
    },
    {
      'సార్ నిజంగా నేను ఏమి చెయ్యలేదు సార్,ఇంకో దారి ఏమన్నా ఉంటే చొప్పండి సార్ ప్లీజ్ సార్':
          'సరేనమ్మా నuvvu నిజంగా ఏమి చెయ్యలేదు అంటున్నావు కానీ నuvvu నీ అకౌంట్స్ ద్వారా డబ్బులు ట్రాన్సాక్షన్ జరిగినట్లు వుంది \nనీ బ్యాంక్ డీటైల్స్ చెప్పు'
    },
    {
      'సార్ ok సార్,నా పేరు మీద ఐసిఐసిఐ బ్యాంక్, బందరు రోడ్డు విజయవాడ లో ఒక అకౌంట్ వుంది సార్ అందులో 15,00,000/- లక్షలు వున్నాయి సార్. స్టేట్ బ్యాంక్ ఆఫ్ ఇండియా SR పేట బ్రాంచి విజయవాడ లో ఒక అకౌంట్ వుంది సార్,అందులో 26,00,000/- లక్షలు వున్నాయి సార్.\nసార్ ప్లీజ్ సార్ ఈ కేసుకు నాకు ఏ సంబంధము లేదు సార్. మీరే విచారించండి సార్.':
          'సరేనమ్మా మీరు ఏమి కంగారు పడకు,మీ ఖాతాలో వున్న డబ్బు మొత్తం ఆకౌంట్ నంబరు 33487635008 IFSC code SBIN0087 కి RTGS చేయండి, మేము RBI ద్వారా విచారణ జరిపించి సరిగా ఉంటే మీకు వాపసు ఇచ్చి కేసు తీసేస్తాము. డబ్బు పంపే వరకు కాల్ కట్ చేయవద్దు.టైం లేదు త్వరగా బ్యాంకు కి వెళ్ళు లేట్ చెయ్యకు.'
    },
    {
      'అలాగే సార్.\nసార్ నేను బ్యాంకుకు వచ్చాను సార్,అలాగే డబ్బు RTGS కూడా చేశాను.\nసార్ మీరే ఎలాగైనా న్యాయం చెయ్యాలి సార్ నాకు':
          '...'
    },
  ];

  final List<int> _messageDelays = [
    1,
    5,
    2,
    10,
    10,
    6,
    3,
    12,
    3,
    3,
    5,
    3,
    3,
    2,
    3,
    8,
    3,
    5,
    7,
    7,
    3,
    7,
    6,
    10,
    7,
    5
  ];

  late List<String> _displayedMessages;
  late int _currentIndex;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _displayedMessages = [];
    _currentIndex = 0;
    _audioPlayer = AudioPlayer();
    _startChatSequence();

    _audioPlayer.onPlayerComplete.listen((_) {
      _navigateToWarningScreen();
    });
  }

  void _startChatSequence() async {
    _playAudio();

    for (int i = 0; i < _messageDelays.length; i++) {
      await Future.delayed(Duration(seconds: _messageDelays[i]));
      setState(() {
        _displayedMessages.add(_getNextMessage(i));
      });
      _scrollToBottom();
    }

// Navigate to the warning screen only after all messages are displayed
// _navigateToWarningScreen();
  }

  String _getNextMessage(int index) {
    final messageIndex = index ~/ 2;
    final isVictimMessage = index.isEven;

    if (messageIndex < _conversation.length) {
      final conversationPair = _conversation[messageIndex];
      return isVictimMessage
          ? conversationPair.keys.first
          : conversationPair.values.first;
    }

    return ''; // Return an empty string if index is out of bounds
  }

  void _playAudio() async {
    await _audioPlayer.play(AssetSource('audio/arrestz.mp3'));
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _navigateToWarningScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScamWarningScreen()),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF25D366),
        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://pbs.twimg.com/profile_images/1742941097528115201/crQJwctw_200x200.png'),
                ),
              ),
            ),
            SizedBox(width: 10),
            const Text(
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
              return _buildMessage(
                _displayedMessages[index],
                index,
                isLeft: index.isEven,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, int index, {required bool isLeft}) {
    bool isSpecificMessage = text.contains(
        'మీ పైన ముంబై పోలీస్ స్టేషన్ లో కేసు రిజిస్టర్ అయినది. మీకు వాట్సాప్ లో కేసుకు సంభందించిన FIR, అలాగే అరెస్ట్ వారెంట్ పంపిచాను.');

    return Container(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Card(
              elevation: 2,
              color: !isLeft || text.isEmpty
                  ? Colors.grey[300]
                  : Color(0xFF25D366),
              margin: EdgeInsets.symmetric(vertical: 4.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: isLeft ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            if (isSpecificMessage) ...[
              SizedBox(height: 8),
              _buildImage("assets/images/warrant.jpeg"),
              SizedBox(height: 8),
              _buildImage("assets/images/war.jpeg"),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String url) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      },
      child: Image.asset(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
