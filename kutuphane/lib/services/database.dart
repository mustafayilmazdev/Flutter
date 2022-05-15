import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kutuphane/models/book_model.dart';

class DataBase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Firestore servisinden kitapların verisini stream olarak alıp akıtmak.
  Stream<QuerySnapshot> getBookListFromApi(String referencePath) {
    return _firestore.collection(referencePath).snapshots();
  }

// Firestore üzerindeki bir veriyi silme hizmeti
  Future<void> deleteDocument({String referencePath, String id}) async {
    await _firestore.collection(referencePath).doc(id).delete();
  }

  // Firestore üzerine yeni veri ekleme ve güncelleme hizmeri
  Future<void> setBookData(
      {String collectionPath, Map<String, dynamic> bookAsMap}) async {
    await _firestore
        .collection(collectionPath)
        .doc(Book.fromMap(bookAsMap).id)
        .set(bookAsMap);
  }

  Future<void> addBookData(
      {String collectionPath, Map<String, dynamic> bookAsMap}) async {
    DocumentReference eklenenKitap = await _firestore
        .collection(collectionPath)
        .doc("kullanici")
        .collection("kullanigndr")
        .add(bookAsMap);
    print("eklenen Kitap: ${eklenenKitap.path}");
  }
}
