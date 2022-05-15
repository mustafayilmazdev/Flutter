import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/state_data.dart';

void main() => runApp(
      ChangeNotifierProvider<StateData>(
        //StateData tipinde şeyler provide edecek (sağlayacak)
        create: (BuildContext context) {
          return StateData(); //StateData dan objeler yaratıp döndürecek
        },
        child: MyApp(), //Myapp e bu objeleri sağlayacak
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomePage Rebuild Oldu");
    return Scaffold(
      appBar: AppBar(
        title: Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: SolWidgetA()),
            Expanded(child: SagWidgetA())
          ],
        ),
      ),
    );
  }
}

class SolWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("SolWidgetA Rebuild Oldu");
    String sehir = Provider.of<StateData>(context).sehir;
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
  @override
  Widget build(BuildContext context) {
    print("SagWidgetA Rebuild Oldu");
    return Container(
      color: Colors.green,
      child: Column(children: [
        Text(
          'SagWidget A',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB()
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("SagWidgetB Rebuild Oldu");
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: [
        Text(
          'SagWidget B',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetC()
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("SagWidgetC Rebuild Oldu");
    // Function newCity = Provider.of<StateData>(context).newCity;
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
          'Şehir: ${Provider.of<StateData>(context).sehir} ', // Sana yayın yapan Providerlara bak ama hangi yayın ile ? <StateData> yayını yapanlara bak yukarı (context) vasıtasıyla bak ve .sehir ile degiskene ulas
          style: TextStyle(fontSize: 20),
        ),
        TextField(onChanged: (input) {
          //newCity(input);
          Provider.of<StateData>(context, listen: false).newCity(input);
        })
      ]),
    );
  }
}
