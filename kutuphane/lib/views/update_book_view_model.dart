import 'package:flutter/cupertino.dart';
import 'package:kutuphane/models/book_model.dart';
import 'package:kutuphane/services/calculator.dart';
import 'package:kutuphane/services/database.dart';

class UpdateBookViewModel extends ChangeNotifier {
  DataBase _dataBase = DataBase();
  String collectionPath = "books";
  Future<void> updateBook(
      {String bookName,
      String authorName,
      DateTime publishDate,
      Book book}) async {
    /// Form alanındaki veriler ile önce bir book objesi oluşturacak
    Book newBook = Book(
        id: book.id,
        bookName: bookName,
        authorName: authorName,
        publishDate: Calculator.dateTimeToTimestamp(publishDate));

    /// bu kitap bilgisini databese servisi üzerinden Firestore'a yazacak
    await _dataBase.setBookData(
        collectionPath: collectionPath, bookAsMap: newBook.toMap());
  }
}
