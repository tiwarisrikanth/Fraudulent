import 'package:flutter/material.dart';

import 'package:fraudulent/partTime/auth/register.dart';
import 'package:fraudulent/partTime/auth/verify.dart';
import 'package:fraudulent/partTime/global/colors.dart';
import 'package:fraudulent/partTime/global/widgets.dart';
// import 'package:fraudulent/partTime/global/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class login6 extends StatefulWidget {
  const login6({super.key});

  @override
  State<login6> createState() => _LogInState();
}

class _LogInState extends State<login6> {
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mdm(
                text: "Crafted with ❤ ",
                size: 12,
                color: dark.withOpacity(0.2)),
            // SizedBox(
            //   height: 20,
            //   child: Image.network(
            //       "https://digitalraiz.com/assets/images/logo.png"),
            // )
          ],
        ),
      ),
      backgroundColor: white,
      floatingActionButton: phone.text.length < 10
          ? SizedBox()
          : FloatingActionButton(
              backgroundColor: lev_one,
              onPressed: () {},
              child: Icon(LucideIcons.rocket),
            ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              //
              child: Image.network(
                  "https://m.economictimes.com/thumb/msid-89201675,width-1200,height-900,resizemode-4,imgsize-102702/1.jpg"),
              // child: Lottie.asset('assets/images/anione.json'),
            ),
            Container(
              color: white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h(h: 30),
                    Row(
                      children: [
                        smi(text: "Hey,", size: 24),
                        w(w: 5),
                        Icon(
                          LucideIcons.pawPrint,
                          color: Colors.orangeAccent,
                        )
                      ],
                    ),
                    mdm(text: "let's find you a Work from Home Job", size: 24),
                    h(h: 20),
                    feild(
                        tt: true,
                        title: "",
                        hintText: "Enter Your Phone",
                        controller: phone),
                    h(h: 40),
                    InkWell(
                        onTap: () {
                          toScreen(context: context, page: Verify());
                        },
                        child: btn(name: "Continue"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
