import 'soru.dart';

class testVeri {
  int _soruIndex = 0;
  int _dogruCevapSayisi = 0;
  List<Soru> _soruBankasi = [
    new Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false),
    new Soru(
      soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
      soruYaniti: true,
    ),
    new Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false),
    new Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    new Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    new Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true),
    new Soru(
        soruMetni: 'Fransızlar 80 demek için, 4 - 20 der', soruYaniti: true),
  ];

  String getSoruMetni() {
    return this._soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return this._soruBankasi[_soruIndex].soruYaniti;
  }

  void setDogruCevapSay() {
    _dogruCevapSayisi++;
  }

  int getDogruCevapSay() {
    return _dogruCevapSayisi;
  }

  void sonrakiSoru() {
    if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  void testiSifirla() {
    _soruIndex = 0;
    _dogruCevapSayisi = 0;
  }

  bool testBittiMi() {
    return _soruIndex == _soruBankasi.length - 1 ? true : false;
  }
}
