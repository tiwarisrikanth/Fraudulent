import 'package:flutter/material.dart';
import 'package:fraudulent/betting/global/colors.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deposit"),
      ),
      body: Stack(
        children: [
          Image.network(
            "https://www.dupaco.com/wp-content/uploads/2022/06/crypto-screenshot.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 188.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DepositScreen2(),
                          ),
                        );
                      },
                      child: Text(
                        "Click Next to deposit\nTo open your trade account",
                        style: TextStyle(
                            color: red,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
                ),
              ))
        ],
      ),
    );
  }
}

class DepositScreen2 extends StatelessWidget {
  const DepositScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.network("https://i.redd.it/k7y3ldhtgyg41.jpg"),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 128.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Congratulations! You are eligible for trading. Click next to buy",
                            style: TextStyle(
                                color: red,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => DepositScreen2(),
                              //   ),
                              // );
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
