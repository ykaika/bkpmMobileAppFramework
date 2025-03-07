import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membuat UI

void main() {
  runApp(MyApp()); // Menjalankan aplikasi Flutter
}

class MyApp extends StatelessWidget {
  // Kelas utama aplikasi yang mengatur tema dan halaman awal
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Practicum', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna utama aplikasi
      ),
      home: LayoutPracticum(), // Menetapkan halaman utama aplikasi
    );
  }
}

class LayoutPracticum extends StatefulWidget {
  // Kelas ini digunakan untuk menampilkan UI yang dapat berubah berdasarkan nilai
  @override
  _LayoutPracticumState createState() => _LayoutPracticumState();
}

class _LayoutPracticumState extends State<LayoutPracticum> {
  int score = 0; // Variabel untuk menyimpan nilai

  // Fungsi untuk menentukan kategori berdasarkan nilai
  String getScoreCategory() {
    if (score >= 90) {
      return 'A';
    } else if (score >= 75) {
      return 'B';
    } else if (score >= 60) {
      return 'C';
    } else {
      return 'D';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout with If-Else Statement'), // Judul di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Memberikan padding pada seluruh konten
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Posisi elemen di tengah secara vertikal
          children: [
            Text(
              'Masukkan Nilai:', // Teks instruksi
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Memberikan jarak antara teks dan slider
            Slider(
              value: score.toDouble(), // Nilai slider mengikuti nilai score
              min: 0, // Batas minimum nilai
              max: 100, // Batas maksimum nilai
              divisions: 10, // Membagi nilai slider menjadi 10 bagian
              label: score.toString(), // Menampilkan nilai saat digeser
              onChanged: (double value) {
                setState(() {
                  score = value.toInt(); // Mengubah nilai score saat slider digeser
                });
              },
            ),
            SizedBox(height: 20), // Memberikan jarak antara slider dan teks kategori
            Text(
              'Kategori Nilai: ${getScoreCategory()}', // Menampilkan kategori nilai berdasarkan score
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}