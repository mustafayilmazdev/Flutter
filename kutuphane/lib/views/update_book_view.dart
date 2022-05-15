import 'package:flutter/material.dart';
import 'package:kutuphane/models/book_model.dart';
import 'package:kutuphane/services/calculator.dart';
import 'package:kutuphane/views/update_book_view_model.dart';
import 'package:provider/provider.dart';

class UpdateBookView extends StatefulWidget {
  final Book book;
  const UpdateBookView({this.book});

  @override
  _UpdateBookViewState createState() => _UpdateBookViewState();
}

class _UpdateBookViewState extends State<UpdateBookView> {
  TextEditingController bookCtr = TextEditingController();
  TextEditingController authorCtr = TextEditingController();
  TextEditingController publishCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _selected;

  /// Text Editing hafızasını serbest bırakma program bitince
  @override
  void dispose() {
    // TODO: implement dispose
    bookCtr.dispose();
    authorCtr.dispose();
    publishCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bookCtr.text = widget.book.bookName;
    authorCtr.text = widget.book.authorName;
    publishCtr.text = Calculator.dateTimetoString(
        Calculator.dateTimeFromTimeStamp(widget.book.publishDate));
    return ChangeNotifierProvider<UpdateBookViewModel>(
      create: (_) => UpdateBookViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text("Kitap Bilgisi Güncelle"),
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: bookCtr,
                  decoration: InputDecoration(
                      hintText: "Kitap Adı", icon: Icon(Icons.book)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kitap Adı Boş Olamaz";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: authorCtr,
                  decoration: InputDecoration(
                      hintText: "Yazar Adı", icon: Icon(Icons.edit)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Yazar Adı Boş Olamaz";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  onTap: () async {
                    _selected = await (showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(-1000),
                      lastDate: DateTime.now(),
                    ));
                    publishCtr.text = Calculator.dateTimetoString(_selected);
                  },
                  controller: publishCtr,
                  decoration: InputDecoration(
                      hintText: "Basım Tarihi", icon: Icon(Icons.date_range)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Basım Tarihi Boş Olamaz";
                    } else {
                      return null;
                    }
                  },
                ),
                Divider(),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        /// kullanıcı bilgileri ile addNewBook metodu çağırılacak,
                        await context.read<UpdateBookViewModel>().updateBook(
                              book: widget.book,
                              bookName: bookCtr.text,
                              authorName: authorCtr.text,
                              publishDate: _selected ??
                                  Calculator.dateTimeFromTimeStamp(
                                      widget.book.publishDate),
                            );

                        /// navigator.pop edilecek
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Güncelle"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
