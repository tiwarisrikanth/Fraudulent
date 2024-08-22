import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/warning.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  final _screenshotController = ScreenshotController();
  @override
  void initState() {
    _saveUserDetails();
    super.initState();
  }

  String? name = "";
  String? reff = "";
  DateTime date = DateTime.now();

  Future<void> _saveUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      reff = prefs.getString('address');
    });
  }

  String getDayOfMonthSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Center(child: Image.asset('assets/images/certi.jpeg')),
                      Center(
                          child: Text(
                        name!,
                        style: TextStyle(color: black, fontSize: 9),
                      )),
                      Center(child: Builder(builder: (context) {
                        // Format as "2024-08-09"
                        String formattedDate1 =
                            DateFormat('yyyy-MM-dd').format(date);
                        print(formattedDate1); // Outputs: 2024-08-09

                        // Format as "09th Aug, 2024"
                        String daySuffix = getDayOfMonthSuffix(date.day);
                        String formattedDate2 =
                            DateFormat('dd MMM, yyyy').format(date);
                        print(formattedDate2); // Outputs: 09th Aug, 2024
                        return Padding(
                          padding: const EdgeInsets.only(top: 56.0, left: 258),
                          child: Text(
                            formattedDate2!,
                            style: TextStyle(color: black, fontSize: 5),
                          ),
                        );
                      })),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 60.0, left: 103),
                            child: Text(
                              reff!,
                              style: TextStyle(color: black, fontSize: 9),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () async {
                  final capturedImage = await _screenshotController.capture(
                    pixelRatio: 3.0, // Adjust pixel ratio as needed
                    delay: Duration(
                        milliseconds: 500), // Adjust delay if necessary
                  );

                  if (capturedImage != null) {
                    // Share the captured image
                    await shareUint8ListImage(capturedImage);
                    // Share.share(
                    //   capturedImage,
                    //   text: 'Check out my certificate!',
                    // );
                  }
                },
                child: const Icon(Icons.share),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> shareUint8ListImage(Uint8List imageData) async {
    // Convert Uint8List to base64
    String base64Image = base64Encode(imageData);

    // Create a temporary file
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp_image.png');
    await tempFile.writeAsBytes(base64Decode(base64Image));

    // Share the file
    await Share.shareFiles([tempFile.path]);
  }
}
