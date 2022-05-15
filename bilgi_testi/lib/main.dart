import 'package:bilgi_testi/constants.dart';
import 'package:bilgi_testi/test_veri.dart';
import 'package:flutter/material.dart';

import 'test_veri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  testVeri test_1 = new testVeri();

  void butonFonksiyonu(bool dogruluk) {
    if (test_1.testBittiMi() == true) {
      setState(() {
        bool dogruYanit = test_1.getSoruYaniti();
        if (dogruYanit == dogruluk) {
          test_1.setDogruCevapSay();
          secimler.add(kDogruIconu);
        } else {
          secimler.add(yanlisIconu);
        }
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("TEBRİKLER TESTİ TAMAMLADINIZ"),
              content:
                  new Text("Doğru cevap sayısı: ${test_1.getDogruCevapSay()}"),
              actions: [
                FlatButton(
                  onPressed: () {
                    setState(() {
                      secimler = [];
                      test_1.testiSifirla();
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text("BAŞA DÖN"),
                )
              ],
            );
          });
    } else {
      setState(() {
        bool dogruYanit = test_1.getSoruYaniti();
        if (dogruYanit == dogruluk) {
          test_1.setDogruCevapSay();
          secimler.add(kDogruIconu);
        } else {
          secimler.add(yanlisIconu);
        }
        test_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bilgi Testi Soruları',
                style: TextStyle(fontSize: 40, color: Colors.white),
              )
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: secimler,
          //alignment: WrapAlignment.end,
          spacing: 3, //yatayda boşluk açar
          runSpacing: 3, //dikeyde boşluk açar
          // direction: Axis.vertical, //Eksenini Dikey yapar.
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            butonFonksiyonu(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            butonFonksiyonu(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
