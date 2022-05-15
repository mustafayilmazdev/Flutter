import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RenkData with ChangeNotifier {
  //List<Color> renk = [Colors.orange];
  // List<String> renkAdi=["Orange"];
  List<String> sepet = List<String>();

  void sepetOlustur(String renkAdi) {
    sepet.add(renkAdi);
    notifyListeners();
  }

  void sepettenCikart(String renkAdi) {
    sepet.remove(renkAdi);
    notifyListeners();
  }

  List<String> sepetOku() {
    return sepet;
    // notifyListeners();
  }
}
