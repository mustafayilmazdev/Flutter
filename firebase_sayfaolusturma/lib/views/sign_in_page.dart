import 'package:firebase_sayfaolusturma/services/auth.dart';
import 'package:firebase_sayfaolusturma/views/email_sign_in.dart';
import 'package:firebase_sayfaolusturma/widgets/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;
  Future<void> _signInAnonymously() async {
    setState(() {
      _isLoading = true;
    });
    final user =
        await Provider.of<Auth>(context, listen: false).signInAnonymously();
    setState(() {
      _isLoading = false;
    });

    print(user.uid);
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final user =
          await Provider.of<Auth>(context, listen: false).signInWithGoogle();
    } catch (e) {
      print(e);
      print("sign in page");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }

    // print(user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                Provider.of<Auth>(context, listen: false).signOut();
                print("Çıkış Yapıldı.");
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In Page',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            // ignore: deprecated_member_use
            MyRaisedButton(
              color: Colors.orangeAccent,
              child: Text("Sıgn In Anonymously"),
              onPressed: _isLoading ? null : _signInAnonymously,
            ),
            SizedBox(
              height: 10,
            ),
            MyRaisedButton(
              color: Colors.yellow,
              child: Text("Sıgn In Email/Password"),
              onPressed: _isLoading
                  ? null
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailSignInPage()));
                    },
            ),
            SizedBox(
              height: 10,
            ),
            MyRaisedButton(
              color: Colors.red,
              child: Text("Sıgn In With Google"),
              onPressed: _isLoading ? null : _signInWithGoogle,
            ),
          ],
        ),
      ),
    );
  }
}
