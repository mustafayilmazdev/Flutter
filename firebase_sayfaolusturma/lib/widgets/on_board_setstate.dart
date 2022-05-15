import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sayfaolusturma/views/home_page.dart';
import 'package:firebase_sayfaolusturma/views/sign_in_page.dart';
import 'package:flutter/material.dart';

class OnBoardWidget extends StatefulWidget {
  @override
  _OnBoardWidgetState createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
  bool _isLogged;
  @override
  // ignore: must_call_super
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        _isLogged = false;
        print('User is currently signed out!');
      } else {
        _isLogged = true;
        print('User is signed in!');
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLogged == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _isLogged
            ? HomePage()
            : SignInPage();
  }
}
