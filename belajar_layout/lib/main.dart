import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Belajar Layout';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ImageSection(image: 'images/restaurant.jpg'),
              const TitleSection(
                name: 'Cork & Screw',
                location:
                    'Plaza Indonesia, Lantai 1 Jl. MH Thamrin, Thamrin, Jakarta Pusat',
              ),
              const ButtonSection(),
              const TextSection(
                description:
                    'Cork & Screw dikenal dengan menu makanan Eropa modern yang lezat dan beragam minuman anggurnya.'
                    'Dengan berbagai macam anggur dari beragam belahan dunia, termasuk anggur lokal dan internasional,'
                    'Moms dapat menemukan pasangan anggur yang sempurna untuk hidangan yang dipesan.'
                    'Selain itu, Ini adalah tempat yang sempurna untuk melakukan pertemuan bisnis, acara keluarga, atau makan malam romantis.',
              ),
              Column(
                children: [
                  const Text(
                    "Menu",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Ini tetap untuk berjaga-jaga
                  ),
                  const SizedBox(
                      height: 8), // Beri sedikit jarak antara teks dan grid
                  _buildGrid(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk menampilkan judul dan lokasi
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            //1
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //2
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          // #docregion icon
          Icon(Icons.star, color: Colors.red[500]),
          // #enddocregion icon
          const Text('100'),
        ],
      ),
    );
  }
}

// Widget untuk menampilkan tiga tombol aksi (Call, Route, Share)
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

// Widget untuk tombol dengan ikon dan teks di bawahnya
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// Widget untuk menampilkan teks deskripsi tempat
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

// Widget untuk menampilkan gambar dari aset
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

// Fungsi untuk membangun GridView yang responsif
Widget _buildGrid() {
  List<String> images = [
    'images/makanan1.jpg',
    'images/makanan2.jpg',
    'images/makanan3.png',
    'images/makanan4.jpg',
    'images/makanan5.jpg',
    'images/makanan6.jpg',
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
    child: LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = (constraints.maxWidth / 200).floor().clamp(1, 3);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Jumlah kolom responsif
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9, // Rasio gambar landscape agar tidak kotak
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                images[index],
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported,
                      size: 50, color: Colors.red);
                },
              ),
            );
          },
        );
      },
    ),
  );
}
