import 'package:flutter/material.dart';
import 'package:fraudulent/partTime/global/colors.dart';
import 'package:fraudulent/partTime/global/packages.dart';
import 'package:fraudulent/partTime/main.dart';

logOut() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        round(
            widget: Center(
              child: Icon(
                Icons.power_settings_new_outlined,
                size: 20,
                color: white,
              ),
            ),
            radius: 13,
            color: Color(0xff7F75CB),
            h: 41,
            w: 40),
        SizedBox(
          width: 20,
        ),
        Text(
          "Logout",
          style: TextStyle(fontFamily: "Is", fontSize: 14),
        )
      ],
    ),
  );
}

class Menu extends StatelessWidget {
  const Menu({super.key});
  Widget tile(
      {required String title,
      required IconData icon,
      required int color,
      required page,
      required BuildContext context}) {
    return InkWell(
      onTap: () {
        toScreen(context: context, page: page);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            round(
                widget: Center(
                  child: Icon(
                    icon,
                    size: 20,
                    color: white,
                  ),
                ),
                radius: 13,
                color: Color(color),
                h: 41,
                w: 40),
            SizedBox(
              width: 20,
            ),
            mdm(text: title, size: 14),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: "Menu"),
      backgroundColor: white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            h(h: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 120,
                // color: red,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CircleAvatar(
                              radius: 12.0,
                              backgroundImage: NetworkImage(user_image),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          right: -5,
                          child: round(
                              widget: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(width: 2, color: white),
                                ),
                                child: Center(
                                  child: Icon(
                                    IconlyBold.edit,
                                    color: white,
                                    size: 14,
                                  ),
                                ),
                              ),
                              radius: 50,
                              color: Color(0xff265DCC),
                              h: 25,
                              w: 25),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        smi(text: "Asif", size: 15),
                        h(h: 3),
                        rglr(
                            text: "connectasifshaik@gmail.com",
                            size: 12,
                            color: dark.withOpacity(0.5)),
                        h(h: 3),
                        rglr(
                            text: "7036727179",
                            size: 12,
                            color: dark.withOpacity(0.5)),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          // toScreen(context: context, page: UserProfile());
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: dark.withOpacity(0.3),
                        ))
                  ],
                ),
              ),
            ),
            Divider(),
            h(h: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smi(text: "Manage", size: 16, color: Color(0xff717B89)),
                    h(h: 20),
                    tile(
                        context: context,
                        page: Container(),
                        title: "My Staff",
                        icon: IconlyBold.profile,
                        color: 0xff3B9CED),
                    tile(
                        context: context,
                        page: Container(),
                        title: "Address",
                        icon: IconlyBold.location,
                        color: 0xff767F88),
                    h(h: 20),
                    smi(
                        text: "Support & Settings",
                        size: 16,
                        color: Color(0xff717B89)),
                    h(h: 20),
                    tile(
                        context: context,
                        page: Container(),
                        title: "Help",
                        icon: IconlyBold.chat,
                        color: 0xff3A9DEE),
                    tile(
                        context: context,
                        page: Container(),
                        title: "Report Fraudnts",
                        icon: IconlyBold.danger,
                        color: 0xffFEC6F75),
                    tile(
                        context: context,
                        page: Container(),
                        title: "Security",
                        icon: IconlyBold.shield_done,
                        color: 0xff5AC86F),
                    tile(
                        context: context,
                        page: Container(),
                        title: "Privacy Policy",
                        icon: IconlyBold.lock,
                        color: 0xffFCA639),
                    tile(
                        context: context,
                        page: Container(),
                        title: "About Us",
                        icon: Icons.info_outline,
                        color: 0xff47CFDB),
                    InkWell(
                      onTap: () async {
                        // SharedPreferences storeData =
                        //     await SharedPreferences.getInstance();
                        // storeData.clear().then((_) {
                        //   removeUntil(context: context, page: LongIn());
                        // });
                        // setState(() {
                        //   home_data = {};
                        //   news_subs = [];
                        //   milk_subs = [];
                        //   my_wallet = {};
                        // });
                        // print("token clear : $actoken");
                      },
                      child: logOut(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
