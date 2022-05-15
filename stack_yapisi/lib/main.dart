import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackLesson(),
    );
  }
}

class StackLesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 350,
        //  height: 250,
        child: Stack(
          overflow: Overflow.visible, //Taşan kısmı görünü yapar
          //clipBehavior: Clip.hardEdge, //Taşma yapan kısmı keser
          //clipBehavior: Clip.none,//Kesme yapmaz
          //clipBehavior: Clip.antiAlias, //Kesme Yapar hardege gibi
          alignment: Alignment.centerLeft, //kapladığı alana göre ortalama yapar
          //fit: StackFit.expand, //çocukları sahip olduğu boyut kadar büyütür. Örneğin yukarıdaki container boyutları 150-100 bu boyutta olacak tüm cocuklar.
          fit: StackFit.loose, // Pozisyonsuz çocukları kadar yer kaplar.
          children: [
            Positioned(
              child: pembeKutu,
              bottom: -50,
              right: -50,
            ),
            maviKutu,
            Positioned(
              //Önce stack boyutu belirlenir. Bu değerler o boyuta göre gerçekleştirilir.
              child: yildiz,
              bottom: 0,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}

Widget maviKutu = Container(
  height: 200,
  width: 200,
  color: Colors.blue,
);

Widget pembeKutu = Container(
  height: 100,
  width: 100,
  color: Colors.pink,
);

Widget yildiz = Icon(
  Icons.star,
  size: 50,
  color: Colors.yellow,
);
