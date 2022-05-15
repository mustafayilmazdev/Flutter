import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kutuphane/models/book_model.dart';
import 'package:kutuphane/views/add_book_view.dart';
import 'package:kutuphane/views/books_view_model.dart';
import 'package:kutuphane/views/update_book_view.dart';
import 'package:provider/provider.dart';

// bir arayüz widgeti
class BooksView extends StatefulWidget {
  const BooksView({Key key}) : super(key: key);

  @override
  _BooksViewState createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  TextStyle genel = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BooksViewModel>(
      create: (_) => BooksViewModel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.grey[200],
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
              StreamBuilder<List<Book>>(
                stream: Provider.of<BooksViewModel>(context, listen: false)
                    .getBookList(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.hasError);
                    return Center(
                      child:
                          Text("Bir Hata Oluştu, daha sonra tekrar deneyiniz"),
                    );
                  } else {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      List<Book> kitapList = snapshot.data;
                      return BuildListView(kitapList: kitapList);
                    }
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddBookView()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({
    Key key,
    @required this.kitapList,
  }) : super(key: key);

  final List<Book> kitapList;

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  List<Book> filteredList;

  @override
  Widget build(BuildContext context) {
    var fullList = widget.kitapList;
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Arama, Kitap adı",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  isFiltering = true;

                  setState(() {
                    filteredList = fullList
                        .where((book) => book.bookName
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                } else {
                  WidgetsBinding.instance.focusManager.primaryFocus.unfocus();
                  setState(() {
                    isFiltering = false;
                  });
                }
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: isFiltering ? filteredList.length : fullList.length,
                itemBuilder: (context, index) {
                  var list = isFiltering ? filteredList : fullList;
                  return Slidable(
                    child: Card(
                      child: ListTile(
                        title: Text(list[index].bookName),
                        subtitle: Text(list[index].authorName),
                      ),
                    ),
                    actionPane: SlidableScrollActionPane(),
                    actionExtentRatio: 0.2, //ne kadar alana açılabileceği
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'Edit',
                        color: Colors.orange,
                        icon: Icons.edit,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateBookView(
                                      book: widget.kitapList[index])));
                        },
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () async {
                          await Provider.of<BooksViewModel>(context,
                                  listen: false)
                              .deleteBook(widget.kitapList[index]);
                        },
                      ),
                    ],
                  );
                  /* return Dismissible(
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
                    onDismissed: (_) async {
                      await Provider.of<BooksViewModel>(context,
                              listen: false)
                          .deleteBook(kitapList[index]);
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(kitapList[index].bookName),
                        subtitle: Text(kitapList[index].authorName),
                        trailing: ElevatedButton(
                            onPressed: () {
                              print(kitapList[index].bookName);
                              print(kitapList[index].publishDate);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateBookView(
                                            book: kitapList[index],
                                          )));
                            },
                            child: Icon(Icons.update)),
                      ),
                    ),
                  );*/
                }),
          ),
        ],
      ),
    );
  }
}
