import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membuat UI

void main() {
  runApp(MyApp()); // Menjalankan aplikasi Flutter
}

// Model Data
class ItemModel {
  // Kelas ini berfungsi sebagai model data untuk item yang ditampilkan dalam daftar
  final int id; // ID unik untuk setiap item
  final String name; // Nama item
  final String description; // Deskripsi item

  ItemModel({required this.id, required this.name, required this.description}); // Konstruktor untuk menginisialisasi objek ItemModel
}

// Widget Modular
class ItemCard extends StatelessWidget {
  // Kelas ini digunakan untuk menampilkan setiap item dalam bentuk kartu (Card)
  final ItemModel item; // Data item yang akan ditampilkan dalam kartu

  const ItemCard({Key? key, required this.item}) : super(key: key); // Konstruktor dengan parameter wajib

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0), // Memberikan margin vertikal 8.0 pada setiap kartu
      elevation: 4, // Efek bayangan pada kartu agar tampak mengangkat
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${item.id}'), // Menampilkan ID item dalam avatar berbentuk lingkaran
        ),
        title: Text(item.name), // Menampilkan nama item sebagai judul
        subtitle: Text(item.description), // Menampilkan deskripsi item sebagai subjudul
      ),
    );
  }
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

class LayoutPracticum extends StatelessWidget {
  // Kelas ini berfungsi sebagai halaman utama yang menampilkan daftar item
  @override
  Widget build(BuildContext context) {
    List<ItemModel> items = List.generate(
      10, // Jumlah item yang akan dibuat
      (index) => ItemModel(
        id: index + 1, // ID item mulai dari 1
        name: 'Item ${index + 1}', // Nama item sesuai dengan urutan
        description: 'This is item number ${index + 1}', // Deskripsi item sesuai urutan
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout with OOP'), // Judul di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Memberikan padding 8.0 pada seluruh konten
        child: ListView.builder(
          itemCount: items.length, // Jumlah item yang akan ditampilkan dalam daftar
          itemBuilder: (context, index) {
            return ItemCard(item: items[index]); // Menampilkan setiap item menggunakan ItemCard
          },
        ),
      ),
    );
  }
}