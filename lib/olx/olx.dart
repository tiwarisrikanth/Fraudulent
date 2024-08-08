import 'package:flutter/material.dart';

class OLXScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Royal Enfield Classic 350',
      'actualPrice': '₹1,80,000',
      'offerPrice': '₹1,50,000',
      'imageUrl':
          'https://imgd.aeplcdn.com/1056x594/bw/models/royal-enfield-classic-350-redditch-series-single-channel-abs20210908093608.jpg',
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
          'https://imgd.aeplcdn.com/1056x594/bw/models/yamaha-yzf-r15-v4-std20210921024021.jpg',
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
          'https://imgd.aeplcdn.com/1056x594/n/cw/ec/44386/honda-city-right-front-three-quarter.jpeg',
      'location': '15km away',
      'condition': 'Like New',
      'description':
          'Honda City 2019 model with all the latest features and a smooth driving experience. A perfect family car.',
    },
    {
      'title': 'Maruti Suzuki Swift 2020',
      'actualPrice': '₹7,50,000',
      'offerPrice': '₹6,70,000',
      'imageUrl':
          'https://imgd.aeplcdn.com/1056x594/n/cw/ec/41519/marutisuzuki-swift-right-front-three-quarter13.jpeg',
      'location': '7km away',
      'condition': 'Well Maintained',
      'description':
          'Maruti Suzuki Swift 2020 in excellent condition with low mileage. A compact car that is perfect for city driving.',
    },
    {
      'title': 'iPhone 13 Pro Max',
      'actualPrice': '₹1,30,000',
      'offerPrice': '₹1,10,000',
      'imageUrl':
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-max-family-hero.png',
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
          'https://images.samsung.com/is/image/samsung/p6pim/in/sm-s908ezkdinu/gallery/in-galaxy-s22-ultra-s908-413722-sm-s908ezkdinu-530565257',
      'location': '4km away',
      'condition': 'Brand New',
      'description':
          'Samsung Galaxy S22 Ultra, unused, with all original accessories. Latest model with incredible camera features.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Scaffold(
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
              _buildReview("Jane Smith", "Very satisfied with my purchase.", 4),
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
                  child: Text('Make an Offer', style: TextStyle(fontSize: 18)),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
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
      'text': 'Hello! I see you are interested in the latest iPhone model.'
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
      'imageUrl': 'https://via.placeholder.com/150'
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
          'Absolutely. Once you pay, the phone will be on its way to you immediately.'
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
          'I’ve been trying to call you, but you aren’t picking up. Where’s the phone?'
    },
    {'sender': 'Seller', 'text': '...'},
    {'sender': 'System', 'text': 'Call Ended', 'isEndCall': true},
    {'sender': 'System', 'text': 'Call Ended', 'isEndCall': true},
    {'sender': 'Buyer', 'text': 'Hello?'},
    {'sender': 'Buyer', 'text': 'I’m going to report this. You’ve scammed me!'},
    {'sender': 'System', 'text': 'Call Ended', 'isEndCall': true},
  ];

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController
          .position.minScrollExtent); // Scroll to top initially
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
// User has scrolled to the end
      _showScamAlert();
    }
  }

  void _showScamAlert() {
    if (messages.isNotEmpty && messages.last['sender'] == 'System') {
// Avoid showing the dialog if the last message is from 'System'
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Alert'),
        content: Text('You have been scammed!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text('Seller', style: TextStyle(fontSize: 18)),
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
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                final isSeller = message['sender'] == 'Seller';
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Align(
                    alignment:
                        isSeller ? Alignment.centerLeft : Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: isSeller
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        message['isImage'] == true
                            ? Image.network(message['imageUrl'] ?? '',
                                width: 150, height: 150)
                            : message['isPayment'] == true
                                ? ElevatedButton(
                                    onPressed: () {
// Handle payment process
                                    },
                                    child: Text('Pay ${message['amount']}'),
                                  )
                                : message['isEndCall'] == true
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.call_end,
                                              color: Colors.red),
                                          SizedBox(width: 8),
                                          Text(message['text'] ?? '',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                        ],
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: isSeller
                                              ? Colors.teal[100]
                                              : Colors.green[100],
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: isSeller
                                                ? Radius.circular(0)
                                                : Radius.circular(10),
                                            bottomRight: isSeller
                                                ? Radius.circular(10)
                                                : Radius.circular(0),
                                          ),
                                        ),
                                        child: Text(message['text'] ?? ''),
                                      ),
                      ],
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
// Handle sending a new message
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
