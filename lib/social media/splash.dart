import 'package:flutter/material.dart';
import 'package:fraudulent/social%20media/nextscreensssss.dart';
import 'package:page_transition/page_transition.dart'; // Add this package for smooth animation

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      PageTransition(
        type:
            PageTransitionType.fade, // You can change this to other animations
        child: AwarenessScreen(), // Replace with your next screen widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Social Media Harassment Simulation',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class AwarenessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/ins.png',
          width: 90,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mark_email_unread_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: AwarenessFeed(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class AwarenessFeed extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      'username': 'Emily-Smith',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/1468379/pexels-photo-1468379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'On vacation trip'
    },
    {
      'username': 'Sophia_Johnson',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/1308881/pexels-photo-1308881.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'Love with flowers'
    },
    {
      'username': 'Isabella_Williams',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/1321909/pexels-photo-1321909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'My beautiful dress'
    },
    {
      'username': 'Olivia_Brown',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'In my garden'
    },
    {
      'username': 'Ava_Jones',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/341970/pexels-photo-341970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'Online safety is everyone’s responsibility.'
    },
    {
      'username': 'Mia_Garcia',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/1642228/pexels-photo-1642228.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'Think before you post. Once it’s out there, it’s forever.'
    },
    {
      'username': 'Charlotte_Miller',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'Let’s end cyberbullying together. #StopHarassment'
    },
    {
      'username': 'Amelia_Davis',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/1898555/pexels-photo-1898555.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'Your safety matters. Be aware of online threats.'
    },
    {
      'username': 'Harper_Wilson',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/245388/pexels-photo-245388.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'Be kind online. Your words have power.'
    },
    {
      'username': 'Evelyn_Moore',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual profile pic URL
      'postImage':
          'https://images.pexels.com/photos/872756/pexels-photo-872756.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'caption': 'Remember, online actions have offline consequences.'
    },
  ];

  final List<Map<String, String>> stories = [
    {
      'username': 'Emily',
      'profileImage':
          'https://images.pexels.com/photos/22608405/pexels-photo-22608405/free-photo-of-pink-roses-behind-railing.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Sophia',
      'profileImage':
          'https://images.pexels.com/photos/20760083/pexels-photo-20760083/free-photo-of-close-up-of-a-pink-berry-cocktail.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Olivia',
      'profileImage':
          'https://images.pexels.com/photos/25857700/pexels-photo-25857700/free-photo-of-pink-flowers-of-a-plant-growing-outside-of-a-cafe-building-in-arnavutkoy-istanbul-turkey.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Ava',
      'profileImage':
          'https://images.pexels.com/photos/19122162/pexels-photo-19122162/free-photo-of-woman-sitting-on-a-blanket-on-the-beach-with-a-drink-and-donuts.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Isabella',
      'profileImage':
          'https://images.pexels.com/photos/10370854/pexels-photo-10370854.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Mia',
      'profileImage':
          'https://images.pexels.com/photos/23169742/pexels-photo-23169742/free-photo-of-woman-with-hand-over-bush-with-flowers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Charlotte',
      'profileImage':
          'https://images.pexels.com/photos/18821588/pexels-photo-18821588/free-photo-of-young-woman-decorated-with-butterflies.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Amelia',
      'profileImage':
          'https://images.pexels.com/photos/22608405/pexels-photo-22608405/free-photo-of-pink-roses-behind-railing.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Harper',
      'profileImage':
          'https://images.pexels.com/photos/20760083/pexels-photo-20760083/free-photo-of-close-up-of-a-pink-berry-cocktail.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Evelyn',
      'profileImage':
          'https://images.pexels.com/photos/25857700/pexels-photo-25857700/free-photo-of-pink-flowers-of-a-plant-growing-outside-of-a-cafe-building-in-arnavutkoy-istanbul-turkey.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Ella',
      'profileImage':
          'https://images.pexels.com/photos/19122162/pexels-photo-19122162/free-photo-of-woman-sitting-on-a-blanket-on-the-beach-with-a-drink-and-donuts.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Grace',
      'profileImage':
          'https://images.pexels.com/photos/10370854/pexels-photo-10370854.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Chloe',
      'profileImage':
          'https://images.pexels.com/photos/23169742/pexels-photo-23169742/free-photo-of-woman-with-hand-over-bush-with-flowers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Sofia',
      'profileImage':
          'https://images.pexels.com/photos/18821588/pexels-photo-18821588/free-photo-of-young-woman-decorated-with-butterflies.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Lily',
      'profileImage':
          'https://images.pexels.com/photos/22608405/pexels-photo-22608405/free-photo-of-pink-roses-behind-railing.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Aria',
      'profileImage':
          'https://images.pexels.com/photos/20760083/pexels-photo-20760083/free-photo-of-close-up-of-a-pink-berry-cocktail.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Zoe',
      'profileImage':
          'https://images.pexels.com/photos/25857700/pexels-photo-25857700/free-photo-of-pink-flowers-of-a-plant-growing-outside-of-a-cafe-building-in-arnavutkoy-istanbul-turkey.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Mila',
      'profileImage':
          'https://images.pexels.com/photos/19122162/pexels-photo-19122162/free-photo-of-woman-sitting-on-a-blanket-on-the-beach-with-a-drink-and-donuts.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Luna',
      'profileImage':
          'https://images.pexels.com/photos/10370854/pexels-photo-10370854.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Nora',
      'profileImage':
          'https://images.pexels.com/photos/23169742/pexels-photo-23169742/free-photo-of-woman-with-hand-over-bush-with-flowers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Ellie',
      'profileImage':
          'https://images.pexels.com/photos/18821588/pexels-photo-18821588/free-photo-of-young-woman-decorated-with-butterflies.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Lila',
      'profileImage':
          'https://images.pexels.com/photos/22608405/pexels-photo-22608405/free-photo-of-pink-roses-behind-railing.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Maya',
      'profileImage':
          'https://images.pexels.com/photos/20760083/pexels-photo-20760083/free-photo-of-close-up-of-a-pink-berry-cocktail.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Nina',
      'profileImage':
          'https://images.pexels.com/photos/25857700/pexels-photo-25857700/free-photo-of-pink-flowers-of-a-plant-growing-outside-of-a-cafe-building-in-arnavutkoy-istanbul-turkey.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Cora',
      'profileImage':
          'https://images.pexels.com/photos/19122162/pexels-photo-19122162/free-photo-of-woman-sitting-on-a-blanket-on-the-beach-with-a-drink-and-donuts.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'username': 'Hazel',
      'profileImage':
          'https://images.pexels.com/photos/19122162/pexels-photo-19122162/free-photo-of-woman-sitting-on-a-blanket-on-the-beach-with-a-drink-and-donuts.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Story Section
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) {
              final story = stories[index];
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 2),
                      image: DecorationImage(
                        image: NetworkImage(story['profileImage']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(story['username']!, style: TextStyle(fontSize: 12)),
                ],
              );
            },
          ),
        ),
        // Feed Section
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return AwarenessPost(
              username: post['username']!,
              profileImage: post['postImage']!,
              postImage: post['postImage']!,
              caption: post['caption']!,
            );
          },
        ),
      ],
    );
  }
}

