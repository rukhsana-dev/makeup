import 'package:boxdecoration/screens/home_screen.dart';
import 'package:flutter/material.dart';

// ignore: unused_element
class ImageTile extends StatelessWidget {
  final double height;
  final double price;
  final Function favoritecallback;
  final Function addCallback;
  final String imagePath;
  const ImageTile({
    required this.height,
    required this.favoritecallback,
    required this.addCallback,
    required this.price,
    required this.imagePath,
  });

  @override
  // ignore: override_on_non_overriding_member

  // ye line me build ki issue ho rhi thi maine
  // convert to expression body press ki thk hogyi.
  Widget build(BuildContext context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  height: height,
                  image: AssetImage(imagePath),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: IconButton(
                      onPressed:
                          // ye maine yuhi diya h just mujhe run krte hue print dikkhe.
                          () => print('favoriteCallback'),
                      icon: Icon(
                        // ye icon ka kam row ke ander hua h or ye favorite (heart icon h).
                        Icons.favorite_border,
                        color: myColors[PRIMARY],
                        size: 25,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // ye icon ka kam row ke ander hua h.
              children: [
                Text(
                  '\$$price ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => print('addCallback'),
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
                        // ye icon ka kam row ke ander hua h.
                        Icons.add,
                        color: myColors[PRIMARY],
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      });
}
