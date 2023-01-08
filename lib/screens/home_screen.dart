// ye maine makeup me se code write kiya h.
// image color picker, but maine google search color image se nikala h color.
// https://docs.flutter.dev/development/ui/widgets/basics
// this docs eassy to me.
import 'package:flutter/material.dart';

import 'image_tile.dart';

// key
// if you r remove flutter lint then can't get any const or lowerCamelcase error.
const PRIMARY = "primary";
const WHITE = "White";
const RED = "red";
const SECONDARY = "secondary";

const Map<String, Color> myColors = {
  PRIMARY: Color(0xffFE036A),
  WHITE: Colors.white,
  SECONDARY: Color(0xFFFF80AB),
  //RED: Colors.red , iski zarurat nhi.
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: const _Body(),
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
  const _Body();

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
                          favoritecallback: () => print("Main item favorited"),
                          price: 15.00,
                        ),
                        Column(
                          children: [
                            ImageTile(
                              height: constraints.maxHeight * .37,
                              imagePath: 'assets/images/makeup2.png',
                              addCallback: () => print("2nd item added"),
                              favoritecallback: () =>
                                  print("2nd item favorited"),
                              price: 75.00,
                            ),
                            SizedBox(height: 8),
                            ImageTile(
                              height: constraints.maxHeight * .37,
                              imagePath: 'assets/images/makeup3.png',
                              addCallback: () => print("3rd item added"),
                              favoritecallback: () =>
                                  print("3rd item favorited"),
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
            child: Container(
                // decoration: BoxDecoration(
                // borderRadius:
                // circle krta h border ko borderradius
                // horizontal left side pura circle ho gya
                // Radius Circular 100
                // BorderRadius.horizontal(left: Radius.circular(100)),
                //   border: Border(
                //   bottom: BorderSide(color: Colors.black, width: 10)),
                // aage ka
                // color: myColors[PRIMARY]),
                )),
      ],
    );
  }
}
// 1:30 last time
