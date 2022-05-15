import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kutuphane/models/book_model.dart';
import 'package:kutuphane/services/database.dart';

class BooksViewModel extends ChangeNotifier {
  // bookview'ın state bilgisini tutmak. Eğer başka bir sayfa
  // bookvirw arayüzünün ihtiyacı olan metotları ve hesaplamaları yapmak
  // gerekli servislerle konuşmak
  String _collectionPath = "books";
  DataBase _dataBase = DataBase();
  Stream<List<Book>> getBookList() {
    // Stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>> --> Stream<List<Book>> dönüşümü yapılacak

    // Stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _dataBase
        .getBookListFromApi(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    //Stream<List<DocumentSnapshot>> --> Stream<List<Book>> dönüşümü yapılacak
    Stream<List<Book>> streamListBook = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Book.fromMap(docSnap.data()))
            .toList());

    return streamListBook;
  }

  Future<void> deleteBook(Book book) async {
    await _dataBase.deleteDocument(referencePath: _collectionPath, id: book.id);
  }
}
