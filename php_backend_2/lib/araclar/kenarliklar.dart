import 'package:flutter/material.dart';

//enabled
OutlineInputBorder enabledKenarlik() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  );
}

//focused
OutlineInputBorder focusedKenarlik() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green[500],
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  );
}

//error
OutlineInputBorder errorKenarlik() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  );
}

OutlineInputBorder focusedErrorKenarlik() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red[300],
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  );
}

//ElevatedButton
final ButtonStyle elevatedButtonStil = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.black,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 20),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);
