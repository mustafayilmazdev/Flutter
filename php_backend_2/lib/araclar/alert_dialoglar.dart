import 'package:flutter/material.dart';

import 'fonksiyonlar_widgetlar.dart';

// Gonderi Sil Alert
Future<void> gonderiSilAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Gönderi Sil'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Gönderiniz başarıyla silindi.'),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

// gönderi silme hata alert
Future<void> gonderiSilHataAlert(
    BuildContext context, String hatamesaji) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Hata!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Gönderi silme sırasında bir hata oluştu. Hata mesajınız;'),
              Text(
                  "Bu hatayı Mama Sepeti Destek Ekibine bildirin: $hatamesaji"),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

// gönderi ekleme hata alert
Future<void> kullaniciAvatarDuzenleHataAlert(
    BuildContext context, String hatamesaji, String nitelik) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Hata!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                  '$nitelik güncelleme sırasında bir hata oluştu. Hata mesajınız;'),
              hatamesaji == "not-found"
                  ? Text("Kullanıcı hesabı bulunamadı")
                  : Text(
                      "Bu hatayı Mama Sepeti Destek Ekibine bildirin: $hatamesaji"),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

Future<void> kullaniciAvatarDuzenleAlert(
    BuildContext context, String nitelik) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text(
            nitelik == "Avatar" ? 'Avatar Güncelle' : 'Arka Plan Güncelle'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(nitelik == "Avatar"
                  ? 'Avatarınız başarıyla güncellendi.'
                  : 'Arka Planınız başarıyla güncellendi.'),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

RoundedRectangleBorder alertKenarlik() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  );
}

// gönderi ekleme hata alert
Future<void> gonderiEkleHataAlert(
    BuildContext context, String hatamesaji) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Hata!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Gönderi ekleme sırasında bir hata oluştu. Hata mesajınız;'),
              hatamesaji == "not-found"
                  ? Text("Kullanıcı hesabı bulunamadı")
                  : Text(
                      "Bu hatayı Mama Sepeti Destek Ekibine bildirin: $hatamesaji"),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

Future<void> gonderiEkleAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Gönderi Ekle'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Gönderiniz başarıyla eklendi.'),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

// profilBilgileriGuncellemeHataAlert
Future<void> profilBilgileriGuncellemeHataAlert(
    BuildContext context, String hatamesaji) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Hata!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                  'Profil bilgilerini güncelleme sırasında bir hata oluştu. Hata mesajınız;'),
              hatamesaji == "not-found"
                  ? Text("Kullanıcı hesabı bulunamadı")
                  : Text(
                      "Bu hatayı Mama Sepeti Destek Ekibine bildirin: $hatamesaji"),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

// profilBilgileriGuncelleAlert
Future<void> profilBilgileriGuncelleAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Profil Bilgilerini Güncelleme'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Profil bilgileriniz başarıyla güncellendi.'),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

// sifre yenileme hata alert
Future<void> sifreYenilemeHataAlert(
    BuildContext context, String hatamesaji) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Hata!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Şifre yenileme sırasında bir hata oluştu. Hata mesajınız;'),
              hatamesaji == "user-not-found"
                  ? Text("Bu E-mail'e kayıtlı bir kullanıcı bulunamadı")
                  : Text(
                      "Bu hatayı Mama Sepeti Destek Ekibine bildirin: $hatamesaji"),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

//giris yap hata alert
Future<void> girisYapHataAlert(BuildContext context, String hatamesaji) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Hata!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Giriş sırasında bir hata oluştu. Hata mesajınız;'),
              hatamesaji == "user-disabled"
                  ? Text(
                      "Verilen E-Mail'e karşılık gelen kullanıcı devre dışı bırakılmıştır.")
                  : hatamesaji == "user-not-found"
                      ? Text("Bu E-mail'e kayıtlı bir kullanıcı bulunamadı")
                      : hatamesaji == "wrong-password"
                          ? Text(
                              "Verilen E-Mail adresi için girmiş olduğunuz şifre yanlış")
                          : Text("Yakalanamayan Hata: $hatamesaji"),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

ElevatedButton okudumAnladimButon(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Text("Okudum, Anladım."),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      primary: Colors.white,
    ),
  );
}

// kayit ol hata alert
Future<void> kayitOlHataAlert(BuildContext context, String hatamesaji) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Hata!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Kayıtla ilgili bir hata oluştu. Hata mesajınız;'),
              hatamesaji == "email-already-in-use"
                  ? Text(
                      "Sağlanan e-posta zaten mevcut bir kullanıcı tarafından kullanılıyor. Her kullanıcının benzersiz bir e-postası olmalıdır.")
                  : hatamesaji == "operation-not-allowed"
                      ? Text(
                          "Sağlanan oturum açma sağlayıcısı, Bu Firebase projesi için devre dışı bırakıldı. Lütfen proje destek ekibine bildirin.")
                      : Text("Yakalanamayan Hata: $hatamesaji"),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

// sifre yenileme alert
Future<void> sifreYenilemeAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Şifre Yenileme'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                  'Şifrenizi Yenilemeniz İçin E-Mail\'inize bir link yolladık.'),
              Text('Lütfen bu linke tıklayarak şifrenizi yenileyin.'),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

// kayit ol hata alert
Future<void> kayitOlAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Onay Gerekiyor'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Giriş Onayı İçin E-Mail\'inize bir link yolladık.'),
              Text('Lütfen bu linke tıklayarak E-Mail\'inizi onaylayın.'),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}

// sifre kriter alert
Future<void> sifreKriterAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: FlutterColor("#67864A"),
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 17),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        shape: alertKenarlik(),
        title: Text('Uyarı'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Şifreniz Şunları İçermelidir!'),
              Text('En az bir büyük harf [A-Z]'),
              Text('En az bir küçük harf [a-z]'),
              Text('En az bir rakam [0-9]'),
              Text('En az bir özel karakter [!@#\$\\&*~]'),
              Text('En az 8 karakter uzunluğu [xxxxxxxx]'),
            ],
          ),
        ),
        actions: <Widget>[
          okudumAnladimButon(context),
        ],
      );
    },
  );
}
