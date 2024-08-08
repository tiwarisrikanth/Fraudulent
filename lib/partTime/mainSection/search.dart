import 'package:lottie/lottie.dart';
import 'package:fraudulent/partTime/global/packages.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: "Find The Right 🔎ne "),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            h(h: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 45,
                      child: TextField(
                        onChanged: (value) {
                          // search_news();
                        },
                        controller: TextEditingController(),
                        cursorColor: lev_one,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Maids, Tutors & Drivers etc",
                            hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Colors.grey),
                            prefixIcon: Icon(
                              LucideIcons.search,
                              color: lev_one,
                            )),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey.withOpacity(0.1))),
                ),
                w(w: 10),
                Bounce(
                  onTap: () {
                    // _showPopupMenu(context);
                  },
                  child: round(
                      widget: Center(
                        child: Icon(
                          LucideIcons.settings2,
                          color: white,
                          size: 17,
                        ),
                      ),
                      radius: 12,
                      color: lev_one,
                      h: 45,
                      w: 50),
                ),
              ],
            ),
            Expanded(
                child: Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset('assets/images/nodata.json'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
