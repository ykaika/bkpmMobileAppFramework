import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI

void main() {
  runApp(MyApp()); // Menjalankan aplikasi Flutter
}

// Kelas utama aplikasi yang mengatur tema dan halaman awal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Percabangan & Loop', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna utama aplikasi
      ),
      home: LayoutPracticum(), // Menampilkan halaman utama aplikasi
    );
  }
}

// Kelas utama yang menampilkan daftar angka dengan kondisi ganjil/genap
class LayoutPracticum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> numbers = []; // List untuk menyimpan angka dan tipe bilangan
    int i = 1; // Inisialisasi variabel i

    do {
      numbers.add({
        'number': i, // Menyimpan angka
        'type': (i % 2 == 0) ? 'Genap' : 'Ganjil' // Menentukan apakah angka ganjil atau genap
      });
      i++; // Menambah nilai i
    } while (i <= 10); // Perulangan do-while akan berjalan hingga i mencapai 10

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Percabangan & Loop'), // Judul di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Memberikan padding pada body
        child: ListView.builder(
          itemCount: numbers.length, // Menentukan jumlah item yang akan ditampilkan
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0), // Memberikan margin atas dan bawah
              elevation: 4, // Memberikan efek bayangan pada kartu
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${numbers[index]['number']}'), // Menampilkan angka dalam avatar
                ),
                title: Text('Angka ${numbers[index]['number']}'), // Menampilkan angka sebagai judul
                subtitle: Text('Bilangan ${numbers[index]['type']}'), // Menampilkan teks berdasarkan kondisi ganjil/genap
              ),
            );
          },
        ),
      ),
    );
  }
}
