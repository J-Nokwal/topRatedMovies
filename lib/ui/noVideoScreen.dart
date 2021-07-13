import 'package:flutter/material.dart';

class NoVideoScreen extends StatelessWidget {
  const NoVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Opps this movie don't have valid   ",
              textScaleFactor: 1.3,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              " link  for Trailer in TMBD",
              textScaleFactor: 1.3,
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.face_unlock_outlined,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
