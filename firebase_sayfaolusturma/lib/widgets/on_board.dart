import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sayfaolusturma/services/auth.dart';
import 'package:firebase_sayfaolusturma/views/home_page.dart';
import 'package:firebase_sayfaolusturma/views/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardWidget extends StatefulWidget {
  @override
  _OnBoardWidgetState createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
  //bool _isLogged;

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    return StreamBuilder<User>(
      stream: _auth.authStatus(), //bunu dinle
      builder: (
        //bunu inşa et
        BuildContext context,
        AsyncSnapshot<dynamic> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.data != null ? HomePage() : SignInPage();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
