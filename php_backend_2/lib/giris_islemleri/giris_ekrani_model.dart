import 'package:flutter/cupertino.dart';
import 'package:php_backend_2/modeller/kullanici.dart';
import 'package:php_backend_2/servisler/yetkilendirme_servisi.dart';

class GirisEkraniModel extends ChangeNotifier {
  YetkilendirmeServisi _yetkilendirmeServisi = YetkilendirmeServisi();

  Future<Kullanici> girisYap({String email, String sifre}) async {
    try {
      Kullanici kullanici = await _yetkilendirmeServisi.girisYapEmailveSifreile(
          email: email, sifre: sifre);

      if (kullanici != null) {
        _yetkilendirmeServisi.aktifKullaniciID = kullanici.id;
        return kullanici;
      } else {
        return null;
      }
    } on ArgumentError catch (e) {
      print(e.message);
      return null;
    }
  }
}
