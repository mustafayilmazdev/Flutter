import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({Key key}) : super(key: key);

  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  TextStyle genel = TextStyle(fontSize: 20);
  Map<String, dynamic> bookToAdd = {
    "ad": "Denemeler",
    "yazar": "Montaigne",
    "sene": 1580
  };

  @override
  Widget build(BuildContext context) {
    final CollectionReference kitaplarRef =
        _database.collection("kitaplar"); //kitaplar koleksiyon adresi döner
    final hobbitRef = kitaplarRef.doc("fS0iE3GqLDQoxzxLpfnH");
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud CRUD işlemleri"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Veriler",
              style: genel,
            ),
            Divider(),
            /*     StreamBuilder<QuerySnapshot>(
              stream: kitaplarRef.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Bir Hata Oluştu, daha sonra tekrar deneyiniz"),
                  );
                } else {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    QuerySnapshot collectionSnapshot = snapshot.data;
                    List<DocumentSnapshot> documentSnapshot =
                        collectionSnapshot.docs;
                    // Map mapData = documentSnapshot[0].data();
                    // print(mapData["yazar"]);
                    // List<DocumentSnapshot> kitapList=snapshot.data.docs;
                    return Flexible(
                      child: ListView.builder(
                          itemCount: documentSnapshot.length,
                          itemBuilder: (context, index) {
                            Map mapD = documentSnapshot[index].data();
                            return Card(
                              child: ListTile(
                                title: Text(mapD["ad"]),
                                subtitle: Text(mapD["yazar"]),
                              ),
                            );
                          }),
                    );
                  }
                }
              },
            ),*/
            Divider(),
            Consumer<QuerySnapshot>(
              builder: (context, querySnapshot, child) {
                if (querySnapshot == null) {
                  return CircularProgressIndicator();
                } else {
                  List<DocumentSnapshot> kitapList = querySnapshot.docs;
                  return Flexible(
                    child: ListView.builder(
                        itemCount: kitapList.length,
                        itemBuilder: (context, index) {
                          Map mapD = kitapList[index].data();
                          return Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              color: Colors.redAccent,
                            ),
                            onDismissed: (_) {
                              print("${kitapList[index].id}");
                              // kitapList[index].reference.delete();
                              kitapList[index]
                                  .reference
                                  .update({"sene": FieldValue.delete()});
                            },
                            /*  confirmDismiss: (_) async {
                              //var bool=await showdialog();
                              return false;
                            },*/
                            child: Card(
                              child: ListTile(
                                title: Text(mapD["ad"]),
                                subtitle: Text(mapD["yazar"]),
                              ),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
            /* StreamBuilder<DocumentSnapshot>(
              stream:
                  hobbitRef.snapshots(), //dinlenecek stream eklenmeli T tipinde
              //**BUİLDER**
              // snapshot her tetiklendiğinde burası çalışır
              // 2 parametre alır, 1 context, 2 Asyncsnapshot objesi
              // Bir widget dönmeli, ki bu widget stream akışıyla ekranda yenilenecek
              //**BUİLDER**
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> asyncSnapshot) {
                //asyncSnapshot içinden documentsnapshot çıkartılacak
                //document içinden map çıkartılacak.

                if (asyncSnapshot.hasError) {
                  return Center(
                    child: Text("Bir hata oluştu"),
                  );
                } else {
                  if (!asyncSnapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    DocumentSnapshot documentSnapshot = asyncSnapshot.data;
                    Map mapData = documentSnapshot.data();
                    return Text("${mapData["yazar"]}");
                  }
                }
                *//*print(
                    "Streamden veri geldi ve builder fonksiyonu çalıştırıldı");
                return Text("StreamBuilder");*//*
              },
            ),*/
            // get ile manuel veri çekme
            /*Text(
              "kitaplarRef: ${kitaplarRef.doc("Hobbit")}",
              style: genel,
            ),
            Divider(),
            Text(
              "kitaplarRef: ${hobbitRef}",
              style: genel,
            ),
            Divider(),
            ElevatedButton(
              onPressed: () async {
                DocumentSnapshot documentSnapshot =
                    await hobbitRef.get(); // mektubun taşındığı zarf
                Map<String, dynamic> data = documentSnapshot.data();
                print(data);
                print(data["yazar"]);

                //Koleksiyon referansı ile get metodu kullanımı

                QuerySnapshot collectionSnapshot = await kitaplarRef.get();
                List<DocumentSnapshot> docs = collectionSnapshot.docs;
                print(docs.first.data());
                docs.forEach((element) {
                  print(element.data());
                });
              },
              child: Text("Get Data"),
            ),*/

            */
            */
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // DocumentReference addedBook = await kitaplarRef.add(bookToAdd);
          // print(addedBook.id);
          //print(addedBook.path);
          /* await kitaplarRef.doc(bookToAdd["ad"]).set(
              bookToAdd); //Denemeler adlı bir Koleksiyon oluşturup içini bookToadd verisi ile set edecek.*/
          // await kitaplarRef.doc(bookToAdd["ad"]).update({"sene": 2000});
          await _database
              .collection("kayipKitaplar")
              .doc("Harry Potter")
              .set({"ad": "Harry Potter", "yazar": "Rowling", "sene": 1990});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
