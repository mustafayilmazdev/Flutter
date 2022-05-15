import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(instagram());
}

class instagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //theme: ThemeData.fallback(),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          leadingWidth: 10,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("kullaniciadi"),
          ),
        ),
        body: buildBody(),
      ),
    );
  }
}

class buildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white12,
            ),
            child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white10,
                  filled: true,
                  hoverColor: Colors.white,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white38,
                    size: 30,
                  ),
                  hintText: "Ara",
                  hintStyle: TextStyle(color: Colors.white38),
                ),
                cursorColor: Colors.white),
          ), //üst arama kısmı
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: donguileYap(),
          ),
        ],
      ),
    );
  }
}

class donguileYap extends StatefulWidget {
  @override
  _donguileYapState createState() => _donguileYapState();
}

class _donguileYapState extends State<donguileYap> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildKullanici("Mustafa Yılmaz",
            "https://instagram.fesb3-2.fna.fbcdn.net/v/t51.2885-19/s150x150/161252862_1550767995113533_2373302042667554205_n.jpg?tp=1&_nc_ht=instagram.fesb3-2.fna.fbcdn.net&_nc_ohc=Nvr92x8B3y8AX_EewM9&ccb=7-4&oh=ff0f46bba9545355eaf7ecb6bb15d7ed&oe=6085A231&_nc_sid=7bff83"),
        buildKullanici("Defne Samyeli",
            "https://www.akcagazete.com/files/uploads/news/default/6aa51-dans-tutkunu-manken.jpg"),
        buildKullanici("Mahmut Baş",
            "https://cf.kizlarsoruyor.com/q3171596/2f89bab7-2555-4ee7-ae5f-2e5bc2852c6a-m.jpg"),
        buildKullanici("Mura Kasal",
            "https://enbursa.com/galeri/2019/04/09/12663-guzel-manken-yaza-merhaba-dedi-5caca0935a57c.jpg"),
        buildKullanici("Hande Akyürek",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtSLNRSQVlfK3pkTo9FImYlRVI68vWARdjrg&usqp=CAU"),
        buildKullanici("Ayşe",
            "https://www.sporx.com/img/2019/04/22/juventus_asigi_manken_841c2_800.jpg"),
        buildKullanici("Burak Akyürek",
            "https://i.pinimg.com/originals/57/0f/d7/570fd7d7d1a519598d17ca59a41e4508.jpg"),
        buildKullanici("Luqu",
            "https://i2.milimaj.com/i/milliyet/75/750x0/5c8e62e245d2a097ac118aac"),
      ],
    );
  }

  ListTile buildKullanici(String ad, String fotograf) {
    return ListTile(
      title: Text(
        ad,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text("Mesaj içeriği...", style: TextStyle(color: Colors.white)),
      leading: CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage(fotograf),
      ),
      trailing: FlatButton(
        onPressed: () {
          print("$ad kullanıcısına tıkladın");
        },
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
    );
  }
}
