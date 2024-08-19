import 'package:flutter/material.dart';
import 'package:fraudulent/betting/global/colors.dart';
import 'package:fraudulent/home.dart';

class BuyCrypto extends StatefulWidget {
  const BuyCrypto({super.key});

  @override
  State<BuyCrypto> createState() => _BuyCryptoState();
}

class _BuyCryptoState extends State<BuyCrypto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Crypto"),
      ),
      body: Stack(
        children: [
          Image.network(
            "https://miro.medium.com/v2/resize:fit:1400/1*fRY9G6AKtZlXC7UjMr9hHA.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 58.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade800),
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen2(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewScreen2 extends StatelessWidget {
  const NewScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.network(
                  'https://www.mtpelerin.com/images/widget-en-3.png')),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 248.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade800),
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen23(),
                        ),
                      );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewScreen23 extends StatelessWidget {
  const NewScreen23({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrXfx1tqEC4BZA-8ipXsY8Q4TK862J5MoFbiOx5HtuKJOt3TcZrpzu-UnLpLGwnU9RAho&usqp=CAU',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 278.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Congratulations! You bought 1 BitCoin and earned 2 Bitcoins in one day",
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "While purchasing bitcoins please check weather it is original BTC app or Fake BTC app\n\nClick next to view some of teh examples of original and facke apps",
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 128.0),
              child: Container(
                color: Colors.blueGrey.shade900,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "3.05393352 BTC",
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 188.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewScreen878(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
          // Align(
          //   alignment: Alignment.center,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 248.0),
          //     child: Container(
          //       width: MediaQuery.of(context).size.width,
          //       child: ElevatedButton(
          //           style: ButtonStyle(
          //             backgroundColor:
          //                 MaterialStateProperty.all(Colors.blue.shade800),
          //           ),
          //           onPressed: () {
          //             // Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => NewScreen2(),
          //   ),
          // );
          //           },
          //           child: Text(
          //             "Next",
          //             style: TextStyle(
          //                 color: white,
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 18),
          //             textAlign: TextAlign.center,
          //           )),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class NewScreen878 extends StatelessWidget {
  const NewScreen878({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparison"),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/sc.jpeg',
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
            "https://cracku.in/latest-govt-jobs/wp-content/uploads/2019/10/ap-police-logo.png",
            height: 150,
            width: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Please be aware of these kind of fake apps which looks like original apps",
              style: TextStyle(
                color: black,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
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
    );
  }
}
