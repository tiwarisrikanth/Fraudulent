import 'package:fraudulent/partTime/global/packages.dart';
import 'package:fraudulent/partTime/global/widgets.dart';
import 'package:fraudulent/partTime/main.dart';
// import 'package:maauser/global/packages.dart';
// import 'package:maauser/main.dart';

class Register extends StatefulWidget {
  Register({Key? key, required this.phone}) : super(key: key);
  String phone;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// textcontrollers
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();

  bool isTermsAgreed = false;

  void onCheckboxChanged(bool newValue) {
    setState(() {
      isTermsAgreed = newValue;
    });

    if (isTermsAgreed) {
      print("User agreed to terms.");
    } else {
      print("User did not agree to terms.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h(h: 20),
              Row(
                children: [
                  Spacer(),
                  Icon(
                    LucideIcons.sparkles,
                    size: 55,
                  ),
                  w(w: 20)
                ],
              ),
              smi(text: "Create Account", size: 22),
              h(h: 20),
              feild(title: "Name", hintText: "ex: John", controller: name),
              h(h: 15),
              feild(
                  title: "Email",
                  hintText: "ex: example@gmail.com",
                  controller: email),
              h(h: 15),
              InkWell(
                onTap: () {
                  // toast(mesg: "Aleady Verified ✔");
                },
                child: feild(
                    title: "Phone Number",
                    hintText: "${widget.phone}",
                    controller: TextEditingController(),
                    edit: true),
              ),
              h(h: 15),
              feild(title: "City", hintText: "ex: Hyderabad", controller: city),
              h(h: 15),
              feild(
                  title: "State", hintText: "ex: Telangana", controller: state),
              h(h: 15),
              TermsAndConditionsCheckbox(
                initialValue: isTermsAgreed,
                onChanged: onCheckboxChanged,
              ),
              h(h: 50),
              Bounce(
                  onTap: () async {
                    // if (name.text.isEmpty) {
                    //   failed(
                    //       mesg: "Name Feild Can't be Emtpy", context: context);
                    // } else if (email.text.isEmpty) {
                    //   failed(
                    //       mesg: "Email Feild Can't be Emtpy", context: context);
                    // } else if (!email.text.contains('@') ||
                    //     !email.text.endsWith('.com')) {
                    //   failed(
                    //       mesg: "Please enter a valid email address.",
                    //       context: context);
                    // } else if (city.text.isEmpty) {
                    //   failed(
                    //       mesg: "City Feild Can't be Emtpy", context: context);
                    // } else if (state.text.isEmpty) {
                    //   failed(
                    //       mesg: "State Feild Can't be Emtpy", context: context);
                    // } else if (isTermsAgreed == false) {
                    //   failed(
                    //       mesg: "Please Check Terms & Condtions",
                    //       context: context);
                    // } else {
                    //   // apiService.regester_user(
                    //   //     context: context,
                    //   //     phone: widget.phone,
                    //   //     email: email.text.trim(),
                    //   //     city: city.text,
                    //   //     state: state.text,
                    //   //     name: name.text);
                    // }
                    toScreen(context: context, page: MainSectionState());
                  },
                  child: btn(name: "Submit")),
            ],
          ),
        ),
      ),
    );
  }
}

class TermsAndConditionsCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  TermsAndConditionsCheckbox({
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  _TermsAndConditionsCheckboxState createState() =>
      _TermsAndConditionsCheckboxState();
}

class _TermsAndConditionsCheckboxState
    extends State<TermsAndConditionsCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void handleCheckboxChange(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: Checkbox(
            activeColor: lev_one,
            value: isChecked,
            onChanged: handleCheckboxChange,
          ),
        ),
        w(w: 10),
        GestureDetector(
          onTap: () {
            // You can add functionality here to open the terms and conditions page
            print("Terms & Conditions clicked");
          },
          child: InkWell(
            onTap: () {
              // toScreen(
              //     context: context,
              //     page: Policies(title: "Terms & Conditions"));
            },
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text: "I agree to ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: dark,
                      )),
                  TextSpan(
                    text: "Terms & Conditions",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> shareApp(BuildContext context) async {
  // Replace these placeholders with your actual app store and Google Play links
  final appStoreLink = 'https://apps.apple.com/app/your-app-id';
  final playStoreLink =
      'https://play.google.com/store/apps/details?id=your.app.package';

  final message = 'Check out my awesome app!\n'
      '• App Store: $appStoreLink\n'
      '• Google Play: $playStoreLink';

  // Use the share plugin to offer sharing options to different apps
  // await Share.share(message, subject: 'Share this amazing app');
}

feild(
    {required String title,
    required String hintText,
    required TextEditingController controller,
    bool edit = false,
    bool tt = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // mdm(text: title, size: 15),
      Text(
        title,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w600, fontSize: 15, color: dark),
      ),
      h(h: 6),
      Container(
        alignment: Alignment.center,
        height: tt ? 50 : 45,
        decoration: BoxDecoration(
            border: Border.all(color: lev_two, width: 1),
            color: white,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 7),
          child: TextField(
            readOnly: edit,
            controller: controller,
            cursorColor: lev_one,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: dark.withOpacity(0.5))),
          ),
        ),
      )
    ],
  );
}
