import 'package:fraudulent/partTime/global/packages.dart';

Widget h({required double h}) {
  return SizedBox(
    height: h,
  );
}

Widget w({required double w}) {
  return SizedBox(
    width: w,
  );
}

dp({required mesg}) {
  return debugPrint(mesg);
}

Text rglr(
    {required String text, required double size, Color color = Colors.black}) {
  return Text(
    text,
    style: GoogleFonts.lato(
        fontWeight: FontWeight.normal, fontSize: size, color: color),
  );
}

Text mdm(
    {required String text, required double size, Color color = Colors.black}) {
  return Text(
    text,
    style: GoogleFonts.lato(
        fontWeight: FontWeight.normal, fontSize: size, color: color),
  );
}

Text smi(
    {required String text, required double size, Color color = Colors.black}) {
  return Text(
    text,
    style: GoogleFonts.lato(
        fontWeight: FontWeight.w600, fontSize: size, color: color),
  );
}

Text bld(
    {required String text, required double size, Color color = Colors.black}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold, fontSize: size, color: color),
  );
}

toScreen({required BuildContext context, required Widget page}) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

removeUntil({required BuildContext context, required Widget page}) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

replace({required BuildContext context, required Widget page}) {
  Navigator.pop(context);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

round(
    {required double h,
    required double w,
    required Widget widget,
    double radius = 10,
    Color color = lev_two}) {
  return Container(
    height: h,
    width: w,
    alignment: Alignment.center,
    child: widget,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
  );
}

iconBox(
    {required IconData icon,
    double h = 45,
    double w = 45,
    double radius = 10,
    Color color = dark,
    bool tile = false}) {
  return Container(
      height: h,
      width: w,
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: color,
      ),
      decoration: BoxDecoration(
          color: !tile ? bg : color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius)));
}

PreferredSizeWidget appbar({
  required String title,
  VoidCallback? onMenuPressed, // Optional callback for the leading icon
}) {
  return AppBar(
    title: smi(text: title, size: 15),
    centerTitle: true,
    elevation: 0.5,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    automaticallyImplyLeading: false, // No default back arrow
    leading: onMenuPressed != null
        ? IconButton(
            icon: Icon(Icons.menu),
            onPressed: onMenuPressed, // Optional menu action
          )
        : null, // No leading icon if onMenuPressed is not provided
  );
}

PreferredSizeWidget topBar({required String title, bool center = true}) {
  return AppBar(
    title: smi(size: 16, text: title),
    centerTitle: center,
    elevation: 1,
    backgroundColor: white,
    iconTheme: IconThemeData(color: dark),
    // leading: IconButton(onPressed: (), icon: icon),
  );
}

class ImageSlider extends StatefulWidget {
  final List banners;

  ImageSlider({required this.banners});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            autoPlayCurve: Curves.linear,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 700),
            enableInfiniteScroll: true,
            enlargeCenterPage: false,
            autoPlay: true,
            height: 160.0,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.banners.map((imageUrl) {
            return Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.banners.map((url) {
              int index = widget.banners.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? white : lev_two.withOpacity(0.5),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

tile({required IconData icon, required Color color, required String title}) {
  return Column(
    children: [
      iconBox(icon: icon, color: color, tile: true),
      h(h: 5),
      smi(text: title, size: 12)
    ],
  );
}

Widget btn({required String name, double height = 50}) {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: height,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: lev_one),
    child: Text(
      name,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
  );
}

Widget plainBtn(
    {required String name,
    required double h,
    required double w,
    double radius = 10}) {
  return Container(
    alignment: Alignment.center,
    height: h,
    width: w,
    decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4))),
    child: smi(text: name, color: dark, size: 12),
  );
}
