import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: StorePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

const List<Car> _cars = [
  Car(
    name: 'Tesla Model S',
    priceCents: 7999900,
    uid: '1',
    imageProvider: AssetImage("images/car1.jpg"),
  ),
  Car(
    name: 'Ford Mustang',
    priceCents: 5599900,
    uid: '2',
    imageProvider: AssetImage("images/car2.jpg"),
  ),
  Car(
    name: 'Toyota Supra',
    priceCents: 4899900,
    uid: '3',
    imageProvider: AssetImage("images/car3.jpg"),
  ),
];

@immutable
class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final List<Customer> _customers = [
    Customer(
      name: 'Monkey D. Luffy',
      imageProvider: AssetImage("images/luffy.jpg"),
    ),
    Customer(
      name: 'Roronoa Zoro',
      imageProvider: AssetImage("images/zoro.jpg"),
    ),
  ];

  void _carDroppedOnCustomer({required Car car, required Customer customer}) {
    setState(() {
      customer.cars.add(car);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Store')),
      body: Column(
        children: [
          Expanded(child: _buildCarList()),
          _buildCustomerRow(),
        ],
      ),
    );
  }

  Widget _buildCarList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _cars.length,
      itemBuilder: (context, index) {
        final car = _cars[index];

        return LongPressDraggable<Car>(
          data: car,
          feedback: Material(
            color: Colors.transparent,
            child: Image(
              image: car.imageProvider,
              width: 180, // Gambar lebih besar saat di-drag
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: car.imageProvider,
                    width: 150, // Perbesar gambar dalam daftar
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        car.formattedPrice,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCustomerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _customers.map((customer) {
        return DragTarget<Car>(
          builder: (context, candidateData, rejectedData) {
            return Column(
              children: [
                CircleAvatar(
                  backgroundImage: customer.imageProvider,
                  radius: 30,
                ),
                const SizedBox(height: 8),
                Text(customer.name),
                Text('Total: ${customer.formattedTotalPrice}')
              ],
            );
          },
          onAccept: (car) {
            _carDroppedOnCustomer(car: car, customer: customer);
          },
        );
      }).toList(),
    );
  }
}

@immutable
class Car {
  const Car(
      {required this.priceCents,
      required this.name,
      required this.uid,
      required this.imageProvider});

  final int priceCents;
  final String name;
  final String uid;
  final ImageProvider imageProvider;

  String get formattedPrice => '\$${(priceCents / 100.0).toStringAsFixed(2)}';
}

class Customer {
  Customer({required this.name, required this.imageProvider}) : cars = [];

  final String name;
  final ImageProvider imageProvider;
  final List<Car> cars;

  String get formattedTotalPrice {
    final total = cars.fold<int>(0, (sum, car) => sum + car.priceCents);
    return '\$${(total / 100.0).toStringAsFixed(2)}';
  }
}
