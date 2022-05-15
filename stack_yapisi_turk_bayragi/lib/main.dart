import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: turkBayragi(g: 200),
    );
  }
}

class turkBayragi extends StatelessWidget {
  const turkBayragi({
    Key key,
    @required this.g,
  }) : super(key: key);

  final double g;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: g * 1.5,
        height: g,
        color: Colors.red,
        child: Stack(
          children: [
            Positioned(
              top: 0.25 * g,
              left: 0.25 * g,
              child: Container(
                width: 0.5 * g,
                height: 0.5 * g,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(g / 4),
                ),
              ),
            ),
            Positioned(
              top: 0.3 * g,
              left: 0.3625 * g,
              child: Container(
                width: 0.4 * g,
                height: 0.4 * g,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(g / 4),
                ),
              ),
            ),
            Positioned(
              left: 0.7 * g,
              top: 0.375 * g,
              child: RotatedBox(
                quarterTurns: (90),
                child: Icon(
                  Icons.star,
                  size: g * 0.25,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
