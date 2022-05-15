import 'package:flutter/material.dart';

class Kullanici {
  final String id;
  final String kullaniciAdi;
  final String kullaniciSoyAdi;
  final String kullanicitamAdi;
  final String avatarUrl;
  final String arkaPlanFotografUrl;
  final String email;
  final String sifre;
  final String konum;
  final int bagis;

  /// mama yardimi, seviye, bagis, fotograflar sayilarini tutmak icin

  Kullanici({
    @required this.id,
    this.kullaniciAdi,
    this.kullaniciSoyAdi,
    this.kullanicitamAdi,
    this.avatarUrl,
    this.arkaPlanFotografUrl,
    this.email,
    this.sifre,
    this.konum,
    this.bagis,
  });

  factory Kullanici.fromJson(Map<String, dynamic> json) {
    return Kullanici(
      id: json['id'] as String,
      kullaniciAdi: json['kullaniciAdi'] as String,
      kullaniciSoyAdi: json['kullaniciSoyAdi'] as String,
      kullanicitamAdi: json['kullanicitamAdi'] as String,
      avatarUrl: json['avatarUrl'] as String,
      arkaPlanFotografUrl: json['arkaPlanFotografUrl'] as String,
      email: json['email'] as String,
      sifre: json['sifre'] as String,
      konum: json['konum'] as String,
    );
  }

  // email doğrulama linki gönder

  sendEmailVerification() {
    // User.sendEmailVerification();
  }

/*  factory Kullanici.firebasedenUret(User kullanici) {
    return Kullanici(
      id: kullanici.uid,
      kullaniciAdi: kullanici.displayName,
      avatarUrl: kullanici.photoURL,
      email: kullanici.email,
    );
  }*/

/*  /// FireStore'dan döküman okuyarak Bir kullanıcı Oluşturur. Bu kullanıcı yerelde kullanılmak için Oluşturulur.
  factory Kullanici.dokumandanUret(DocumentSnapshot doc) {
    return Kullanici(
      id: doc.id,
      kullaniciAdi: doc['kullaniciAdi'],
      kullaniciSoyAdi: doc['kullaniciSoyadi'],
      kullanicitamAdi: doc['kullanicitamAdi'],
      email: doc['email'],
      bagis: doc['bagis'],
      avatarUrl: doc['avatarUrl'],
      arkaPlanFotografUrl: doc['arkaPlanFotografUrl'],
      konum: doc['konum'],
    );
  }*/
}
