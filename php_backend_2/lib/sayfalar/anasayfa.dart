import 'package:flutter/material.dart';
import 'package:php_backend_2/modeller/kullanici.dart';

class AnaSayfa extends StatefulWidget {
  final Kullanici kullanici;

  const AnaSayfa({Key key, this.kullanici}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*   FutureBuilder(
                    future: FlutterSession().get('token'),
                    builder: (context, snapshot) {
                      return Text(
                          snapshot.hasData ? snapshot.data : 'Yukleniyor..');
                    }),*/
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 50,
                  child: Text(widget.kullanici.kullaniciAdi[0]),
                ),
                Divider(
                  height: 15,
                ),
                Text(widget.kullanici.kullanicitamAdi),
                SizedBox(
                  height: 15,
                ),
                Text(widget.kullanici.email),
                SizedBox(
                  height: 15,
                ),
                Text(widget.kullanici.konum),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
