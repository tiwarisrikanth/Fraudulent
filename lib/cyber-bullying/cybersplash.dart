import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fraudulent/betting/global/colors.dart';

class CyberSplashScreen extends StatefulWidget {
  @override
  _CyberSplashScreenState createState() => _CyberSplashScreenState();
}

class _CyberSplashScreenState extends State<CyberSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroductionScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cyber Bullying Awareness',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Understanding the Impact',
              style: TextStyle(
                color: Colors.blueGrey[300],
                fontSize: 18,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 50),
            SpinKitFadingCircle(
              color: Colors.blueGrey[300],
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        title: Text(
          'Introduction',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'What is Cyber Bullying?',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Cyber bullying is bullying that takes place over digital devices like cell phones, computers, and tablets. It can occur through SMS, Text, and apps, or online in social media, forums, or gaming where people can view, participate in, or share content.',
              style: TextStyle(
                color: Colors.blueGrey[700],
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the first scenario screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScenarioOneScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Start Simulation',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 1.5,
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

class ScenarioOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        titleSpacing: 0,
        title: Text(
          'Scenario 1: Mean Comments',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Social Media Post',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username123',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Just posted a new picture! What do you think?',
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Comments:',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildComment(context, 'User1', 'This picture is terrible...'),
            _buildComment(context, 'User2', 'You look so ugly!'),
            _buildComment(context, 'User3', 'Why do you even bother posting?'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next scenario screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScenarioTwoScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(BuildContext context, String username, String comment) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Impact of Comment'),
              content: Text(
                'Comments like this can hurt someone deeply. They might feel sad, worthless, and alone. It\'s important to be kind online.',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
            SizedBox(height: 5),
            Text(
              comment,
              style: TextStyle(
                color: Colors.blueGrey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScenarioTwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(color: white),
        title: Text(
          'Scenario 2: Rumors and Exclusion',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Group Chat',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildChatMessage(
                context, 'Friend1', 'Hey, did you hear about Alex?'),
            _buildChatMessage(context, 'Friend2',
                'Yeah, I heard something really weird about them.'),
            _buildChatMessage(
                context, 'Friend3', 'Let\'s not invite Alex to the party...'),
            _buildChatMessage(
                context, 'Friend4', 'Good idea, they\'re so annoying.'),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next scenario screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScenarioThreeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildChatMessage(
      BuildContext context, String username, String message) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Impact of Exclusion and Rumors'),
              content: Text(
                'Excluding someone and spreading rumors can cause them to feel isolated and hurt. It can have long-term effects on their mental health and self-esteem.',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
            SizedBox(height: 5),
            Text(
              message,
              style: TextStyle(
                color: Colors.blueGrey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScenarioThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        titleSpacing: 0,
        title: Text(
          'Scenario 3: Threats and Harassment',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Private Messages',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildChatMessage(
                context, 'Harasser', 'You better watch your back...'),
            _buildChatMessage(
                context, 'Harasser', 'If you tell anyone, you\'ll regret it.'),
            _buildChatMessage(context, 'Harasser', 'I know where you live.'),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next scenario screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScenarioFourScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildChatMessage(
      BuildContext context, String username, String message) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Impact of Threats and Harassment'),
              content: Text(
                'Threats and harassment can be extremely frightening and stressful for the victim. It can lead to severe anxiety, depression, and even physical harm.',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent[700],
              ),
            ),
            SizedBox(height: 5),
            Text(
              message,
              style: TextStyle(
                color: Colors.blueGrey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScenarioFourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(color: white),
        title: Text(
          'Scenario 4: Impersonation & False Info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Fake Profile',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FakeUser123 (Pretending to be Alex)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Did you know Alex is involved in illegal activities?',
                    style: TextStyle(
                      color: Colors.redAccent[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Comments:',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildComment(context, 'User1', 'Wow, I didn\'t know that!'),
            _buildComment(context, 'User2', 'This is shocking!'),
            _buildComment(
                context, 'User3', 'I can\'t believe Alex would do that.'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next scenario screen
                  // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ScenarioFiveScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(BuildContext context, String username, String comment) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Impact of False Information'),
              content: Text(
                'Spreading false information and impersonating others can ruin someone\'s reputation. It can lead to serious personal and professional consequences.',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
            SizedBox(height: 5),
            Text(
              comment,
              style: TextStyle(
                color: Colors.blueGrey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
