import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fraudulent/honeytraps/call_accept.dart';
import 'package:fraudulent/sextortaion/call_accept.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';
import 'package:fraudulent/warning.dart';

class IncomingCallScreenH extends StatefulWidget {
  @override
  State<IncomingCallScreenH> createState() => _IncomingCallScreenHState();
}

class _IncomingCallScreenHState extends State<IncomingCallScreenH> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  late AudioPlayer _audioPlayer;
  Future<void> _playAudio() async {
    await _audioPlayer.play(AssetSource('audio/ring.mp3'), volume: 1.0);
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _audioPlayer = AudioPlayer();
    _playAudio();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.veryHigh,
    );

    _initializeControllerFuture = _cameraController.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  CameraPreview(_cameraController),
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
                                  'Incoming Video Call',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
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
                                              'https://firebasestorage.googleapis.com/v0/b/blogged-out.appspot.com/o/anime-girl-window_777271-50156.jpg?alt=media&token=ad1f5fa2-dd32-4483-b5f2-c79355c77573'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                // xtarget
                                Text(
                                  'Aurora',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
                                  _stopAudio();
                                  // Handle reject call
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(width: 80),
                              CallButton(
                                icon: Icons.videocam,
                                color: Colors.green,
                                onPressed: () {
                                  _stopAudio();
                                  // Handle accept call
                                  Navigator.push(context,
                                      FadePageRoute(page: CallingScreenH()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
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
                  color: Colors.white
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
