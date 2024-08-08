import 'package:flutter/material.dart';
import 'package:fraudulent/sextortaion/incoming_video_call.dart';
import 'package:fraudulent/warning.dart';

class ScamExplanationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Understanding the Scam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Understanding the Scam Process:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "1. **Initial Contact:** The scam starts with you receiving a seemingly legitimate link or offer, often through messaging apps like WhatsApp. The initial message may appear enticing, offering high returns on investments or lucrative trading opportunities.\n\n"
              "2. **Redirection:** Once you click on the link, you are redirected to a different platform, such as Telegram. This redirection is designed to create a sense of urgency or exclusivity.\n\n"
              "3. **APK Download and Installation:** On Telegram, you will be prompted to download and install an APK (Android Application Package) file. This APK is presented as a trading application that promises significant financial gains.\n\n"
              "4. **Deposit of Funds:** The next step involves you transferring funds into what you believe is a trading account. However, this account actually belongs to the scammer. You are led to believe that these funds are required for trading or investment.\n\n"
              "5. **No Actual Trading:** Despite transferring the amount, you will not receive any stocks or have any real trading activity. The application might show fake or misleading information to give the illusion of trading or investment.\n\n"
              "6. **Blocking and Communication Cut-Off:** Once the scammer has received your money, they will block you from all forms of communication. This includes blocking your phone number, social media accounts, and any other means of contact.\n\n"
              "7. **Be Aware:** It is crucial to recognize these signs and avoid engaging with such offers. Always verify the legitimacy of investment opportunities and avoid transferring money to unknown or unverified accounts.\n\n"
              "8. **Report Suspicious Activity:** If you suspect that you have encountered a scam, report it to the relevant authorities and take steps to protect your personal and financial information.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  FadePageRoute(
                    page: ScamWarningScreen(),
                  ),
                );
              },
              child: Text("Thank you, Will be aware!"),
            ),
          ],
        ),
      ),
    );
  }
}
