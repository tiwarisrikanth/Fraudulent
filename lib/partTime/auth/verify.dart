import 'dart:async';

import 'package:fraudulent/partTime/auth/register.dart';
import 'package:fraudulent/partTime/global/packages.dart';
import 'package:fraudulent/partTime/global/widgets.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
    _startTimer();
  }

  int _start = 30;
  bool _timerActive = true;
  Timer? _timer;

// timer

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          _timerActive = false;
        });
        _timer!.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  List<TextEditingController> controllers = [];
  String enteredPin = "";
  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  Widget pins() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: PinCodeTextField(
        autoFocus: true,
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        length: 4,
        obscureText: true,
        obscuringCharacter: '*',
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: (v) {
          if (v!.length < 3) {
            return "";
          } else {
            return null;
          }
        },
        pinTheme: PinTheme(
          selectedColor: lev_one,
          inactiveColor: lev_two,
          activeColor: lev_one,
          selectedFillColor: white,
          inactiveFillColor: white,
          shape: PinCodeFieldShape.underline,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 60,
          activeFillColor: Colors.white,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) async {
          debugPrint("Completed : ${v}");
        },
        onChanged: (value) {
          debugPrint(value);
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          return true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Container(
        child: Image.network(
            "https://www.freepnglogos.com/uploads/paper-plane-png/file-paper-plane-vector-svg-wikimedia-commons-2.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h(h: 15),
              iconBox(icon: LucideIcons.chevronLeft),
              h(h: 10),
              // Center(
              //   child: SizedBox(
              //     height: 150,
              //     child: Image.network(
              //         "https://img.freepik.com/free-photo/3d-mobile-phone-with-security-code-padlock_107791-16180.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1722124800&semt=sph"),
              //   ),
              // ),
              h(h: 25),
              bld(text: "Verify Account", size: 22),
              h(h: 5),
              mdm(
                  text:
                      "We have just sent OTP code to your phone number\n 7036727179 ",
                  size: 14,
                  color: dark.withOpacity(0.8)),
              h(h: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: pins(),
              ),
              h(h: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  _timerActive
                      ? mdm(text: '$_start seconds', size: 13)
                      : InkWell(
                          onTap: () async {
                            setState(() {
                              _start = 30;
                              _timerActive = true;
                            });
                            _startTimer();
                          },
                          child: smi(text: "Resend", size: 14, color: lev_one)),
                ],
              ),
              h(h: 40),
              Bounce(
                  onTap: () {
                    toScreen(
                        context: context, page: Register(phone: "7036727179"));
                  },
                  child: btn(name: "Proceed"))
            ],
          ),
        ),
      ),
    );
  }
}
