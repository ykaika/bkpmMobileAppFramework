import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI

void main() {
  runApp(MyApp()); // Menjalankan aplikasi Flutter
}

// Model Data
class ItemModel {
  final int id; // ID unik untuk setiap item
  final String name; // Nama item
  final String description; // Deskripsi item

  ItemModel({required this.id, required this.name, required this.description}); // Konstruktor untuk inisialisasi objek ItemModel
}

// Widget Modular untuk menampilkan item dalam bentuk kartu
class ItemCard extends StatelessWidget {
  final ItemModel item; // Objek item yang akan ditampilkan dalam kartu

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = Colors.white; // Warna default kartu

    if (item.id % 2 == 0) {
      cardColor = Colors.blue[100]!; // Warna biru untuk item dengan ID genap
    } else {
      cardColor = Colors.green[100]!; // Warna hijau untuk item dengan ID ganjil
    }

    return Card(
      color: cardColor, // Mengatur warna kartu berdasarkan ID item
      margin: EdgeInsets.symmetric(vertical: 8.0), // Memberikan margin atas dan bawah
      elevation: 4, // Memberikan efek bayangan pada kartu
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${item.id}'), // Menampilkan ID dalam bentuk avatar
        ),
        title: Text(item.name), // Menampilkan nama item
        subtitle: Text(item.description), // Menampilkan deskripsi item
      ),
    );
  }
}

// Kelas utama aplikasi yang mengatur tema dan halaman awal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Practicum', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna utama aplikasi
      ),
      home: LayoutPracticum(), // Menampilkan halaman utama aplikasi
    );
  }
}

// Kelas utama yang menampilkan daftar item dalam bentuk kartu
class LayoutPracticum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ItemModel> items = []; // List untuk menyimpan item

    // Membuat 10 item dengan ID, nama, dan deskripsi yang berbeda
    for (int i = 1; i <= 10; i++) {
      String name = i % 2 == 0 ? 'Even Item $i' : 'Odd Item $i'; // Menentukan nama berdasarkan ID genap/ganjil
      String description = i % 2 == 0
          ? 'This is an even-numbered item.'
          : 'This is an odd-numbered item.'; // Menentukan deskripsi berdasarkan ID

      items.add(ItemModel(id: i, name: name, description: description)); // Menambahkan item ke dalam list
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout with OOP and Loop'), // Judul di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Memberikan padding pada body
        child: ListView.builder(
          itemCount: items.length, // Menentukan jumlah item yang akan ditampilkan
          itemBuilder: (context, index) {
            return ItemCard(item: items[index]); // Menampilkan setiap item dalam bentuk kartu
          },
        ),
      ),
    );
  }
}