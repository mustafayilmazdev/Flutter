import 'package:crud_php/addEditUser.dart';
import 'package:crud_php/service/userService.dart';
import 'package:flutter/material.dart';

import 'model/userModel.dart';

class UserView extends StatefulWidget {
  const UserView({Key key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<UserModel> userList;
  bool loading = true;

  getAllUser() async {
    userList = await UserService().getUser();
    setState(() {
      loading = false;
    });
    print("User: ${userList.length}");
  }

  deleteUser(UserModel userModel) async {
    await UserService().deleteUser(userModel);
    setState(() {
      loading = false;
      getAllUser();
    });
    //print("User: ${userList.length}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model Crud"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddEditUser()))
                    .then((value) => getAllUser());
              }),
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                UserModel user = userList[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(user.name[0].toUpperCase()),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddEditUser(
                                  userModel: user,
                                  index: index,
                                ))).then((value) => getAllUser());
                  },
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteUser(user);
                    },
                  ),
                );
              }),
    );
  }
}
