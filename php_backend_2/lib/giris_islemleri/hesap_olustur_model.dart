import 'package:flutter/cupertino.dart';
import 'package:php_backend_2/modeller/kullanici.dart';
import 'package:php_backend_2/servisler/yetkilendirme_servisi.dart';

class HesapOlusturModel extends ChangeNotifier {
  YetkilendirmeServisi _yetkilendirmeServisi = YetkilendirmeServisi();

  Future<void> kayitOlustur(
      {String kullaniciAdi,
      String kullaniciSoyAdi,
      String kullanicitamAdi,
      String avatarUrl,
      String arkaPlanFotografUrl,
      String email,
      String sifre,
      String konum}) async {
    Kullanici yeniKullanici = Kullanici(
      kullaniciAdi: kullaniciAdi,
      kullaniciSoyAdi: kullaniciSoyAdi,
      kullanicitamAdi: kullanicitamAdi,
      avatarUrl: avatarUrl,
      arkaPlanFotografUrl: arkaPlanFotografUrl,
      email: email,
      sifre: sifre,
      konum: konum,
    );

    await _yetkilendirmeServisi.kullaniciOlusturEmailveSifreile(
        kullanici: yeniKullanici);
  }
}
