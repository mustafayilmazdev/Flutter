import 'package:crud_php/model/userModel.dart';
import 'package:crud_php/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AddEditUser extends StatefulWidget {
  final UserModel userModel;
  final int index;

  const AddEditUser({Key key, this.userModel, this.index}) : super(key: key);

  @override
  _AddEditUserState createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  bool editMode = false;
  add(UserModel userModel) async {
    await UserService().addUser(userModel).then((value) => Toast.show(
        "Add Succesfull", context,
        gravity: Toast.CENTER, duration: 2));
    Navigator.pop(context);
  }

  update(UserModel userModel) async {
    await UserService().updateUser(userModel).then((value) => Toast.show(
        "Update Succesfull", context,
        gravity: Toast.CENTER, duration: 2));
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index != null) {
      editMode = true;
      name.text = widget.userModel.name;
      email.text = widget.userModel.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? "Update" : "Add"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(hintText: "Enter Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(hintText: "Enter Email"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (editMode == true) {
                  UserModel userModel = UserModel(
                    id: widget.userModel.id,
                    name: name.text,
                    email: email.text,
                  );
                  update(userModel);
                } else {
                  if (name.text.isEmpty) {
                    Toast.show("This Field is required", context,
                        gravity: Toast.CENTER, duration: 2);
                  } else {
                    UserModel userModel = UserModel(
                      name: name.text,
                      email: email.text,
                    );
                    add(userModel);
                  }
                }
              },
              child: Text(editMode ? "Update" : "Save"),
            ),
          ],
        ),
      ),
    );
  }
}
