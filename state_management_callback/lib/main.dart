import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sehir = "Adana";

  void changeCity(String newCity) {
    setState(() {
      sehir = newCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: SolWidgetA(
              sehir: sehir,
              callback: changeCity,
            )),
            Expanded(
                child: SagWidgetA(
              sehir: sehir,
              callback: changeCity,
            ))
          ],
        ),
      ),
    );
  }
}

class SolWidgetA extends StatelessWidget {
  final String sehir;
  final Function callback;
  SolWidgetA({this.sehir, this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Text(
              'Sol Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Sehir: $sehir ',
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

class SagWidgetA extends StatelessWidget {
  final String sehir;
  final Function callback;
  SagWidgetA({this.sehir, this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(children: [
        Text(
          'SagWidget A',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB(
          sehir: sehir,
          callback: callback,
        )
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {
  final String sehir;
  final Function callback;
  SagWidgetB({this.sehir, this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: [
        Text(
          'SagWidget B',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetC(
          sehir: sehir,
          callback: callback,
        )
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  final String sehir;
  final Function callback;
  SagWidgetC({this.sehir, this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(children: [
        Text(
          'SagWidget C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Şehir: $sehir ',
          style: TextStyle(fontSize: 20),
        ),
        TextField(onChanged: (input) {
          callback(input);
        })
      ]),
    );
  }
}
