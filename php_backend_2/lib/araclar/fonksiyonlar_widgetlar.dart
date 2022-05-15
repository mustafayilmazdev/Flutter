import 'package:flutter/material.dart';
import 'package:php_backend_2/araclar/yazi_stilleri.dart';

// sifre kriter kontrol
String validatePassword(String value) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);

  if (value.isEmpty) {
    return 'Lütfen Şifre Giriniz';
  } else {
    if (!regex.hasMatch(value))
      return 'Girilen Şifre Kriterlere Uygun Değil!';
    else
      return null;
  }
}

// Hex kod ile renklendirme yapma fonksiyonu
class FlutterColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  FlutterColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// Profil Bilgiler Mama Yardımı Seviye Bağış Fotoğraflar Paneli
class ProfilSayisalBilgilerGetir extends StatefulWidget {
  final String solBilgiIcerigi;
  final int solIcerikAdedi;
  final String sagBilgiIcerigi;
  final int sagIcerikAdedi;
  ProfilSayisalBilgilerGetir({
    this.solBilgiIcerigi = "",
    this.solIcerikAdedi = 0,
    this.sagBilgiIcerigi = "",
    this.sagIcerikAdedi = 0,
  });

  @override
  _ProfilSayisalBilgilerGetirState createState() =>
      _ProfilSayisalBilgilerGetirState();
}

class _ProfilSayisalBilgilerGetirState
    extends State<ProfilSayisalBilgilerGetir> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //54 Mama Yardımı
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              //width: double.infinity,
              child: Text(
                widget.solIcerikAdedi.toString(),
                style: fontSize24renkSiyah(),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              alignment: Alignment.center,
              width: 105,
              child: Text(
                widget.solBilgiIcerigi,
                style: font16renkSiyah(),
              ),
            ),
          ],
        ),
        //22 Seviye
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              //width: double.infinity,
              child: Text(
                widget.sagIcerikAdedi.toString(),
                style: fontSize24renkSiyah(),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              alignment: Alignment.center,
              width: 105,
              child: Text(
                widget.sagBilgiIcerigi,
                style: font16renkSiyah(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//AppBar Basliklari

class MamaSepetiAppBar extends StatelessWidget {
  final String baslik;
  final bool geriTusu;
  final bool sagGeriTusu;
  MamaSepetiAppBar(
      {this.baslik = "Baslik",
      this.geriTusu = false,
      this.sagGeriTusu = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterColor("#314220"),
      centerTitle: true,
      automaticallyImplyLeading: geriTusu,
      title: Text(
        baslik,
        style: TextStyle(color: Colors.white, fontSize: 30.0, letterSpacing: 1),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
