import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController kullaniciAdi = TextEditingController();
    TextEditingController sifre = TextEditingController();
    Future<void> kayit() async {
      print("1");
      var yol = "http://172.26.112.1:8080/flutterLogin/kayit.php";
      print(yol);
      print("2");
      Uri url = Uri.parse(yol);
      print("3");
      var cevap = await http.post(url,
          body: {"kullaniciAdi": kullaniciAdi.text, "parola": sifre.text});
      print("4");
      var data = jsonDecode(jsonEncode(cevap.body));
      print("5");
      if (data == "Error") {
        print("6");
        await Fluttertoast.showToast(
            msg: "This user already exist!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print("7");
        await Fluttertoast.showToast(
            msg: "Kayit Basarili",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      print("8");
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kayıt"),
          centerTitle: true,
        ),
        body: Form(
          child: Column(
            children: [
              TextField(
                controller: kullaniciAdi,
                decoration: InputDecoration(
                    icon: Icon(Icons.mail), hintText: 'Kullanici Adi'),
              ),
              TextField(
                controller: sifre,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key_sharp), hintText: 'Şifre'),
              ),
              ElevatedButton(
                onPressed: () {
                  kayit();
                },
                child: Text("Giriş"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
