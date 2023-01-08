// ye maine makeup me se code write kiya h.
// image color picker, but maine google search color image se nikala h color.
// https://docs.flutter.dev/development/ui/widgets/basics
// this docs eassy.

import 'package:flutter/material.dart';

import 'image_tile.dart';

// key
// if you r remove flutter lint then can't get any const or lowerCamelcase error.
const PRIMARY = "primary";
const WHITE = "White";
const RED = "red";
const SECONDARY = "secondary";
const Grey = "grey";

const Map<String, Color> myColors = {
  PRIMARY: Color(0xffFE036A),
  WHITE: Colors.white,
  SECONDARY: Color(0xFFFF80AB),
  Grey: Colors.grey,
  //RED: Colors.red , iski zarurat nhi.
};

var priceTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  // void dispose() {
  // jab screen band hota ha mtlb ke ye page sy haat ta ha to yaha pr kiss e chz ko stop krwana
  // hua to yaha krte hai

  // super.dispose();
  //}

  // @override
  // void initState() {
  //   // phle he bar me jo chiz load krna hua usk eliye use krte ha ye function ko

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          // _myAppBar ( _ this means was a private code ).
          _myAppBar(),
      backgroundColor: myColors[PRIMARY],
      body: _Body(),
    );
  }
}

dynamic _myAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      backgroundColor: myColors[WHITE],
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15),
        // EdgeInsets.only
        child: IconButton(
          icon: const Icon(Icons.menu),
          color: myColors[PRIMARY],

          iconSize: 30,

          // ignore: avoid_print
          onPressed: () => print("Menu pressed"),
          // onPressed: () => print{"Menu pressed"}, aise nhi hua
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: IconButton(
            // onPressed: () => print("Search pressed"),
            icon: Icon(
              Icons.search,
              color: myColors[PRIMARY],
              // ignore: avoid_print
              size: 30,
            ),
            // ignore: avoid_print
            onPressed: () => print("Search pressed"),
          ),
        )
      ],
    ),
  );
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // Flex, if you don't know in advance if you want a horizontal or vertical arrangement.
          flex: 7,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: myColors[WHITE],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    'Cosmetics that Everyone loves!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                    // letterSpacing spelling to farak krna.
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                Expanded(
                  child:
                      // LayoutBuilder islye diya h maine or bhi image fit krni h isse dene se original dikhta h ( framework call).
                      LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      // ye icon ka kam row ke ander hua h or ye favorite (heart icon h).
                      children: [
                        ImageTile(
                          height: constraints.maxHeight * .85,
                          imagePath: 'assets/images/makeup1.png',
                          addCallback: () => print("Main item added"),
                          favouritecallback: () =>
                              print("Main item favourited"),
                          price: 15.00,
                        ),
                        Column(
                          children: [
                            ImageTile(
                              height: constraints.maxHeight * .37,
                              imagePath: 'assets/images/makeup2.png',
                              addCallback: () => print("2nd item added"),
                              favouritecallback: () =>
                                  print("2nd item favourited"),
                              price: 75.00,
                            ),
                            SizedBox(height: 8),
                            ImageTile(
                              height: constraints.maxHeight * .37,
                              imagePath: 'assets/images/makeup3.png',
                              addCallback: () => print("3rd item added"),
                              favouritecallback: () =>
                                  print("3rd item favourited"),
                              price: 55.00,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    );
                  }),
                )
              ],
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 12, top: 12, left: 40, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended',
                        style: TextStyle(
                            color: myColors[WHITE],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () => print("Recommended pressed"),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_forward,
                              color: myColors[PRIMARY],
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => Stack(
                      children: [
                        Positioned(
                          right: 15,
                          child: Container(
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.8,
                            decoration: BoxDecoration(
                              color: myColors[WHITE],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: Container(
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.84,
                            child: Row(
                              children: [
                                Container(
                                  height: constraints.maxHeight * 0.8,
                                  width: constraints.maxWidth * .24,
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/makeup4.png'),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: constraints.maxWidth * .40,
                                      child: Text(
                                        'Multi shades many options available',
                                        style: TextStyle(
                                          color: myColors[Grey],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Container(
                                      child: Text(
                                        '\$75.00',
                                        style: priceTextStyle,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    FavoriteButton(
                                      favoriteCallback: () => print(
                                        "Recommended item favorited",
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    PlusButton(
                                      addCallback: () =>
                                          print("Recommeneded item added"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({
    Key? key,
    required this.addCallback,
  }) : super(key: key);

  final Function addCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addCallback,
      child: Container(
        decoration: BoxDecoration(
          color: myColors[SECONDARY],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            Icons.add,
            color: myColors[PRIMARY],
            size: 15,
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.favoriteCallback,
  }) : super(key: key);

  final Function favoriteCallback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => favoriteCallback,
      icon: Icon(
        Icons.favorite_border,
        color: myColors[PRIMARY],
        size: 25,
      ),
    );
  }
}
