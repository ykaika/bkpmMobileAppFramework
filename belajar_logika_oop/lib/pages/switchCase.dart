import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI

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
  // Kelas ini digunakan untuk menampilkan UI yang dapat berubah berdasarkan pilihan dropdown
  @override
  _LayoutPracticumState createState() => _LayoutPracticumState();
}

class _LayoutPracticumState extends State<LayoutPracticum> {
  int selectedIndex = 1; // Variabel untuk menyimpan pilihan yang dipilih pengguna

  // Fungsi untuk menentukan pesan berdasarkan pilihan dropdown
  String getMessage(int index) {
    switch (index) {
      case 1:
        return "Ini adalah pesan pertama";
      case 2:
        return "Ini adalah pesan kedua";
      case 3:
        return "Ini adalah pesan ketiga";
      default:
        return "Pesan default";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout with Switch-Case'), // Judul di AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan elemen secara vertikal
          children: [
            Text(
              getMessage(selectedIndex), // Menampilkan pesan berdasarkan pilihan
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Memberikan jarak antara teks dan dropdown
            DropdownButton<int>(
              value: selectedIndex, // Menampilkan nilai yang dipilih saat ini
              items: [
                DropdownMenuItem(value: 1, child: Text("Pilihan 1")),
                DropdownMenuItem(value: 2, child: Text("Pilihan 2")),
                DropdownMenuItem(value: 3, child: Text("Pilihan 3")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedIndex = value ?? 1; // Mengubah nilai berdasarkan pilihan pengguna
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}