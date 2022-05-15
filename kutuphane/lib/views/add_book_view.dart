import 'package:flutter/material.dart';
import 'package:kutuphane/services/calculator.dart';
import 'package:kutuphane/views/add_book_view_model.dart';
import 'package:provider/provider.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({Key key}) : super(key: key);

  @override
  _AddBookViewState createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
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
    return ChangeNotifierProvider<AddBookViewModel>(
      create: (_) => AddBookViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text("Yeni Kitap Ekle"),
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
                        await context.read<AddBookViewModel>().addNewBook(
                              bookName: bookCtr.text,
                              authorName: authorCtr.text,
                              publishDate: _selected,
                            );

                        /// navigator.pop edilecek
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Kaydet"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
