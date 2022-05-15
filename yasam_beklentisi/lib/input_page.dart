import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/constants.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/user_data.dart';

import 'my_column.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = "";
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int boy = 170;
  double kilo = 65.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton("BOY", boy.ceilToDouble()),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton("KİLO", kilo),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Haftada Kaç Gün Spor Yapıyorsunuz",
                        style: kMetinStili,
                      ),
                      Text(
                        "${sporGunu.round()}",
                        style: kSayiStili,
                      ),
                      Slider(
                          divisions: 7,
                          max: 7.0,
                          min: 0.0,
                          value: sporGunu,
                          onChanged: (double newValue) {
                            setState(() {
                              sporGunu = newValue;
                            });
                          })
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Günde Kaç Sigara İçiyorsunuz",
                        style: kMetinStili,
                      ),
                      Text(
                        icilenSigara.round().toString(), //bu satır eşittir ""
                        style: kSayiStili,
                      ),
                      Slider(
                        value: icilenSigara,
                        onChanged: (double newValue) {
                          setState(() {
                            icilenSigara = newValue;
                          });
                        },
                        min: 0,
                        max: 30,
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = "KADIN";
                    });
                  },
                  renk: seciliCinsiyet == "KADIN"
                      ? Colors.purpleAccent
                      : Colors.white,
                  child: MyColumn(
                    textIconRenk: seciliCinsiyet == "KADIN"
                        ? Colors.white
                        : Colors.black54,
                    iconum: FontAwesomeIcons.venus,
                    cinsiyet: "KADIN",
                  ),
                )),
                Expanded(
                    child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = "ERKEK";
                    });
                  },
                  renk: seciliCinsiyet == "ERKEK" ? Colors.teal : Colors.white,
                  child: MyColumn(
                    textIconRenk: seciliCinsiyet == "ERKEK"
                        ? Colors.white
                        : Colors.black54,
                    cinsiyet: "ERKEK",
                    iconum: FontAwesomeIcons.mars,
                  ),
                )),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                              kilo: kilo,
                              boy: boy,
                              seciliCinsiyet: seciliCinsiyet,
                              icilenSigara: icilenSigara,
                              sporGunu: sporGunu))));
                },
                child: Text(
                  "HESAPLA",
                  style: kMetinStili,
                )),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String kriter, double sayisalKriter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            "$kriter",
            style: kMetinStili,
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            kriter == "BOY" ? "${sayisalKriter.round()}" : "$sayisalKriter",
            style: kSayiStili,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            OutlineButton(
              borderSide: BorderSide(width: 2.0, color: Colors.blue),
              onPressed: () {
                setState(() {
                  kriter == "BOY" ? boy++ : kilo += 0.5;
                });
              },
              child: Icon(
                FontAwesomeIcons.plus,
                size: 15,
              ),
            ),
            ButtonTheme(
              minWidth: 45,
              child: OutlineButton(
                  borderSide: BorderSide(width: 2.0, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      kriter == "BOY" ? boy-- : kilo -= 0.5;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 15,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
