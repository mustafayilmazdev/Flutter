import 'package:flutter/material.dart';

class UpdateBookViewMy extends StatefulWidget {
  String bookName;
  String authorName;
  String publishDate;
  UpdateBookViewMy({this.bookName, this.authorName, this.publishDate});

  @override
  _UpdateBookViewMyState createState() => _UpdateBookViewMyState();
}

class _UpdateBookViewMyState extends State<UpdateBookViewMy> {
  TextEditingController bookNameCtr = TextEditingController();
  TextEditingController authorNameCtr = TextEditingController();
  TextEditingController publishDateCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bookNameCtr.text = widget.bookName;
    authorNameCtr.text = widget.authorName;
    publishDateCtr.text = widget.publishDate;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Book"),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: bookNameCtr,
              ),
              TextFormField(
                controller: authorNameCtr,
              ),
              TextFormField(
                controller: publishDateCtr,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
