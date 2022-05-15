import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BenimUyg());
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(fontFamily: 'Parisienne'), // tüm uygulamanın font sitilini değiştirir
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: SafeArea(
          child: Center(
            //içeriği ortalamak için
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, //yatayda ortalamak için
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/A_small_cup_of_coffee.jpg'),
                  backgroundColor:
                      Colors.deepOrangeAccent, //yuvarlağın rengini verir
                  radius: 70, //dairenin büyüklüğü
                ),
                Text(
                  "Mıstık Kahvecisi",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.brown[100],
                    fontFamily: 'Parisienne',
                  ),
                ),
                Text(
                  "YOK BÖYLE BİR KAHVECİ!",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 200,
                  child: Divider(
                    height: 10,
                    color: Colors.white,
                  ),
                ),
                Card(
                  //  padding: EdgeInsets.all(5),
                  color: Colors.brown[900],
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListTile(
                      title: Text(
                        "mistik@gmail.com",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: Icon(
                        Icons.email,
                        size: 40,
                        color: Colors.white,
                      ),
                    ), /*Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'mistik@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),*/
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  //padding: EdgeInsets.all(5),
                  color: Colors.brown[900],
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: ListTile(
                      title: Text(
                        "553 668 85 72",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: Icon(
                        Icons.phone,
                        size: 40,
                        color: Colors.white,
                      ),
                    ), /*Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "553 668 85 72",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),*/
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
