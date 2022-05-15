import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:php_backend_2/araclar/fonksiyonlar_widgetlar.dart';
import 'package:php_backend_2/araclar/kenarliklar.dart';
import 'package:php_backend_2/araclar/yazi_stilleri.dart';
import 'package:php_backend_2/giris_islemleri/giris_ekrani_model.dart';
import 'package:php_backend_2/giris_islemleri/hesap_olustur.dart';
import 'package:php_backend_2/modeller/kullanici.dart';
import 'package:php_backend_2/sayfalar/anasayfa.dart';
import 'package:provider/provider.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key key}) : super(key: key);

  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  bool sifremi = true;
  bool yukleniyormu = false;
  final _signInFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _sifreGoster = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GirisEkraniModel(),
      builder: (context, _) => SafeArea(
        child: Scaffold(
          backgroundColor: FlutterColor("#314220"),
          body: Form(
            key: _signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hemen Giriş Yapın",
                  style: fontSize20renkBeyazkalinYaziharfBoslugu2(),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!EmailValidator.validate(value)) {
                      return "Lütfen Geçerli Bir Mail Adresi Giriniz!";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    hintText: "E-Mail'inizi Giriniz",
                    hintStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    errorBorder: errorKenarlik(),
                    focusedErrorBorder: focusedErrorKenarlik(),
                    enabledBorder: enabledKenarlik(),
                    focusedBorder: focusedKenarlik(),
                  ),
                ),
                Divider(
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    return validatePassword(value);
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  obscureText: _sifreGoster,
                  decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      onTap: null,
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _sifreGoster ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          _sifreGoster = !_sifreGoster;
                        });
                      },
                    ),
                    hintText: "Şifrenizi Giriniz",
                    hintStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    enabledBorder: enabledKenarlik(),
                    focusedBorder: focusedKenarlik(),
                    errorBorder: errorKenarlik(),
                    focusedErrorBorder: focusedErrorKenarlik(),
                  ),
                ),
                Divider(
                  height: 15,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 100),
                  height: 50,
                  child: ElevatedButton(
                      //sign in with email and passwo nrd
                      onPressed: () async {
                        Kullanici kullanici =
                            await Provider.of<GirisEkraniModel>(context,
                                    listen: false)
                                .girisYap(
                                    email: _emailController.text,
                                    sifre: _passwordController.text);
                        if (kullanici != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnaSayfa(
                                        kullanici: kullanici,
                                      )));
                        }
                      },
                      child: Text("Giriş Yap"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        primary: Colors.black,
                      )),
                ),
                TextButton(
                  child: Text(
                    "Bir Hesap Oluştur",
                    style: fontSize25renkBeyazAltiCiziliYazi(),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HesapOlustur(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
