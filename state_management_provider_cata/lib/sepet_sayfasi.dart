import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_cata/renkData.dart';

class Sepetim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          //  size: 30,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "* ${Provider.of<RenkData>(context).sepet[index].toString()}",
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  },
                  itemCount: Provider.of<RenkData>(context).sepet.length,
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), //textler aşağı inse de scrool çalışmıyordu.Bu textler ekran dışına çıktığında scrollu sağladı
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  height: 70,
                  width: 150,
                  child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "BUY",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
