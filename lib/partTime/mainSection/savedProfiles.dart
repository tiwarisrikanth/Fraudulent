import 'dart:math';

import 'package:fraudulent/partTime/global/packages.dart';
import 'package:fraudulent/partTime/mainSection/details.dart';

class SavedProfiles extends StatefulWidget {
  const SavedProfiles({super.key});

  @override
  State<SavedProfiles> createState() => _SavedProfilesState();
}

class _SavedProfilesState extends State<SavedProfiles> {
  // Dummy list of maid profiles
  final  maidProfiles = [
{
    'title': 'Customer Support',
    'applicants': Random().nextInt(1000),
    'imageUrl': 'https://images.unsplash.com/photo-1582719478250-60eb42a2184d', // Unsplash
  },
  {
    'title': 'UX/UI Designer',
    'applicants': Random().nextInt(1000),
    'imageUrl': 'https://images.unsplash.com/photo-1515165562838-58a14dd5746f', // Unsplash
  },
  {
    'title': 'Backend Developer',
    'applicants': Random().nextInt(1000),
    'imageUrl': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d', // Unsplash
  },
  {
    'title': 'Mobile Developer',
    'applicants': Random().nextInt(1000),
    'imageUrl': 'https://images.unsplash.com/photo-1501843508755-af0829d48620', // Unsplash
  },
  {
    'title': 'Network Engineer',
    'applicants': Random().nextInt(1000),
    'imageUrl': 'https://images.unsplash.com/photo-1581093448798-5ce4e3edb64d', // Unsplash
  },
  {
    'title': 'DevOps Engineer',
    'applicants': Random().nextInt(1000),
    'imageUrl': 'https://images.unsplash.com/photo-1551836022-d5d88e9218df', // Unsplash
  },
  {
    'title': 'System Administrator',
    'applicants': Random().nextInt(1000),
    'imageUrl': 'https://images.unsplash.com/photo-1527689368864-3a821dbccc34', // Unsplash
  },
  {
    'title': 'QA Tester',
    'applicants': Random().nextInt(1000),
    'imageUrl': 'https://images.unsplash.com/photo-1542744095-fcf48d80b0fd', // Unsplash
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: appbar(title: "Saved Profiles"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Column(
          children: [
            h(h: 10),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: maidProfiles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: maids(maidProfiles[index], context),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget maids(Map maid, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smi(text: maid['title'] ?? '', size: 14),
              h(h: 5),
              mdm(
                text: '${maid['applicants']} applicants' ?? '',
                size: 12,
                color: dark.withOpacity(0.5),
              ),
              h(h: 10),
              Bounce(
                onTap: () {
                  toScreen(context: context, page: MaidDetails(data :maid));
                },
                child: round(
                  h: 30,
                  w: 120,
                  widget: smi(text: "View more", size: 12),
                  color: lev_two,
                ),
              )
            ],
          ),
          SizedBox(
            height: 70,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                maid['imageUrl'] ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
