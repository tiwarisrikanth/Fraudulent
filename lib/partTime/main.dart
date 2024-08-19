import 'dart:async';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fraudulent/partTime/ratig.dart';
import 'package:fraudulent/warning.dart';

import 'auth/login.dart';
import 'global/maptest.dart';
import 'global/packages.dart';
import 'mainSection/babysitter.dart';
import 'mainSection/derivers.dart';
import 'mainSection/details.dart';
import 'mainSection/menu.dart';
import 'mainSection/savedProfiles.dart';
import 'mainSection/search.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: login6()),
      ),
    );
  }
}

final user_image =
    "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXxlbnwwfHwwfHx8MA%3D%3D";

List banners = [
  "https://www.business2community.com/wp-content/uploads/2021/04/img_60785f56a0839.jpg",
  "https://img.freepik.com/free-vector/natural-skin-care-product-banner_33099-1944.jpg",
  "https://info.zimmercommunications.com/hubfs/why-does-mcdonalds-continue-to-advertise%20%20.jpg"
];

class MainSectionState extends StatefulWidget {
  const MainSectionState({super.key});

  @override
  State<MainSectionState> createState() => MainSectionStateState();
}

class MainSectionStateState extends State<MainSectionState> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? Home()
          : _selectedIndex == 1
              ? Search()
              : _selectedIndex == 2
                  ? SavedProfiles()
                  : Menu(),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(LineIcons.home),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(LineIcons.search),
            title: Text('Search'),
          ),
          FlashyTabBarItem(
            icon: Icon(LineIcons.bookmark),
            title: Text('Saved'),
          ),
          FlashyTabBarItem(
            icon: Icon(LineIcons.user),
            title: Text('Profile'),
          ),
        ],
      ),
      backgroundColor: Color(0xffFAFAFA),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      _showRatingDialog(context);
    });
    super.initState();
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Take This Survey'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please rate the quality of service from the institute:'),
              SizedBox(height: 16.0),
              RatingWidget(),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
                _showThankYouDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank You!'),
          content: Text(
              'Thank you for your rating. You have earned ₹35 in your wallet.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the thank you dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // top bar
                      SizedBox(
                        height: 42,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                user_image,
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            w(w: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                mdm(text: "Good Morning", size: 13),
                                smi(text: "Jakob", size: 16)
                              ],
                            ),
                            Spacer(),
                            iconBox(icon: LineIcons.bell, h: 40, w: 40),
                            w(w: 10),
                            iconBox(
                                icon: Icons.support_agent_outlined,
                                h: 40,
                                w: 40)
                          ],
                        ),
                      )
                      //  top bar

                      ,
                      h(h: 20),
                      Bounce(
                        onTap: () {
                          toScreen(context: context, page: LocationScreen());
                        },
                        child: round(
                            color: bg,
                            h: 50,
                            w: double.infinity,
                            widget: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  rglr(
                                      text: "📍 KPHB , Lulu Mall , 500075",
                                      size: 14,
                                      color: dark.withOpacity(0.7)),
                                  Icon(
                                    LucideIcons.navigation,
                                    color: Colors.lightBlueAccent,
                                    size: 20,
                                  )
                                ],
                              ),
                            )),
                      ),

                      h(h: 20),
                      ImageSlider(banners: banners),
                    ],
                  ),
                ),
              )
              //  secon half----------------------------------->>>>>>
              ,
              h(h: 20),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Color(0xffE77706),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(7),
                            topRight: Radius.circular(7))),
                  ),
                  w(w: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bld(text: "Best Picks", size: 18),
                      mdm(
                          text: "Near to your Location",
                          size: 15,
                          color: dark.withOpacity(0.5)),
                      // RatingWidget()
                    ],
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        smi(
                            text: "See all",
                            size: 14,
                            color: Color(0xffE77706)),
                        Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: Color(0xffE77706),
                        )
                      ],
                    ),
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: lev_two, width: 1.5)),
                  ),
                  w(w: 10),
                ],
              ),
              h(h: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: 190,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: profiles.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Bounce(
                            onTap: () {
                              toScreen(
                                  context: context,
                                  page: MaidDetails(
                                    data: profiles[i],
                                  ));
                            },
                            child: profile_card(profiles[i])),
                      );
                    },
                  ),
                ),
              ),
              h(h: 20),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 15,
                    decoration: BoxDecoration(
                        color: lev_one,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(7),
                            topRight: Radius.circular(7))),
                  ),
                  w(w: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bld(text: "Your Recent's", size: 18),
                      mdm(
                          text: "From your search histroy",
                          size: 15,
                          color: dark.withOpacity(0.5))
                    ],
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        smi(text: "See all", size: 14, color: lev_one),
                        Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: lev_one,
                        )
                      ],
                    ),
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: lev_two, width: 1.5)),
                  ),
                  w(w: 10),
                ],
              ),
              h(h: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: 190,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: recents.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: profile_card(recents[i]),
                      );
                    },
                  ),
                ),
              ),
              h(h: 20)
            ],
          ),
        ),
      ),
    );
  }
}

