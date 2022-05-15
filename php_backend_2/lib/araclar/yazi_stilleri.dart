//hemen giriş yap Yazı Stilleri
import 'package:flutter/material.dart';

TextStyle fontSize20renkBeyazkalinYaziharfBoslugu2() {
  return TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      letterSpacing: 2);
}

//hesabınız var mı Yazı Stilleri
TextStyle font16renkBeyaz() => TextStyle(fontSize: 16, color: Colors.white);
// mama Yazı Stilleri
TextStyle font24renkBeyazharfBoslugu15() {
  return TextStyle(
    fontSize: 24,
    color: Colors.white,
    letterSpacing: 15,
  );
}

//Sepeti Yazı Stilleri
TextStyle fontSize54renkBeyazharfBoslugu15() {
  return TextStyle(fontSize: 54, color: Colors.white, letterSpacing: 15);
}

//Bir hesap oluştur Yazı Stilleri
TextStyle fontSize25renkBeyazAltiCiziliYazi() {
  return TextStyle(
      color: Colors.white, fontSize: 25, decoration: TextDecoration.underline);
}

// profil sayisal bilgiler icerik
TextStyle font16renkSiyah() {
  return TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
}

// profil sayisal bilgiler adet
TextStyle fontSize24renkSiyah() {
  return TextStyle(
    fontSize: 24.0,
    color: Colors.black,
  );
}
