// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'konversi_uang.dart';
import 'konversi_waktu.dart';

class KonversiPage extends StatefulWidget {
  const KonversiPage({ Key? key }) : super(key: key);

  @override
  State<KonversiPage> createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Konversi"),
          backgroundColor: Colors.blueGrey[300],
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.money),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KonversiUang()),
                    );
                  },
                ),
                Text('Konversi Uang'),
                SizedBox(height: 20),
                IconButton(
                  icon: Icon(Icons.timer),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KonversiWaktu()),
                    );
                  },
                ),
                Text('Konversi Waktu'),
              ],
            ),
          ),
      )
    );
  }
}