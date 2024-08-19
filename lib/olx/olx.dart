import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fraudulent/warning.dart';

class OLXScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Maruti Suzuki Swift 2020',
      'actualPrice': '₹7,50,000',
      'offerPrice': '₹6,70,000',
      'imageUrl':
          'https://imgs.search.brave.com/rgQ8xdANRp_QjEtvg_ocJ8fWSh8zkP3Jv6SAoABvKN8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90ZWph/OC5rdWlrci5jb20v/aTUvMjAyNDA2MDkv/UmVkLTIwMTUtTWFy/dXRpLVN1enVraS1T/d2lmdC1aREktLS0t/LTEzMDAwMC1rbXMt/ZHJpdmVuLWluLUtL/LU5hZ2FyLWFrX0xX/QlA5NjY3OTMyNTIt/MTcxNzk0MDgxNV9n/di5qcGVn',
      'location': '7km away',
      'condition': 'Well Maintained',
      'description':
          'Maruti Suzuki Swift 2020 in excellent condition with low mileage. A compact car that is perfect for city driving.',
    },
    {
      'title': 'Royal Enfield Classic 350',
      'actualPrice': '₹1,80,000',
      'offerPrice': '₹1,50,000',
      'imageUrl':
          'https://imgs.search.brave.com/feJsrM_qc-fjQA3y9F47ofNtaWfB_VRaQ4M77exDmz8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4x/LmFjZWRtcy5jb20v/dzU2MC1oMzI1L3Bo/b3Rvcy9saXN0aW5n/LzIwMjItMDctMDEv/MTU1MjI0NjEzN2E3/MzM0NjU4ZmRlMzc3/OTg3NzViZTZfbGFy/Z2UuanBnLndlYnA',
      'location': '5km away',
      'condition': 'Well Maintained',
      'description':
          'Royal Enfield Classic 350 with low mileage and a pristine condition. Perfect for long rides and city commutes.',
    },
    {
      'title': 'Yamaha R15 V3',
      'actualPrice': '₹1,60,000',
      'offerPrice': '₹1,40,000',
      'imageUrl':
          'https://imgs.search.brave.com/anTyl0Sc4J1A-0dUnMM8Kddky2mvif8B-xGpCz3xo2w/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4x/LmFjZWRtcy5jb20v/dXBsb2Fkcy9jYXRl/Z29yeS9ZYW1haGEv/MjAyMTEwMjkwOTI1/MjYwMDAwMDAtNjA2/MzE5MjQ1NDc2ODcy/NjAxNy5qcGc',
      'location': '10km away',
      'condition': 'Brand New',
      'description':
          'Yamaha R15 V3, barely used, with an aggressive design and powerful performance. A dream bike for speed lovers.',
    },
    {
      'title': 'Honda City 2019',
      'actualPrice': '₹10,00,000',
      'offerPrice': '₹8,50,000',
      'imageUrl':
          'https://imgs.search.brave.com/WgkMfOjs_gwBrca2NTghDvI5B26tPi57zXYl-LCLG5o/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90ZWph/OC5rdWlrci5jb20v/aTUvMjAyNDA2MzAv/V2hpdGUtMjAxNi1I/b25kYS1DaXR5LVNW/LU1ULVBFVFJPTC0t/LTMzMzcxLWttcy1k/cml2ZW4taW4tYWtf/TFdCUDEwMDkzOTY1/NTgtMTcxOTcxMzMx/NV9ndi5qcGVn',
      'location': '15km away',
      'condition': 'Like New',
      'description':
          'Honda City 2019 model with all the latest features and a smooth driving experience. A perfect family car.',
    },
    {
      'title': 'iPhone 13 Pro Max',
      'actualPrice': '₹1,30,000',
      'offerPrice': '₹1,10,000',
      'imageUrl':
          'https://imgs.search.brave.com/fh9SDFY0gC8_uDrUq7inkspbiSo0o6bn85MUtkftbGA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hcG9s/bG8ub2x4LmluL3Yx/L2ZpbGVzL2t2bHho/aTNwNnZidTMtSU4v/aW1hZ2U7cz0yNzJ4/MA',
      'location': '3km away',
      'condition': 'Like New',
      'description':
          'iPhone 13 Pro Max with all accessories and original box. No scratches or dents, works perfectly.',
    },
    {
      'title': 'Samsung Galaxy S22 Ultra',
      'actualPrice': '₹1,20,000',
      'offerPrice': '₹95,000',
      'imageUrl':
          'https://imgs.search.brave.com/oPPOjKiA6bM97zhoaxRvq8ZrwafTaUdAHQ6LHQ5E5WM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hcG9s/bG8ub2x4LmluL3Yx/L2ZpbGVzL3dzaGF1/NWtjdDl0MzMtSU4v/aW1hZ2U7cz0yNzJ4/MA',
      'location': '4km away',
      'condition': 'Brand New',
      'description':
          'Samsung Galaxy S22 Ultra, unused, with all original accessories. Latest model with incredible camera features.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chennai, India'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ProductCard(item: items[index]);
            },
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> item;

  ProductCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(item: item),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  item['imageUrl'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        item['actualPrice'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        item['offerPrice'],
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    item['condition'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
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

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  ProductDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return returnsssss(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(item['imageUrl']),
                SizedBox(height: 16),
                Text(
                  item['title'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      item['actualPrice'],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      item['offerPrice'],
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 20),
                    SizedBox(width: 4),
                    Text(item['location'], style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 8),
                Text(item['condition'], style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Divider(),
                Text(
                  'Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  item['description'],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Divider(),
                Text(
                  'Additional Information:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '• Type: ${item['title'].contains('Phone') ? 'Phone' : item['title'].contains('Bike') ? 'Bike' : 'Car'}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• Condition: ${item['condition']}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• Warranty: 6 months from the purchase date',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• Return Policy: 15 days return policy, no questions asked',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• Seller: Verified Seller with a 4.5-star rating',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Divider(),
                Text(
                  'Customer Reviews:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                _buildReview(
                    "John Doe", "Great product, exactly as described!", 5),
                _buildReview(
                    "Jane Smith", "Very satisfied with my purchase.", 4),
                _buildReview("Sam Wilson", "Good value for money.", 4),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                    // Add functionality to handle the offer
                  },
                  child: Center(
                    child:
                        Text('Make an Offer', style: TextStyle(fontSize: 18)),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReview(String userName, String review, int rating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: List.generate(
            rating,
            (index) => Icon(Icons.star, size: 20, color: Colors.orange),
          ),
        ),
        Text(
          review,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Seller',
      'text':
          'Hello! I see you are interested in the latest model of the product.'
    },
    {'sender': 'Buyer', 'text': 'Yes, I am. Is it still available?'},
    {
      'sender': 'Seller',
      'text':
          'Absolutely! It’s the best model out there, barely used, and in perfect condition. A steal for the price!'
    },
    {
      'sender': 'Buyer',
      'text': 'That sounds good. I’ve been looking for a good deal.'
    },
    {
      'sender': 'Seller',
      'text':
          'You won’t find a better deal than this. Only ₹50,000, and I’ll even include a free case and screen protector!'
    },
    {
      'sender': 'Buyer',
      'text': 'Okay, I’m convinced. Let me make the payment.'
    },
    {'sender': 'Seller', 'text': 'Great! I’ll send the payment link.'},
    {
      'sender': 'Seller',
      'text': 'Payment Link: Click below to pay',
      'isPayment': true,
      'amount': '₹50,000'
    },
    {
      'sender': 'Buyer',
      'text':
          'I’ve made the payment. Please send the phone as soon as possible.'
    },
    {
      'sender': 'Seller',
      'text': 'Here are the photos of the package being prepared and shipped.',
      'isImage': true,
      'imageUrl':
          'https://www.wikihow.com/images/thumb/6/64/Drive-in-India-Step-1.jpg/v4-460px-Drive-in-India-Step-1.jpg.webp'
    },
    {
      'sender': 'Seller',
      'text':
          'The package is on its way! Here’s another photo for your reference.',
      'isImage': true,
      'imageUrl':
          'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202301/delhi-accident-1200_2-sixteen_nine.jpg?size=1280:720'
    },
    {
      'sender': 'Seller',
      'text': 'Here are the photos of the package being prepared and shipped.',
      'isImage': true,
      'imageUrl':
          'https://www.wikihow.com/images/thumb/6/64/Drive-in-India-Step-1.jpg/v4-460px-Drive-in-India-Step-1.jpg.webp'
    },
    {
      'sender': 'Seller',
      'text':
          'The package is on its way! Here’s another photo for your reference.',
      'isImage': true,
      'imageUrl':
          'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202301/delhi-accident-1200_2-sixteen_nine.jpg?size=1280:720'
    },
    {
      'sender': 'Seller',
      'text':
          'Shipping Confirmation: Here’s the tracking number. It should arrive soon.'
    },
    {'sender': 'Buyer', 'text': 'Thanks! I’ll keep an eye out for it.'},
    {
      'sender': 'Buyer',
      'text': 'It’s been a few days, and I haven’t received the phone yet.'
    },
    {
      'sender': 'Seller',
      'text':
          'Oh, I just received a call from customs. They’ve held the package and need an additional ₹15,000 to release it. This is just a formality, don’t worry.'
    },
    {'sender': 'Buyer', 'text': 'Are you sure?'},
    {
      'sender': 'Seller',
      'text':
          'Absolutely. Once you pay, the product will be on its way to you immediately.'
    },
    {'sender': 'Buyer', 'text': 'Okay, I’ll pay the amount now.'},
    {
      'sender': 'Seller',
      'text': 'Payment Link: Click below to pay',
      'isPayment': true,
      'amount': '₹15,000'
    },
    {
      'sender': 'Buyer',
      'text': 'I’ve paid it. Please let me know when it’s released.'
    },
    {
      'sender': 'Buyer',
      'text':
          'I’ve been trying to call you, but you aren’t picking up. Where’s the product?'
    },
    {'sender': 'Seller', 'text': '...'},
    {'sender': 'System', 'text': 'Call Ended', 'isEndCall': true},
    {'sender': 'System', 'text': 'Call Ended', 'isEndCall': true},
    {'sender': 'Buyer', 'text': 'Hello?'},
    {'sender': 'Buyer', 'text': 'I’m going to report this. You’ve scammed me!'},
    {'sender': 'System', 'text': 'Call Ended', 'isEndCall': true},
  ];

  final TextEditingController _controller = TextEditingController();
  late ScrollController _scrollController;
  final FlutterTts _flutterTts = FlutterTts();
  int currentMessageIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _playMessages());
  }

  Future<void> _playMessages() async {
    for (var i = 0; i < messages.length; i++) {
      setState(() {
        currentMessageIndex = i;
      });
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      await _speakMessage(messages[i]['text'], i % 2 == 0);
      await Future.delayed(Duration(seconds: 1)); // Pause between messages
    }
    _showScamAlert();
  }

  Future<void> _speakMessage(String message, bool isMaleVoice) async {
    await _flutterTts.setVoice(isMaleVoice
        ? {"name": "en-us-x-iol-local", "locale": "en-US"}
        : {"name": "en-us-x-sfg-local", "locale": "en-US"});
    await _flutterTts.speak(message);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _flutterTts.stop();
    super.dispose();
  }

  void _showScamAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('It\'s a Scam'),
          content: Text(
              'ఫేక్ ఆప్స్ ద్వారా ఆన్ లైన్ లో తక్కువకి వస్తుంది అని చూపిన వస్తువుల్ని కొనడానికి వెళ్ళకండి, ఫిజికల్ గా చూసిన తరువాతనే కొనండి'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
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
                    'https://randomuser.me/api/portraits/men/1.jpg'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Seller', style: TextStyle(fontSize: 18)),
                  Text('online', style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/d.png',
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: messages.map((message) {
                        final isSeller = message['sender'] == 'Seller';
                        final index = messages.indexOf(message);
                        return Align(
                          alignment: isSeller
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: isSeller
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: [
                              if (index <= currentMessageIndex)
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: isSeller
                                        ? Colors.teal[100]
                                        : Colors.green[100],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(message['text'] ?? ''),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.attach_file), onPressed: () {}),
                      IconButton(
                          icon: Icon(Icons.camera_alt), onPressed: () {}),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Type a message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            setState(() {
                              messages.add({
                                'sender': 'Buyer',
                                'text': _controller.text,
                              });
                            });
                            _controller.clear();
                            Timer(Duration(milliseconds: 300), () {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
