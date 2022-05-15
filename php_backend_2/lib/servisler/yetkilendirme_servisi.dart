import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:php_backend_2/modeller/kullanici.dart';

class YetkilendirmeServisi {
  String aktifKullaniciID;
  Future<void> kullaniciOlusturEmailveSifreile({Kullanici kullanici}) async {
    //print("php geldi");
    Uri url = Uri.parse("http://192.168.125.1:8080/flutterLogin/kayit.php");
    Response response = await http.post(url, body: {
      "kullaniciAdi": kullanici.kullaniciAdi,
      "kullaniciSoyAdi": kullanici.kullaniciSoyAdi,
      "kullanicitamAdi": kullanici.kullanicitamAdi,
      "avatarUrl": kullanici.avatarUrl,
      "arkaPlanFotografUrl": kullanici.arkaPlanFotografUrl,
      "email": kullanici.email,
      "sifre": kullanici.sifre,
      "konum": kullanici.konum,
    });

    ///response.body php'deki echo'ları döndürür.
    ///Hataları burada isimlendirip program içinde
    ///İsimlerine göre bilgilendirme yapılır.
    var data = jsonDecode(response.body);
    if (data == "Kullanici zaten kayitli") {
      throw ("Kullanici zaten kayitli");
    } else {
      print("basarili");
    }
  }

  Future<Kullanici> girisYapEmailveSifreile({
    String email,
    String sifre,
  }) async {
    try {
      var url = Uri.parse("192.168.125.1:8080/flutterLogin/giris.php");
      var response = await http.post(url, body: {
        "email": email,
        "sifre": sifre,
      });
      var data = jsonDecode(response.body);
      await FlutterSession().set('token', email);
      if (data != "Hata") {
        Kullanici kullanici = Kullanici.fromJson(data);
        return kullanici;
      }
    } on ArgumentError catch (e) {
      return null;
    }
  }
}
