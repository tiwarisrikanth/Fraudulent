import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fraudulent/home.dart';
import 'package:screen_recorder/screen_recorder.dart'; // Import the screen_recorder package
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class CallingScreenH extends StatefulWidget {
  const CallingScreenH({super.key});

  @override
  State<CallingScreenH> createState() => _CallingScreenHState();
}

class _CallingScreenHState extends State<CallingScreenH> {
  late ScreenRecorderController _screenRecorder = ScreenRecorderController();
  Timer? _closeTimer;
  Timer? _startRecordingTimer;
  bool _isRecording = false;
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _screenRecorder = ScreenRecorderController();
    _initializeCamera();
    _startRecordingTimer = Timer(Duration(seconds: 1), _startRecording);
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

  Future<void> _startRecording() async {
    if (_isRecording) return;

    try {
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/recording.mp4';

      _screenRecorder.start(
          // fileName: filePath,
          // audioEnable: true, // Enable audio recording
          // width: MediaQuery.of(context).size.width.toInt(),
          // height: MediaQuery.of(context).size.height.toInt(),
          );

      setState(() {
        _isRecording = true;
      });

      _closeTimer = Timer(Duration(seconds: 15), _stopRecording);
    } catch (e) {
      print('Error starting screen recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;

    try {
      final result = _screenRecorder.stop();
      setState(() {
        _isRecording = false;
      });

      // _navigateToNextPage(_screenRecorder.);
    } catch (e) {
      print('Error stopping screen recording: $e');
    }
  }

  void _navigateToNextPage(String filePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordingPlaybackScreen(videoPath: filePath),
      ),
    );
  }

  @override
  void dispose() {
    _closeTimer?.cancel();
    _startRecordingTimer?.cancel();
    _cameraController.dispose();
    super.dispose();
  }

  Future<bool> returnss() async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => FraudTypesGrid()),
        (route) => false);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: returnss,
      child: Scaffold(
        body: Stack(
          children: [
            // Add your other widgets here, e.g., AudioCs(), VideoPlayerScreen()
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.videocam, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic_off, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.cameraswitch_rounded,
                            color: Colors.white),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.red,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.call_end, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_cameraController);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecordingPlaybackScreen extends StatefulWidget {
  final String videoPath;

  const RecordingPlaybackScreen({required this.videoPath, Key? key})
      : super(key: key);

  @override
  _RecordingPlaybackScreenState createState() =>
      _RecordingPlaybackScreenState();
}

class _RecordingPlaybackScreenState extends State<RecordingPlaybackScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recording Playback")),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
