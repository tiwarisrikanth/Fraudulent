import '../global/packages.dart';

class ProfileListScreen extends StatelessWidget {
  final List<Map<String, String>> profiles = [
    {
      "name": "John Smith",
      "rating": "4.9",
      "experience": "5 year experience",
      "carType": "Sedan",
      "image": "https://randomuser.me/api/portraits/men/32.jpg",
      "education": "Bachelor's in Computer Science",
      "age": "30",
      "religion": "Christian"
    },
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
      "name": "David Brown",
      "rating": "4.7",
      "experience": "2 year experience",
      "carType": "Compact",
      "image": "https://randomuser.me/api/portraits/men/64.jpg",
      "education": "Bachelor's in Mechanical Engineering",
      "age": "25",
      "religion": "Hindu"
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
      "name": "Michael Johnson",
      "rating": "4.6",
      "experience": "6 year experience",
      "carType": "Sedan",
      "image": "https://randomuser.me/api/portraits/men/33.jpg",
      "education": "Master's in Engineering",
      "age": "32",
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
      "name": "William Brown",
      "rating": "4.9",
      "experience": "7 year experience",
      "carType": "SUV",
      "image": "https://randomuser.me/api/portraits/men/34.jpg",
      "education": "Master's in Computer Science",
      "age": "35",
      "religion": "Hindu"
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
      "name": "James Anderson",
      "rating": "4.6",
      "experience": "5 year experience",
      "carType": "SUV",
      "image": "https://randomuser.me/api/portraits/men/35.jpg",
      "education": "Bachelor's in Finance",
      "age": "29",
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
      "name": "Benjamin Martinez",
      "rating": "4.8",
      "experience": "3 year experience",
      "carType": "Sedan",
      "image": "https://randomuser.me/api/portraits/men/36.jpg",
      "education": "Bachelor's in Mathematics",
      "age": "28",
      "religion": "Christian"
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
      backgroundColor: Colors.grey[200],
      appBar: topBar(title: "Drivers"),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ProfileCard(profile: profiles[index]);
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Map<String, String> profile;

  const ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                profile['image']!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            h(h: 10),
            bld(text: profile['name']!, size: 20),
            h(h: 5),
            rglr(
                text: '${profile['rating']} · ${profile['experience']}',
                size: 14,
                color: Colors.grey),
            h(h: 5),
            rglr(text: profile['carType']!, size: 14, color: Colors.grey),
            h(h: 10),
            rglr(
                text: 'Education: ${profile['education']}',
                size: 14,
                color: Colors.black),
            h(h: 5),
            rglr(text: 'Age: ${profile['age']}', size: 14, color: Colors.black),
            h(h: 5),
            rglr(
                text: 'Religion: ${profile['religion']}',
                size: 14,
                color: Colors.black),
            h(h: 10),
            round(
              h: 40,
              w: double.infinity,
              widget: TextButton(
                onPressed: () {},
                child: bld(text: 'View profile', size: 14, color: Colors.white),
              ),
              radius: 10,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
