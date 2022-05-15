import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  final IconData iconum;
  final Color textIconRenk;
  final String cinsiyet;
  MyColumn(
      {this.iconum = Icons.wc,
      this.cinsiyet = "Cinsiyet Belirtilmedi",
      this.textIconRenk = Colors.black54});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.iconum,
          size: 50,
          color: textIconRenk,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          this.cinsiyet,
          style: TextStyle(
              color: textIconRenk, fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
