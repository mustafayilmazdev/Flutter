import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:php_backend_2/araclar/alert_dialoglar.dart';
import 'package:php_backend_2/araclar/fonksiyonlar_widgetlar.dart';
import 'package:php_backend_2/araclar/kenarliklar.dart';
import 'package:php_backend_2/araclar/sehirler.dart';
import 'package:php_backend_2/giris_islemleri/hesap_olustur_model.dart';
import 'package:provider/provider.dart';

class HesapOlustur extends StatefulWidget {
  @override
  _HesapOlusturState createState() => _HesapOlusturState();
}

class _HesapOlusturState extends State<HesapOlustur> {
  final _formAnahtari = GlobalKey<FormState>();
  final _scaffoldAnahtari = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _kullaniciAdiCtr = TextEditingController();
  TextEditingController _kullaniciSoyAdiCtr = TextEditingController();
  String dropdownValue = "Adana";
  bool _sifreGoster = false;
  bool _sifreGosterOnay = false;
  String kullaniciAdi, email, sifre;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HesapOlusturModel>(
      create: (_) => HesapOlusturModel(),
      builder: (context, _) => SafeArea(
        child: Scaffold(
          key: _scaffoldAnahtari,
          appBar: AppBar(
            title: Text("Hesap Oluştur"),
          ),
          body: SingleChildScrollView(
              child: Container(
            height: (MediaQuery.of(context).size.height),
            color: FlutterColor("#67864A"),
            child: Form(
              key: _formAnahtari,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  //Email Alanı
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        /* textbox içine tekrar tıklandığında klavyeyi kapatır
                        onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                         if (!currentFocus.hasPrimaryFocus &&
                               currentFocus.focusedChild != null) {
                                  currentFocus.focusedChild.unfocus();
                                       }
                                           },*/
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
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.white),
                          errorBorder: errorKenarlik(),
                          focusedErrorBorder: focusedErrorKenarlik(),
                          enabledBorder: enabledKenarlik(),
                          focusedBorder: focusedKenarlik(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Şifre Alanı
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value != _passwordConfirmController.text) {
                            return "Şifreler Uyuşmuyor!";
                          } else {
                            return validatePassword(value);
                          }
                        },
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        obscureText: !_sifreGoster,
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            child: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            onTap: () {
                              sifreKriterAlert(context);
                            },
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _sifreGoster
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                _sifreGoster = !_sifreGoster;
                              });
                            },
                          ),
                          hintText: "Şifre",
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.white),
                          enabledBorder: enabledKenarlik(),
                          focusedBorder: focusedKenarlik(),
                          errorBorder: errorKenarlik(),
                          focusedErrorBorder: focusedErrorKenarlik(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Şifre Onay Alanı
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _passwordConfirmController,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return "Şifreler Uyuşmuyor!";
                          } else {
                            return validatePassword(value);
                          }
                        },
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        obscureText: !_sifreGosterOnay,
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            child: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            onTap: () {
                              sifreKriterAlert(context);
                            },
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _sifreGosterOnay
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                _sifreGosterOnay = !_sifreGosterOnay;
                              });
                            },
                          ),
                          hintText: "Şifrenizi Tekrar Giriniz. (Onay İçin)",
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.white),
                          enabledBorder: enabledKenarlik(),
                          focusedBorder: focusedKenarlik(),
                          errorBorder: errorKenarlik(),
                          focusedErrorBorder: focusedErrorKenarlik(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Şifre Kriter Bilgi
                  Text(
                    "Şifre kriterlerini görmek için lütfen kilit simgesine dokunun.",
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.white,
                  ),
                  //Kullanici Adi Alani
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _kullaniciAdiCtr,
                        validator: (value) {
                          if (value.length <= 3) {
                            return "Adınız en az üç harften oluşmalıdır.";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle_sharp,
                            color: Colors.white,
                          ),
                          hintText: "Ad",
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.white),
                          errorBorder: errorKenarlik(),
                          focusedErrorBorder: focusedErrorKenarlik(),
                          enabledBorder: enabledKenarlik(),
                          focusedBorder: focusedKenarlik(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _kullaniciSoyAdiCtr,
                        validator: (value) {
                          if (value.length <= 3) {
                            return "Soyadınız en az üç harften oluşmalıdır.";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle_sharp,
                            color: Colors.white,
                          ),
                          hintText: "Soyad",
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.white),
                          errorBorder: errorKenarlik(),
                          focusedErrorBorder: focusedErrorKenarlik(),
                          enabledBorder: enabledKenarlik(),
                          focusedBorder: focusedKenarlik(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropdownButton(
                            value: dropdownValue,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.white,
                            ),
                            iconSize: 40,
                            //elevation: 16,
                            isExpanded: true,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              });
                            },
                            dropdownColor: FlutterColor("#314220"),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            itemHeight: 55.0,
                            items: tumSehirler.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Divider(
                    color: Colors.white,
                    height: 20,
                  ),
                  //Kayıt ol buton
                  Container(
                    width: (MediaQuery.of(context).size.width - 100),
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formAnahtari.currentState.validate()) {
                            try {
                              await context
                                  .read<HesapOlusturModel>()
                                  .kayitOlustur(
                                      kullaniciAdi: _kullaniciAdiCtr.text,
                                      kullaniciSoyAdi: _kullaniciSoyAdiCtr.text,
                                      kullanicitamAdi: _kullaniciAdiCtr.text +
                                          " " +
                                          _kullaniciSoyAdiCtr.text,
                                      avatarUrl: "avatar",
                                      arkaPlanFotografUrl: "arkaplan",
                                      email: _emailController.text,
                                      sifre: _passwordController.text,
                                      konum: dropdownValue);

                              await kayitOlAlert(context);
                              //Navigator.pop(context);
                            } on ArgumentError catch (e) {
                              kayitOlHataAlert(context, e.message);
                            } catch (e) {
                              kayitOlHataAlert(context, e.toString());
                            }
                          } else {
                            print("validate onayi yok");
                          }
                        },
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          primary: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