class AwarenessPost extends StatelessWidget {
  final String username;
  final String profileImage;
  final String postImage;
  final String caption;

  AwarenessPost(
      {required this.username,
      required this.profileImage,
      required this.postImage,
      required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(profileImage),
          ),
          title: Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextScreenSection(),
                  ),
                );
              },
              child: Text("Next")),
          //
          // Icon(Icons.more_vert),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfile(),
              ),
            );
          },
        ),
        Image.network(postImage, fit: BoxFit.cover),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
            IconButton(icon: Icon(Icons.comment), onPressed: () {}),
            IconButton(icon: Icon(Icons.send), onPressed: () {}),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            caption,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class UserProfile extends StatelessWidget {
  final List<String> profileImages = [
    'https://images.pexels.com/photos/22608405/pexels-photo-22608405/free-photo-of-pink-roses-behind-railing.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/20760083/pexels-photo-20760083/free-photo-of-close-up-of-a-pink-berry-cocktail.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/25857700/pexels-photo-25857700/free-photo-of-pink-flowers-of-a-plant-growing-outside-of-a-cafe-building-in-arnavutkoy-istanbul-turkey.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/19122162/pexels-photo-19122162/free-photo-of-woman-sitting-on-a-blanket-on-the-beach-with-a-drink-and-donuts.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/10370854/pexels-photo-10370854.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/23169742/pexels-photo-23169742/free-photo-of-woman-with-hand-over-bush-with-flowers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/18821588/pexels-photo-18821588/free-photo-of-young-woman-decorated-with-butterflies.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/22608405/pexels-photo-22608405/free-photo-of-pink-roses-behind-railing.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/20760083/pexels-photo-20760083/free-photo-of-close-up-of-a-pink-berry-cocktail.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/25857700/pexels-photo-25857700/free-photo-of-pink-flowers-of-a-plant-growing-outside-of-a-cafe-building-in-arnavutkoy-istanbul-turkey.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emily_Smith'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/22608405/pexels-photo-22608405/free-photo-of-pink-roses-behind-railing.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildUserStat('Posts', '10'),
                        _buildUserStat('Followers', '1.2k'),
                        _buildUserStat('Following', '180'),
                      ],
                    ),
                  ),
                  // User Info
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emily_Smith',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(height: 4),
                  Text(
                    'Photographer | Traveler | Coffee Lover',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '📍 Address: 1234 Elm Street, Springfield',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '📞 Mobile: (123) 456-7890',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '📧 Email: emily.smith@example.com',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            // SizedBox(height: 16),
            // Edit Profile Button
            Row(
              children: [
                SizedBox(width: 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(color: Colors.grey[300]!),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Following',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Message',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('Contact'),
                  ),
                ),
                SizedBox(width: 2),
              ],
            ),

            // SizedBox(height: 10),
            // User Images Grid
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: profileImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle image tap
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        profileImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
