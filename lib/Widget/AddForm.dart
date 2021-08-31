import 'package:flutter/material.dart';
import 'package:passiva/Utils/Database.dart';
import 'package:flutter/services.dart';
import 'package:passiva/Screen/MenuScreen.dart';
import 'package:passiva/Utils/ItemList.dart';

class AddForm extends StatefulWidget {
  final String nama;
  final String nominal;
  final String tempo;
  final String isLunas;
  final String keperluan;
  const AddForm(
      {required this.nama,
      required this.nominal,
      required this.tempo,
      required this.isLunas,
      required this.keperluan});
  @override
  AddFormState createState() => AddFormState();
}

class AddFormState extends State<AddForm> {
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nominal = TextEditingController();
  final TextEditingController _tempo = TextEditingController();
  String _isLunas = '';
  final TextEditingController _keperluan = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _nama,
              decoration: InputDecoration(
                hintText: 'Tulis orang yang dihutangi',
                labelText: 'Nama',
              ),
            ),
            TextField(
              controller: _nominal,
              decoration: new InputDecoration(labelText: "Nominal uang: "),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
            TextField(
              controller: _tempo,
              decoration: InputDecoration(
                hintText: 'Tulis tempo hari bayar hutang',
                labelText: 'Jatuh Tempo',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Status Hutang: '),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Radio<String>(
                    value: '2',
                    groupValue: _isLunas,
                    onChanged: (String? value) {
                      setState(() {
                        _isLunas = value!;
                      });
                    },
                  ),
                  title: Text('Belum Lunas'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: '1',
                    groupValue: _isLunas,
                    onChanged: (String? value) {
                      setState(() {
                        _isLunas = value!;
                      });
                    },
                  ),
                  title: Text(' Lunas'),
                ),
              ],
            ),
            TextField(
              controller: _keperluan,
              decoration: InputDecoration(
                hintText: 'Tulis keterangan keperluan uang hutang',
                labelText: 'Keperluan',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Database.addItem(
                    nama: _nama.text,
                    nominal: _nominal.text,
                    tempo: _tempo.text,
                    isLunas: _isLunas,
                    keperluan: _keperluan.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuScreen()));
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nama.dispose();
    super.dispose();
  }

  void showSnackbar() {}
}
