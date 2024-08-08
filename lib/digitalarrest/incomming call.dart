import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fraudulent/digitalarrest/chats_conversation.dart';
import 'package:fraudulent/sextortaion/call_accept.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';

class IncomingCallScreen2 extends StatefulWidget {
  @override
  State<IncomingCallScreen2> createState() => _IncomingCallScreen2State();
}

class _IncomingCallScreen2State extends State<IncomingCallScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/doo.jpg',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Incoming Call',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          WaveAnimation(),
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/en/e/ea/Appolice%28emblem%29.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'CYBER CRIME DCP MUMBAI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Scam Caller named himself as CYBER CRIME DCP MUMBAI',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CallButton(
                      icon: Icons.call_end,
                      color: Colors.red,
                      onPressed: () {
                        // Handle reject call
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 80),
                    CallButton(
                      icon: Icons.call,
                      color: Colors.green,
                      onPressed: () {
                        // Handle accept call
                        Navigator.push(
                          context,
                          FadePageRoute(
                            page: ChatScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class WaveAnimation extends StatefulWidget {
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: List.generate(3, (index) {
            return Container(
              width: 100 + (index * 30),
              height: 100 + (index * 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF25D366)
                      .withOpacity(1 - (_controller.value + index / 3) % 1),
                  width: 2,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class CallButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const CallButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
