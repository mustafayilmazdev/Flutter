import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sayfaolusturma/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//bir değişken, bu değişkenin değerine göre iki formdan birisi widget ağacına bağlanacak
enum FormStatus { signin, register, reset }

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key key}) : super(key: key);

  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  FormStatus _formStatus = FormStatus.signin;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _formStatus == FormStatus.signin
              ? buildSignInForm()
              : _formStatus == FormStatus.register
                  ? buildRegisterForm()
                  : buildResetForm(),
        ),
      ),
    );
  }

  Widget buildSignInForm() {
    final _signInFormKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Form(
      key: _signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Lütfen Giriş Yapınız",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (!EmailValidator.validate(value)) {
                //email validator'e göre value doğru değilse
                return "Lütfen Geçerli Bir Adres Giriniz";
              }
              return null;
              /*if (!value.contains("@")) {
                return "Alan Boş Bırakılamaz";
              }
              return null; //her şey yolunda. Sorun Yok Demek TRUE Gibi ama niye true değil anlamadım. Şimdi anladım validator dönüş tipi String. null boş string döndürdüğü için sorun yok anlamına geliyor*/
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Şifre",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value.length < 6) {
                return "Şifreniz en az 6 karakterden oluşmalıdır";
              }
              return null;
            },
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  if (_signInFormKey.currentState.validate()) {
                    final user = await Provider.of<Auth>(context, listen: false)
                        .signInWithEmailAndPassword(
                            _emailController.text, _passwordController.text);
                    if (!user.emailVerified) {
                      await _showResetPasswordDialog(context);
                      await Provider.of<Auth>(context, listen: false).signOut();
                    }
                    Navigator.pop(context);
                  }
                } on FirebaseAuthException catch (e) {
                  print(e.code);
                  if (e.code == "wrong-password") {
                    print("Bu blok yanlış şifre olduğu için çalıştı");
                  } else if (e.code == "user-not-found") {
                    print("Başka bir hata");
                  }
                } catch (e) {
                  print("Diğer bir hata");
                }
              },
              child: Text("Giriş")),
          TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.register;
                });
              },
              child: Text("Yeni Kayıt İçin Tıklayınız")),
          TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.reset;
                });
              },
              child: Text("Şifremi Unuttum")),
        ],
      ),
    );
  }

  Widget buildResetForm() {
    final _resetFormKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();

    return Form(
      key: _resetFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Şifre Yenileme",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (!EmailValidator.validate(value)) {
                //email validator'e göre value doğru değilse
                return "Lütfen Geçerli Bir Adres Giriniz";
              }
              return null;
              /*if (!value.contains("@")) {
                return "Alan Boş Bırakılamaz";
              }
              return null; //her şey yolunda. Sorun Yok Demek TRUE Gibi ama niye true değil anlamadım. Şimdi anladım validator dönüş tipi String. null boş string döndürdüğü için sorun yok anlamına geliyor*/
            },
          ),
          ElevatedButton(
              onPressed: () async {
                if (_resetFormKey.currentState.validate()) {
                  await Provider.of<Auth>(context, listen: false)
                      .sendPasswordResetEmail(_emailController.text);
                  await _showResetPasswordDialog;
                  Navigator.pop(context);
                }
              },
              child: Text("Gönder")),
        ],
      ),
    );
  }

  Widget buildRegisterForm() {
    final _registerFormKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _passwordConfirmController =
        TextEditingController();

    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kayıt Formu",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (!EmailValidator.validate(value)) {
                //email validator'e göre value doğru değilse
                return "Lütfen Geçerli Bir Adres Giriniz";
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Şifre",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              print(value.length);
              if (value.length >= 6) {
                return null;
              }
              return "Şifre en az 6 karakterden oluşmalıdır!";
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordConfirmController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Onay",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value != _passwordController.text) {
                return "Şifreler Uyuşmuyor";
              } else {
                return null;
              }
            },
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  if (_registerFormKey.currentState.validate()) {
                    final user = await Provider.of<Auth>(context, listen: false)
                        .createUserWithEmailAndPassword(
                            _emailController.text, _passwordController.text);
                    //print(user.uid);
                    if (!user.emailVerified) {
                      await user.sendEmailVerification();
                    }
                    await _showMyDialog();
                    await Provider.of<Auth>(context, listen: false).signOut();
                    setState(() {
                      _formStatus = FormStatus.signin;
                    });
                  }

                  /* print(user.emailVerified);
                  await Future.delayed(Duration(
                      seconds:
                          60)); // 60 saniye bekleyip sonraki satıra geçecek
                  await FirebaseAuth.instance.currentUser.reload();
                  print(
                      "60 saniye sonra email verified değeri ${FirebaseAuth.instance.currentUser.emailVerified}");*/
                } on FirebaseAuthException catch (e) {
                  print(
                      "Kayıt Formu içerisinde ${e.message} Hatası Yakalandı!");
                }
              },
              child: Text("Kayıt")),
          TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.signin;
                });
              },
              child: Text("Zaten Üye Misiniz? Tıklayınız")),
        ],
      ),
    );
  }

  Future<void> _showResetPasswordDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // user must tap button! ekranın dışına tıklayınca bu pencereden çıkılsın mı?
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Şifre Yenileme'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Lütfen Mailinizi Kontrol Ediniz.'),
                Text('Linke tıklayarak şifrenizi yenileyiniz.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Anladım'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ONAY GEREKİYOR'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Merhaba, lütfen mailinizi kontrol ediniz,'),
                Text('Onay linkini tıklayıp tekrar giriş yapmalısınız.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ANLADIM'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
