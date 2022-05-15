import 'package:firebase_sayfaolusturma/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
