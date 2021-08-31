import 'package:flutter/material.dart';
import 'package:passiva/Screen/MenuScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.asset('images/bg-home2.png',
                      width: 150, height: 150),
                  margin: const EdgeInsets.only(bottom: 10, top: 50),
                ),
                Container(
                  child: Text(
                    'Passiva/Hutang',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'Hallo kawan, selamat datang di aplikasi pencatatan hutang. Kami siap membantu anda yang sering lupa kalo punya hutang.',
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 10),
                )
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuScreen()));
                  },
                  child: Text(
                    'Ayo Kita Mulai!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsets.only(top: 40),
          ),
        )
      ],
    )));
  }
}
