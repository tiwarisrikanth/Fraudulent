import 'package:flutter/material.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/home.dart';

class NextScreenSection extends StatefulWidget {
  const NextScreenSection({super.key});

  @override
  State<NextScreenSection> createState() => _NextScreenSectionState();
}

class _NextScreenSectionState extends State<NextScreenSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Whenever you keep original pics as your profile pics, Sharing personal photos in public\n\nFraudsters creates Fake Social Media IDs with your personal morphed photos",
                style: TextStyle(
                  color: red,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MorphingPhotos(),
                  ),
                );
              },
              child: Text("Next")),
        ],
      ),
    );
  }
}

class MorphingPhotos extends StatelessWidget {
  const MorphingPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Copied original pic and creating\nFake ID with your pic",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HarrisingImg(),
            ),
          );
        },
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/fakeimg.jpeg',
                height: 600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hi, I'm available for dating, If interested call me\n1234567890\nemily.smith@example.com",
              style: TextStyle(),
            )
          ],
        ),
      ),
    );
  }
}

class HarrisingImg extends StatefulWidget {
  const HarrisingImg({super.key});

  @override
  State<HarrisingImg> createState() => _HarrisingImgState();
}

class _HarrisingImgState extends State<HarrisingImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Harassment with your morphed pics",
              style: TextStyle(
                color: red,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/dail.jpeg',
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BNextScree(),
                ),
              );
            },
            child: Text("Next"),
          )
        ],
      ),
    );
  }
}

class BNextScree extends StatelessWidget {
  const BNextScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blackmailing',
          style: TextStyle(color: red),
        ),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewScreenssssssssssfsdg()));
        },
        child: Column(
          children: [
            Expanded(child: Image.asset('assets/images/balck1.jpeg')),
            Text(
              'Threatening & Harassing',
              style: TextStyle(color: red, fontSize: 28),
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/black2.jpeg')
          ],
        ),
      ),
    );
  }
}

class NewScreenssssssssssfsdg extends StatelessWidget {
  const NewScreenssssssssssfsdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 88.0),
              child: Image.asset('assets/images/badi.jpeg'),
            ),
            SizedBox(height: 20),
            Text(
              'ఇలాంటి నిస్సహాయ స్థితిలో ఉన్నపుడు భయపడకుండా POLICE కు తెలపండి',
              style: TextStyle(color: red, fontSize: 28),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/en/e/ea/Appolice%28emblem%29.png',
              height: 65,
              width: 65,
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Suggestion:',
                style: TextStyle(color: red, fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Social media లో పబ్లిక్ గా ఫొటోస్ ని పర్సనల్  విషయాలని షేర్ చేయకండి. తెలియని కొత్త వారి ఫ్రెండ్స్ రిక్వెస్ట్ నీ యాక్సెప్ట్ చేయకండి',
                style: TextStyle(color: Colors.blue, fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FraudTypesGrid()),
                      (route) => false);
                },
                child: Text("Close"))
          ],
        ),
      ),
    );
  }
}
