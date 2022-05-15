import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_cata/renkData.dart';
import 'package:state_management_provider_cata/sepet_sayfasi.dart';

void main() {
  // ignore: missing_required_param
  runApp(ChangeNotifierProvider<RenkData>(
      create: (BuildContext context) {
        return RenkData();
      },
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 20.0,
          title: Text(
            "Catalog",
            style: TextStyle(
                fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Builder(
              builder: (context) => FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Sepetim()));
                },
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              myListTile(
                renk: Colors.orange,
                renkAdi: "Orange",
              ),
              myListTile(
                renk: Colors.pink,
                renkAdi: "Pink",
              ),
              myListTile(
                renk: Colors.deepPurple,
                renkAdi: "Deep Purple",
              ),
              myListTile(
                renk: Colors.blue,
                renkAdi: "Blue",
              ),
              myListTile(
                renk: Colors.teal,
                renkAdi: "Teal",
              ),
              myListTile(
                renk: Colors.limeAccent,
                renkAdi: "Lime Accent",
              ),
              myListTile(
                renk: Colors.deepOrange,
                renkAdi: "Deep Orange",
              ),
              myListTile(
                renk: Colors.black45,
                renkAdi: "Black 45",
              ),
              myListTile(
                renk: Colors.green,
                renkAdi: "Green",
              ),
              myListTile(
                renk: Colors.deepOrange,
                renkAdi: "Deep Orange",
              ),
              myListTile(
                renk: Colors.amber,
                renkAdi: "Amber",
              ),
              myListTile(
                renk: Colors.blueGrey,
                renkAdi: "Blue Grey",
              ),
              myListTile(
                renk: Colors.lightBlueAccent,
                renkAdi: "Light Blue Accent",
              ),
              //Text("${Provider.of<RenkData>(context).sepet.isEmpty}"),
              //  Text(Provider.of<RenkData>(context).sepet[0]),

              Text(Provider.of<RenkData>(context).sepetOku().toString()),
            ],
          ),
        ),
      ),
    );
  }
}

class myListTile extends StatefulWidget {
  final Color renk;
  final String renkAdi;
  myListTile({this.renk = Colors.black, this.renkAdi});

  @override
  _myListTileState createState() => _myListTileState();
}

class _myListTileState extends State<myListTile> {
  bool eklemeKontrol = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.renkAdi,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      leading: Container(
        width: 50,
        height: 45,
        color: widget.renk,
      ),
      trailing: FlatButton(
          onPressed: () {
            setState(() {
              if (eklemeKontrol == false) {
                Provider.of<RenkData>(context, listen: false)
                    .sepetOlustur(widget.renkAdi);
                eklemeKontrol = true;
              } else {
                Provider.of<RenkData>(context, listen: false)
                    .sepettenCikart(widget.renkAdi);
                eklemeKontrol = false;
              }
            });
          },
          child: eklemeKontrol == false
              ? Text(
                  "ADD",
                  style: TextStyle(fontSize: 15),
                )
              : Icon(Icons.done)),
    );
  }
}
