import '../global/packages.dart';

class LadiesProfileListScreen extends StatelessWidget {
  final List<Map<String, String>> profiles = [
    {
      "name": "Linda Johnson",
      "rating": "4.8",
      "experience": "3 year experience",
      "carType": "SUV",
      "image": "https://randomuser.me/api/portraits/women/44.jpg",
      "education": "Master's in Business Administration",
      "age": "28",
      "religion": "Atheist"
    },
    {
      "name": "Sophia Wilson",
      "rating": "4.8",
      "experience": "4 year experience",
      "carType": "SUV",
      "image": "https://randomuser.me/api/portraits/women/50.jpg",
      "education": "Bachelor's in Arts",
      "age": "27",
      "religion": "Christian"
    },
    {
      "name": "Emma Davis",
      "rating": "4.7",
      "experience": "3 year experience",
      "carType": "Compact",
      "image": "https://randomuser.me/api/portraits/women/51.jpg",
      "education": "Bachelor's in Business",
      "age": "26",
      "religion": "Atheist"
    },
    {
      "name": "Olivia Miller",
      "rating": "4.5",
      "experience": "2 year experience",
      "carType": "Sedan",
      "image": "https://randomuser.me/api/portraits/women/52.jpg",
      "education": "Bachelor's in Psychology",
      "age": "24",
      "religion": "Christian"
    },
    {
      "name": "Ava Thompson",
      "rating": "4.7",
      "experience": "4 year experience",
      "carType": "Compact",
      "image": "https://randomuser.me/api/portraits/women/53.jpg",
      "education": "Master's in Marketing",
      "age": "27",
      "religion": "Hindu"
    },
    {
      "name": "Isabella Garcia",
      "rating": "4.9",
      "experience": "6 year experience",
      "carType": "SUV",
      "image": "https://randomuser.me/api/portraits/women/54.jpg",
      "education": "Master's in Sociology",
      "age": "30",
      "religion": "Atheist"
    },
    {
      "name": "Ava Thompson",
      "rating": "4.7",
      "experience": "4 year experience",
      "carType": "Compact",
      "image": "https://randomuser.me/api/portraits/women/53.jpg",
      "education": "Master's in Marketing",
      "age": "27",
      "religion": "Hindu"
    },
    {
      "name": "Isabella Garcia",
      "rating": "4.9",
      "experience": "6 year experience",
      "carType": "SUV",
      "image": "https://randomuser.me/api/portraits/women/54.jpg",
      "education": "Master's in Sociology",
      "age": "30",
      "religion": "Atheist"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: topBar(title: "Tutors", center: false),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return LadiesProfileCard(
            profile: profiles[index],
            isTopAligned: index % 2 == 0, // Alternate alignment
          );
        },
      ),
    );
  }
}

class LadiesProfileCard extends StatelessWidget {
  final Map<String, String> profile;
  final bool isTopAligned;

  const LadiesProfileCard({
    required this.profile,
    required this.isTopAligned,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30), // Adjusted to fit the image
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              // BoxShadow(
              //   color: Colors.grey.withOpacity(0.5),
              //   spreadRadius: 2,
              //   blurRadius: 7,
              //   offset: Offset(0, 3), // changes position of shadow
              // ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30), // Space for the image
                bld(text: profile['name']!, size: 16),
                SizedBox(height: 5),
                rglr(
                  text: 'Heart Surgeon, London',
                  size: 12,
                  color: Colors.grey,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lev_one,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  child: bld(
                    text: 'Appointment',
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 4, color: bg),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: white),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(profile['image']!),
              ),
            ),
          ),
        )
      ],
    );
  }
}
