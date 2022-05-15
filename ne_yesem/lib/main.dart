import 'package:flutter/material.dart';

void main() {
  runApp(neYesem());
}

class neYesem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Bugün Ne Yesem?",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: yemekSayfasi(),
      ),
    );
  }
}

class yemekSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/corba_1.jpg'),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/yemek_1.jpg'),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/tatli_1.jpg'),
        )),
      ],
    );
  }
}