Widget profile_card(Map<String, dynamic> job) {
  return Stack(
    children: [
      Container(
        height: 190,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(job['imageUrl']),
                ),
              ),
            ),
            smi(text: job['title'], size: 12),
            rglr(
                text: '${job['applicants']} people applied',
                size: 12,
                color: dark.withOpacity(0.7)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                if (index < (job['applicants'] / 200).floor()) {
                  return Icon(Icons.star, color: Colors.black, size: 14);
                } else if (index == (job['applicants'] / 200).floor() &&
                    (job['applicants'] % 200) >= 100) {
                  return Icon(Icons.star_half, color: Colors.black, size: 14);
                } else {
                  return Icon(Icons.star_border, color: Colors.grey, size: 14);
                }
              }),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: white,
          border: Border.all(color: lev_two, width: 1.5),
        ),
      ),
    ],
  );
}

final List<Map<String, dynamic>> profiles = [
  {
    'title': 'Software ',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1542744095-fcf48d80b0fd', // Unsplash
  },
  {
    'title': 'Graphic Designer',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1527689368864-3a821dbccc34', // Unsplash
  },
  {
    'title': 'Product Manager',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1551836022-d5d88e9218df', // Unsplash
  },
  {
    'title': 'Data Scientist',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1519389950473-47ba0277781c', // Unsplash
  },
  {
    'title': 'Marketing Specialist',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1581092334497-f97272c0fe64', // Unsplash
  },
  {
    'title': 'Sales Executive',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1565728744381-225c5f633849', // Unsplash
  },
  {
    'title': 'HR Manager',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e', // Unsplash
  },
  {
    'title': 'Business Analyst',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1573164574391-4e0484c2f87d', // Unsplash
  },
];

