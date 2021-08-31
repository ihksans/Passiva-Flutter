import 'package:flutter/material.dart';
import 'package:passiva/Utils/ItemList.dart';
import 'AddScreen.dart';
import 'package:passiva/Utils/Database.dart';

class MenuScreen extends StatelessWidget {
  List item = passivaList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passiva'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddScreen()));
                    },
                    child: Text(
                      'Tambah data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(height: 400.0, child: _listItem(item)),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
        ],
      ),
    );
  }
}

//Widget pengecekan data
Widget _listItem(List data) {
  if (data.length == 0) {
    //jika kosong
    return Container(
        child: Column(children: <Widget>[
      Image.asset('images/no-data.jpg', width: 300, height: 300),
      SizedBox(
        height: 5,
      ),
      Center(
        child: Text(
          "Data kosong, Silahkan tambahkan data",
          style: TextStyle(fontSize: 16.0),
        ),
      )
    ]));
  } else {
    return ItemPage();
  }
}
