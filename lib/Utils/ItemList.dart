import 'package:flutter/material.dart';
import 'Database.dart';
import 'package:passiva/Screen/MenuScreen.dart';

class ItemPage extends StatefulWidget {
  @override
  ItemList createState() => ItemList();
}

class ItemList extends State<ItemPage> {
  List data = passivaList;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            // Item item = data[index];
            Item item = passivaList[index];
            return InkWell(
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Yang dihutangi: " + item.nama,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Besar Hutang: Rp. " + item.nominal,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Janji bayar: " + item.tempo,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            _statusHutang(item),
                            Text(
                              "Keperluan uang: " + item.keperluan,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Database.removePassiva(index);
                                refreshData();
                              },
                              child: Text(
                                'Hapus data',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: passivaList.length,
        ),
      ),
    );
  }

  //reload data
  Future refreshData() async {
    setState(() {
      data = passivaList;
    });
  }
}

//Widget status hutang sudah bayar atau belum
Widget _statusHutang(Item item) {
  if (item.isLunas == '1') {
    return Text(
      "Status hutang: lunas",
      style: TextStyle(fontSize: 16.0),
    );
  } else {
    return Text(
      "Status hutang: belum lunas",
      style: TextStyle(fontSize: 16.0),
    );
  }
}
