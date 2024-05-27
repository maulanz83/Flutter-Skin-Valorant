import 'package:flutter/material.dart';

class KesanPesanPage extends StatelessWidget {
  const KesanPesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kesan Pesan"),
          backgroundColor: Colors.blueGrey[300],
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCard(
                    context,
                    title: "Kesan :",
                    content: [
                      "بسم الله الرحمن الرحيم بالتشكيل",
                      "Mata Kuliah Teknologi Pemrograman Mobile ini sangat membantu saya dalam belajar memahami sebuah Pembangunan dan Pengembanga App.",
                      "Dengan saya menagmbil matakuliah ini, saya dapat memahami lebih jelas mengenai alur data (API) dan App.",
                    ],
                  ),
                  SizedBox(height: 15),
                  _buildCard(
                    context,
                    title: "Pesan :",
                    content: [
                      "Alhamdulillah bapak adalah salah satu dosen yang konsisten dalam mengajar secara offline",
                      "saya berharap mungkin tugas yang nanti akan diberikan kepada adek tingkat saya tidak begitu padat saja "
                      "Dan semoga saya mendapatkan nilai A dari pak pak bagus:)",
                      "بسم الله الرحمن الرحيم بالتشكيل",
                      "وَأَقِيمُوا الصَّلَاةَ وَآتُوا الزَّكَاةَ وَمَا تُقَدِّمُوا لِأَنْفُسِكُمْ مِنْ خَيْرٍ تَجِدُوهُ عِنْدَ اللَّهِ إِنَّ اللَّهَ بِمَا تَعْمَلُونَ بَصِيرٌ",
                      "untuk siapa-pun janganah lupa sholat terutama kawan2ku"
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required String title, required List<String> content}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.blueGrey.withOpacity(0.5),
          width: 1,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content.map((item) {
                return Text(
                  item,
                  style: TextStyle(fontSize: 18),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
