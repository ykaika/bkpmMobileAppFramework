import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {
  const CarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cars = [
      "Honda Civic 1972",
      "Honda Civic EG6",
      "Honda Civic EK9 Type R",
      "Honda Civic FD2 Type R",
      "Honda Civic FB",
      "Honda Civic FC",
      "Honda Civic FK8 Type R",
      "Honda Civic FE",
      "Honda Civic Si",
      "Honda Civic Mugen RR",
      "Honda Civic Ferio",
      "Honda Civic Wonder",
      "Honda Civic Estilo",
      "Honda Civic Shuttle",
      "Honda Civic Hybrid",
      "Honda Civic Tourer"
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Jenis Mobil di Garasi:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.directions_car),
                  title: Text(cars[index]),
                  subtitle: Text("Model tahun ${(2000 + index).toString()}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CarDetailPage(carName: cars[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CarDetailPage extends StatelessWidget {
  final String carName;

  const CarDetailPage({super.key, required this.carName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(carName)),
      body: Center(
        child: Text(
          "Detail informasi tentang $carName",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
