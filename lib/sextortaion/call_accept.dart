import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fraudulent/home.dart';
import 'package:fraudulent/sextortaion/call_media_chat.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:video_player/video_player.dart';

class CAllingScreen extends StatefulWidget {
  const CAllingScreen({super.key});

  @override
  State<CAllingScreen> createState() => _CAllingScreenState();
}

class _CAllingScreenState extends State<CAllingScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  late Timer _screenshotTimer;
  late Timer _closeTimer;
  Timer? dfa;
  final ScreenshotController _screenshotController = ScreenshotController();
  final List<String> _screenshots = [];
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    dfa = Timer.periodic(Duration(seconds: 1), (val) {
      setState(() {});
    });
    _initializeCamera();
    _startScreenshotTimer();
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

  void _startScreenshotTimer() {
    _screenshotTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      _takeScreenshot();
    });

    _closeTimer = Timer(Duration(seconds: 15), () {
      _screenshotTimer.cancel();
      _disposeControllers();
    });
  }

  Future<void> _takeScreenshot() async {
    final directory = await getTemporaryDirectory();
    final filePath =
        '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';

    try {
      final image = await _screenshotController.capture();
      if (image != null) {
        final file = File(filePath);
        file.writeAsBytesSync(image);
        setState(() {
          _screenshots.add(filePath);
        });
      }
    } catch (e) {
      print('Error taking screenshot: $e');
    }
  }

  void _disposeControllers() async {
    // Dispose the camera controller and ensure the state is updated
    await _cameraController.dispose();
    setState(() {
      _isDisposed = true;
    });
    _navigateToGallery();
  }

  void _navigateToGallery() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenshotGallery(screenshots: _screenshots),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _screenshotTimer.cancel();
    _closeTimer.cancel();

    dfa?.cancel();
    super.dispose();
  }

  returnss() {
    Navigator.pushAndRemoveUntil(
        context, FadePageRoute(page: FraudTypesGrid()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnss();
      },
      child: Scaffold(
        body: Screenshot(
          controller: _screenshotController,
          child: Stack(
            children: [
              AudioCs(),
              VideoPlayerScreen(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 10),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic_off,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.cameraswitch_rounded,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.screenshot_sharp,
                              color: Colors.white,
                            )),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.red),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.call_end,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (!_isDisposed)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 80, right: 10),
                    height: 220,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CameraPreview(_cameraController)),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class AudioCs extends StatefulWidget {
  const AudioCs({super.key});

  @override
  State<AudioCs> createState() => _AudioCsState();
}

class _AudioCsState extends State<AudioCs> {
  late AudioPlayer _audioPlayer1;
  late AudioPlayer _audioPlayer2;

  @override
  void initState() {
    super.initState();
    _audioPlayer1 = AudioPlayer();
    _audioPlayer2 = AudioPlayer();

    Future.delayed(Duration(seconds: 7), () {
      playLocalAudio1();
    });
    // Future.delayed(Duration(seconds: 7), () {
    //   playLocalAudio2();
    // });
  }

  Future<void> playLocalAudio1() async {
    try {
      await _audioPlayer1.play(AssetSource('audio/voice.mp3'),
          mode: PlayerMode.mediaPlayer);
    } catch (e) {
      print('Error playing audio 1: $e');
    }
  }

  Future<void> playLocalAudio2() async {
    try {
      await _audioPlayer2.play(AssetSource('audio/voice_2.mp3'),
          mode: PlayerMode.mediaPlayer);
    } catch (e) {
      print('Error playing audio 2: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer1.dispose();
    _audioPlayer2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Initialize the VideoPlayerController with the video asset
    _controller = VideoPlayerController.asset('assets/videos/vid.mp4');
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Start the video automatically
      _controller.play();
      // Stop the video after 30 seconds
      _timer = Timer(Duration(seconds: 50), () {
        _controller.pause();
      });
    });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
