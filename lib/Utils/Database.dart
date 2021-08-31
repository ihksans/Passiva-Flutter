import 'dart:async';
import 'dart:convert';

class Item {
  String nama;
  String nominal;
  String tempo;
  String isLunas;
  String keperluan;
  Item(
      {required this.nama,
      required this.nominal,
      required this.tempo,
      required this.isLunas,
      required this.keperluan});
  Map toJson() => {
        'nama': nama,
        'nominal': nominal,
        'tempo': tempo,
        'isLunas': isLunas,
        'keperluan': keperluan
      };
}

class Database {
  static String? nama;
  static String? nominal;
  static String? tempo;
  static String? isLunas;
  static String? keperluan;
  static List<String>? passiva;

  static Future<void> addItem(
      {required String nama,
      required String nominal,
      required String tempo,
      required String isLunas,
      required String keperluan}) async {
    Item data = Item(
        nama: nama,
        nominal: nominal,
        tempo: tempo,
        isLunas: isLunas,
        keperluan: keperluan);
    String jsonData = jsonEncode(data);
    passivaList.add(data);
  }

  static void setPassiva(List<String> item) {
    passiva = item;
  }

  static void removePassiva(int index) {
    passivaList.removeAt(index);
  }
}

var passivaList = [];
