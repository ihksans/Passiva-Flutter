import 'package:flutter/material.dart';
import 'package:passiva/Widget/AddForm.dart';
import '../Widget/AddForm.dart';

class AddScreen extends StatelessWidget {
  final String _nama = '';
  final String _nominal = '';
  final String _tempo = '';
  final String _isLunas = '';
  final String _keperluan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Passiva'),
      ),
      body: Container(
        child: AddForm(
            nama: _nama,
            tempo: _tempo,
            nominal: _nominal,
            keperluan: _keperluan,
            isLunas: _isLunas),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
