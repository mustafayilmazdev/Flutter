import 'package:flutter/material.dart';

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
