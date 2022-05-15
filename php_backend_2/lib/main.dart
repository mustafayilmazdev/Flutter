import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:php_backend_2/giris_islemleri/giris_ekrani_view.dart';
import 'package:php_backend_2/servisler/yetkilendirme_servisi.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dynamic token = FlutterSession().get('token');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  TextEditingController kullaniciAdi = TextEditingController();
  TextEditingController sifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => YetkilendirmeServisi(),
      child: MaterialApp(
        home: GirisEkrani(),
      ),
    );
  }
}