final List<Map<String, dynamic>> recents = [
  {
    'title': 'Customer Support',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1582719478250-60eb42a2184d', // Unsplash
  },
  {
    'title': 'UX/UI Designer',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1515165562838-58a14dd5746f', // Unsplash
  },
  {
    'title': 'Backend Developer',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1504384308090-c894fdcc538d', // Unsplash
  },
  {
    'title': 'Mobile Developer',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1501843508755-af0829d48620', // Unsplash
  },
  {
    'title': 'Network Engineer',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1581093448798-5ce4e3edb64d', // Unsplash
  },
  {
    'title': 'DevOps Engineer',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1551836022-d5d88e9218df', // Unsplash
  },
  {
    'title': 'System Administrator',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1527689368864-3a821dbccc34', // Unsplash
  },
  {
    'title': 'QA Tester',
    'applicants': Random().nextInt(1000),
    'imageUrl':
        'https://images.unsplash.com/photo-1542744095-fcf48d80b0fd', // Unsplash
  },
];

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Employer',
      'text':
          'You have done well. I would like to invite you to join our premium group.'
    },
    {'sender': 'Worker', 'text': 'What is the premium group about?'},
    {
      'sender': 'Employer',
      'text':
          'In the premium group, you will get access to exclusive projects and opportunities to earn more.'
    },
    {'sender': 'Worker', 'text': 'That sounds interesting! How can I join?'},
    {
      'sender': 'Employer',
      'text':
          'I will send you an invitation. Once you accept, you will be a part of the premium group and start earning more immediately.'
    },
    {'sender': 'Worker', 'text': 'What kind of projects will I be working on?'},
    {
      'sender': 'Employer',
      'text':
          'You will be working on high-priority projects that require advanced skills. These projects are often time-sensitive and highly rewarding.'
    },
    {
      'sender': 'Worker',
      'text': 'Will there be any additional training or resources provided?'
    },
    {
      'sender': 'Employer',
      'text':
          'Yes, you will have access to exclusive training materials, webinars, and one-on-one mentoring sessions to help you excel.'
    },
    {'sender': 'Worker', 'text': 'How often are new projects assigned?'},
    {
      'sender': 'Employer',
      'text':
          'New projects are assigned on a weekly basis, depending on your availability and performance.'
    },
    {
      'sender': 'Worker',
      'text': 'What are the payment terms for these premium projects?'
    },
    {
      'sender': 'Employer',
      'text':
          'Payments are made on a per-project basis, with higher rates than our regular projects. You can expect to earn significantly more.'
    },
    {
      'sender': 'Worker',
      'text':
          'Is there any contract or commitment required to join the premium group?'
    },
    {
      'sender': 'Employer',
      'text':
          'No long-term commitment is required. However, we do expect a high level of professionalism and dedication to the projects you undertake.'
    },
    {
      'sender': 'Worker',
      'text':
          'Thank you for the information. I am excited to join the premium group and start working on these projects.'
    },
    {
      'sender': 'Employer',
      'text':
          'Great! I will send over the invitation now. Welcome to the premium group!',
    },
    {
      'sender': 'Employer',
      'text': 'https://web.whatsapp.com/prmiumgroup',
      'isLink': true
    },
  ];

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> displayedMessages = [];
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _startMessageDisplay();
    _flutterTts.setCompletionHandler(() {
      if (displayedMessages.length < messages.length) {
        _startMessageDisplay();
      } else {
        setState(() {
          _isSpeaking = false;
        });
      }
    });
  }

  void _startMessageDisplay() {
    Timer(Duration(seconds: 1), () {
      if (displayedMessages.length < messages.length) {
        setState(() {
          displayedMessages.add(messages[displayedMessages.length]);
        });
        _scrollToBottom();
        _speakCurrentMessage();
      }
    });
  }

  void _speakCurrentMessage() async {
    if (displayedMessages.isNotEmpty) {
      setState(() {
        _isSpeaking = true;
      });
      await _flutterTts.speak(displayedMessages.last['text'] ?? '');
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void showProcessingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProcessingDialog();
      },
    );

    Timer(Duration(seconds: 3), () {
      Navigator.pop(context); // Close the dialog
      showSuccessDialog(context);
    });
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessDialog();
      },
    );

    Timer(Duration(seconds: 4), () {
      Navigator.pop(context); // Close the success dialog
      showSuccessDialogssss(context);
    });
  }

  void showSuccessDialogssss(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Warningggg();
      },
    );

    Timer(Duration(seconds: 4), () {
      Navigator.pop(context); // Close the success dialog
      showBottomSheet(context);
    });
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return BottomSheetContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/1.jpg'), // Random profile image
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Employer', style: TextStyle(fontSize: 18)),
                  Text('online', style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: displayedMessages.length,
                itemBuilder: (context, index) {
                  final message = displayedMessages[index];
                  final isEmployer = message['sender'] == 'Employer';
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Align(
                      alignment: isEmployer
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              isEmployer ? Colors.teal[100] : Colors.green[100],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: isEmployer
                                ? Radius.circular(0)
                                : Radius.circular(10),
                            bottomRight: isEmployer
                                ? Radius.circular(10)
                                : Radius.circular(0),
                          ),
                        ),
                        child: message['isLink'] == true
                            ? GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Information'),
                                        content: Text(
                                            'To Join this group you will have to pay 25000/- upfront'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              showProcessingDialog(context);
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  message['text'] ?? '',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            : Text(message['text'] ?? ''),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Handle send message
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProcessingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Processing your payment...'),
        ],
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 60),
          SizedBox(height: 20),
          Text(
              'Your payment was successful.\n\nPlease wait for further notice...'),
        ],
      ),
    );
  }
}

class Warningggg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cancel, color: Colors.red, size: 60),
          SizedBox(height: 20),
          Text(
              'After paying money,they will block you and they will not respond to you!'),
        ],
      ),
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  void showProcessingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProcessingDialog();
      },
    );

    Timer(Duration(seconds: 3), () {
      Navigator.pop(context); // Close the dialog
      showFinalSuccessDialog(context);
    });
  }

  void showFinalSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Online earnings\n\nఎక్కడైనా ఉద్యోగం చేస్తే డబ్బులు మనకి వస్తాయి,కానీ డబ్బులు మనం డిపాజిట్ చేసేవి ఫేక్. దయచేసి మోసపోకండి',
            style: TextStyle(
                fontSize: 16, color: Colors.red, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScamWarningScreen(),
                ),
              );
              // Navigator.pop(context); // Close the bottom sheet
            },
            child: Text('End Simulation'),
          ),
        ],
      ),
    );
  }
}
