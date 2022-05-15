import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        /*   body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //ana ekseninde yani y ekseni dikey ekranı kaplayacak kadar çocuğu genişletir yani aşağıdaki width değerleri geçersiz kaldı
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //verticalDirection: VerticalDirection
            // .up, //çocuklarını baş aşağı çevirir yani ters döndürür
            // mainAxisAlignment: MainAxisAlignment
            //     .spaceEvenly, // Kapladığı alanda çocukları dikeyde eşit şekilde dağıtır
            //  mainAxisSize: MainAxisSize.min, //Çocukları kadar alan kaplar
            children: <Widget>[
              Container(
                child: Text("1.Container"),
                color: Colors.deepOrangeAccent,
                // width: 200,
                height: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("2.Container"),
                color: Colors.blue,
                height: 100,
                //   width: 200,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("3.Container"),
                color: Colors.tealAccent,
                height: 100,
                //  width: 200,
              ),
              /* Container(
                width: double.infinity,
              ), //yatayda alabileceği tüm alanı aldırır*/
            ],
          ),
          /*child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //ana ekseninde yani x ekseni yatay ekranı kaplayacak kadar çocuğu genişletir yani aşağıdaki width değerleri geçersiz kaldı
            //verticalDirection: VerticalDirection
            // .up, //çocuklarını baş aşağı çevirir yani ters döndürür
            // mainAxisAlignment: MainAxisAlignment
            //     .spaceEvenly, // Kapladığı alanda çocukları dikeyde eşit şekilde dağıtır
            //  mainAxisSize: MainAxisSize.min, //Çocukları kadar alan kaplar
            children: <Widget>[
              Container(
                child: Text("1.Container"),
                color: Colors.deepOrangeAccent,
                width: 200,
                height: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("2.Container"),
                color: Colors.blue,
                height: 100,
                width: 200,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("3.Container"),
                color: Colors.tealAccent,
                height: 100,
                width: 200,
              ),
              /* Container(
                width: double.infinity,
              ), //yatayda alabileceği tüm alanı aldırır*/
            ],
          ),*/
        ), */
        /* body: SafeArea(
          child: Container(
            width: 400,
            height: 200,
            alignment: Alignment.center,
            margin: EdgeInsets.all(40.0),
            padding: EdgeInsets.all(56.0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.circular(36.0),
                color: Colors.white),
            child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(-0.2),
                child: Text('Mustafa Yılmaz')),
            // color: Colors.orange,
          ),
        ),*/
      ),
    );
  }
}
