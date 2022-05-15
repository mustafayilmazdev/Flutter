import 'dart:math';

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
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: yemekSayfasi(),
      ),
    );
  }
}

/*class buildBody extends StatelessWidget {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                onLongPress: () {
                  print("Yılmaz");
                },
                onPressed: () {
                  var rand = new Random();
                  corbaNo = (rand.nextInt(10) % 5) + 1;
                },
                color: Colors.yellow,
                highlightColor: Colors.blue, //tıklandığındaki rengi
                splashColor: Colors
                    .red, //nereden tıklandıysa oradan bir dalga yayıyor animasyon olarak
                child: Image.asset('assets/images/corba_$corbaNo.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Colors.yellowAccent,
                highlightColor: Colors.red,
                // hoverColor: Colors.red,
                onPressed: () {
                  var rand = new Random();
                  yemekNo = (rand.nextInt(10) % 5) + 1;
                },
                child: Image.asset('assets/images/yemek_$yemekNo.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  color: Colors.yellowAccent,
                  highlightColor: Colors.red,
                  onPressed: () {
                    var rand = new Random();
                    tatliNo = (rand.nextInt(10) % 5) + 1;
                    //print(tatliNo);
                  },
                  child: Image.asset('assets/images/tatli_$tatliNo.jpg')),
            ),
          ),
        ],
      ),
    );
  }
}*/

class yemekSayfasi extends StatefulWidget {
  @override
  _yemekSayfasiState createState() => _yemekSayfasiState();
}

class _yemekSayfasiState extends State<yemekSayfasi> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;
  List<String> corbaAdlari = [
    'Mercimek',
    'Tarhana',
    'Tavuksuyu',
    'Düğün Çorbası',
    'Yayla Çorbası'
  ];
  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasulye',
    'İçli Köfte',
    'Izgara Balık'
  ];
  List<String> tatliAdlari = [
    'Kadayıf',
    'Baklava',
    'Sütlaç',
    'Kazandibi',
    'Dondurma'
  ];

  void menuOlustur() {
    setState(() {
      int yeniTatliNo = (Random().nextInt(5) + 1);
      while (yeniTatliNo == tatliNo) {
        yeniTatliNo = (Random().nextInt(5) + 1);
      }
      corbaNo = yeniTatliNo;
      yemekNo = yeniTatliNo;
      tatliNo = yeniTatliNo;
      print(tatliNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                onLongPress: () {
                  print("Yılmaz");
                },
                onPressed: menuOlustur,
                /*() {
                  setState(() {
                    int yeniCorbaNo = Random().nextInt(5) + 1;
                    while (yeniCorbaNo == corbaNo) {
                      yeniCorbaNo = Random().nextInt(5) + 1;
                    }
                    corbaNo = yeniCorbaNo;
                    yemekNo = yeniCorbaNo;
                    tatliNo = yeniCorbaNo;
                    // var rand = new Random();
                    //  corbaNo = (rand.nextInt(5)) + 1;
                  });
                },*/
                color: Colors.yellow,
                highlightColor: Colors.blue, //tıklandığındaki rengi
                splashColor: Colors
                    .red, //nereden tıklandıysa oradan bir dalga yayıyor animasyon olarak
                child: Image.asset('assets/images/corba_$corbaNo.jpg'),
              ),
            ),
          ),
          Text(
            corbaAdlari[corbaNo - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 200,
            child: Divider(
              color: Colors.black,
              height: 5,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Colors.yellowAccent,
                highlightColor: Colors.red,
                // hoverColor: Colors.red,
                onPressed: menuOlustur,
                /*() {
                  setState(() {
                    int yeniYemekNo = (Random().nextInt(5)) + 1;
                    while (yeniYemekNo == yemekNo) {
                      yeniYemekNo = (Random().nextInt(5)) + 1;
                    }
                    corbaNo = yeniYemekNo;
                    yemekNo = yeniYemekNo;
                    tatliNo = yeniYemekNo;
                    // print("Yemek no: $yemekNo");
                    /*  yemekNo++;
                    if (yemekNo == 6) {
                      yemekNo = 1;
                    }

                    */
                    /* var rand = new Random();
                    yemekNo = (rand.nextInt(1000) % 5) + 1;*/
                  });
                },*/
                child: Image.asset('assets/images/yemek_$yemekNo.jpg'),
              ),
            ),
          ),
          Text(
            yemekAdlari[yemekNo - 1],
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            width: 200,
            child: Divider(
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  color: Colors.yellowAccent,
                  highlightColor: Colors.red,
                  onPressed: menuOlustur,
                  child: Image.asset('assets/images/tatli_$tatliNo.jpg')),
            ),
          ),
          Text(
            tatliAdlari[tatliNo - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 200,
            child: Divider(
              height: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
