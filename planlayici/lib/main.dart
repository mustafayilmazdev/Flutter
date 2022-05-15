import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Günlük Planlayıcım",
            style: TextStyle(fontSize: 30, color: Colors.black38),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Yapılacaklar Listesi",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.black38,
              child: TextFormField(
                maxLines: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
