import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Favori Filmim'),
        ),
        body: Center(
          child: Image.network(
              'https://images-na.ssl-images-amazon.com/images/I/71-b2P2qoeL._SY550_.jpg'),
        ),
      ),
    ),
  );
}
