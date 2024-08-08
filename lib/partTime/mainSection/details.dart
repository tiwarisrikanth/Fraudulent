import 'package:fraudulent/partTime/global/packages.dart';
import 'package:fraudulent/partTime/main.dart';
import 'package:fraudulent/partTime/mainSection/termspay.dart';

class MaidDetails extends StatefulWidget {
   MaidDetails({super.key,required this.data});
Map data ;
  @override
  State<MaidDetails> createState() => _MaidDetailsState();
}

class _MaidDetailsState extends State<MaidDetails> {
  final List<String> languages = ['Shares', 'OTs', 'Travel Allowance'];
  String maid_img =
      "https://plus.unsplash.com/premium_photo-1708271595672-57b4a6a2d3cd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHwwfDB8fHww";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // bottomNavigationBar: Container(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      //     child: btn(name: "Book", height: 50),
      //   ),
      // ),
      appBar: topBar(title: "Details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h(h: 35),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      smi(text: "${widget.data['title']}", size: 15),
                      h(h: 10),
                      mdm(
                          text: "Availble for 12",
                          size: 14,
                          color: dark.withOpacity(0.5)),
                      h(h: 10),
                      plainBtn(name: "Chat", h: 35, w: 100)
                    ],
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                        height: 100,
                        width: 200,
                        child: Image.network(
                          widget.data['imageUrl'],
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
              Divider(
                height: 50,
              ),
              smi(text: "About", size: 18),
              h(h: 10),
              rglr(
                  text:
                      "You will under great team with great mentors to learn and expand your skills to the peak. You will be getting paid 1st of months and have othe free perks working at our company",
                  size: 14,
                  color: dark.withOpacity(0.5)),
              Divider(
                height: 50,
              ),
              smi(text: "Services", size: 18),
              h(h: 10),
              Wrap(
                spacing: 8.0, // Horizontal spacing between the chips
                runSpacing: 4.0, // Vertical spacing between the chips
                children: languages
                    .map((language) => _buildLanguageChip(language))
                    .toList(),
              ),
              Divider(
                height: 50,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    iconBox(icon: LucideIcons.languages),
                    w(w: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        smi(text: "Languages", size: 14),
                        mdm(
                            text: "Telugu, Hindi , English",
                            size: 12,
                            color: dark.withOpacity(0.8))
                      ],
                    )
                  ],
                ),
              ),
              h(h: 20),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    iconBox(icon: LucideIcons.timer),
                    w(w: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        smi(text: "Timings", size: 14),
                        mdm(
                            text: "Work as you find time",
                            size: 12,
                            color: dark.withOpacity(0.8))
                      ],
                    )
                  ],
                ),
              ),
              h(h: 20),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    iconBox(icon: LucideIcons.star),
                    w(w: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        smi(text: "Reviews", size: 14),
                        mdm(text: "4/5", size: 12, color: dark.withOpacity(0.8))
                      ],
                    )
                  ],
                ),
              ),
              h(h: 20),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    iconBox(icon: LucideIcons.graduationCap),
                    w(w: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        smi(text: "Education", size: 14),
                        mdm(
                            text: "10th Class",
                            size: 12,
                            color: dark.withOpacity(0.8))
                      ],
                    )
                  ],
                ),
              ),
              h(h: 20),
              Bounce(
                onTap: () {
                  toScreen(context: context, page: ChatScreen());
                },
                child: btn(name: "Apply Now", height: 50)),
              h(h: 15)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLanguageChip(String language) {
  return Chip(
    label: mdm(text: language, size: 12),
    backgroundColor: Colors.grey[200], // Customize the chip background color
  );
}
