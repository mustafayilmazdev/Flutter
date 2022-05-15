import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/constants.dart';
import 'package:yasam_beklentisi/user_data.dart';

import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //butonu iki yana yaslıyor
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                Hesap(_userData).hesaplama().round().toString(),
                style: kMetinStili,
              ))),
          Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                child: Text(
                  "GERİ DÖN",
                  style: kMetinStili,
                ),
              )),
        ],
      ),
    );
  }
}
