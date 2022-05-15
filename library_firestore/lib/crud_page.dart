import 'package:flutter/material.dart';

class CrudPage extends StatelessWidget {
  const CrudPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Crud İşlemleri"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Veriler",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
