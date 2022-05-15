import 'package:flutter/cupertino.dart';
import 'package:kutuphane/models/book_model.dart';
import 'package:kutuphane/services/calculator.dart';
import 'package:kutuphane/services/database.dart';

class AddBookViewModel extends ChangeNotifier {
  DataBase _dataBase = DataBase();
  String collectionPath = "books";
  Future<void> addNewBook(
      {String bookName, String authorName, DateTime publishDate}) async {
    /// Form alanındaki veriler ile önce bir book objesi oluşturacak
    Book newBook = Book(
        id: DateTime.now().toIso8601String(),
        bookName: bookName,
        authorName: authorName,
        publishDate: Calculator.dateTimeToTimestamp(publishDate));

    /// bu kitap bilgisini databese servisi üzerinden Firestore'a yazacak
    await _dataBase.addBookData(
        collectionPath: collectionPath, bookAsMap: newBook.toMap());
  }
}
