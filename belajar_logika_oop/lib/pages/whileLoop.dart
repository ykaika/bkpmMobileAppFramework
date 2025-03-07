import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI

void main() {
  runApp(MyApp()); // Menjalankan aplikasi Flutter
}

// Kelas utama aplikasi yang mengatur tema dan halaman awal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Loop & Conditional', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna utama aplikasi
      ),
      home: LoopConditionalPracticum(), // Menampilkan halaman utama aplikasi
    );
  }
}

// Kelas utama yang menampilkan daftar angka dengan kondisi ganjil/genap
class LoopConditionalPracticum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> numbers = []; // List untuk menyimpan angka
    int i = 1; // Inisialisasi variabel i

    while (i <= 10) { // Menggunakan perulangan while untuk menambahkan angka ke dalam list
      numbers.add(i); // Menambahkan angka ke dalam list
      i++; // Menambah nilai i
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('While Loop & Conditional in Flutter'), // Judul di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Memberikan padding pada body
        child: ListView.builder(
          itemCount: numbers.length, // Menentukan jumlah item yang akan ditampilkan
          itemBuilder: (context, index) {
            int number = numbers[index]; // Mengambil angka dari list
            Color bgColor =
                number % 2 == 0 ? Colors.blue[200]! : Colors.green[200]!; // Menentukan warna berdasarkan ganjil/genap

            return Card(
              color: bgColor, // Mengatur warna kartu berdasarkan angka
              margin: EdgeInsets.symmetric(vertical: 8.0), // Memberikan margin atas dan bawah
              elevation: 4, // Memberikan efek bayangan pada kartu
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('$number'), // Menampilkan angka dalam avatar
                ),
                title: Text('Angka $number'), // Menampilkan angka sebagai judul
                subtitle: Text(
                    number % 2 == 0 ? 'Bilangan Genap' : 'Bilangan Ganjil'), // Menampilkan teks berdasarkan kondisi ganjil/genap
              ),
            );
          },
        ),
      ),
    );
  }
}