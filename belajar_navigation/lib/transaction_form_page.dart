import 'package:flutter/material.dart';
import 'transaction_result_page.dart';

class TransactionFormPage extends StatefulWidget {
  const TransactionFormPage({super.key});

  @override
  State<TransactionFormPage> createState() => _TransactionFormPageState();
}

class _TransactionFormPageState extends State<TransactionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _selectedCarModel;
  String _paymentMethod = 'Cash';

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

  void _saveTransaction() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransactionResultPage(
            name: _nameController.text,
            address: _addressController.text,
            carModel: _selectedCarModel!,
            paymentMethod: _paymentMethod,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Transaksi')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) => value!.isEmpty ? 'Harap isi nama' : null,
              ),
              const SizedBox(height: 15), // Jarak yang lebih seragam
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) =>
                    value!.isEmpty ? 'Harap isi alamat' : null,
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _selectedCarModel,
                items: cars
                    .map((car) => DropdownMenuItem(
                          value: car,
                          child: Text(car),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedCarModel = value),
                decoration: const InputDecoration(labelText: 'Jenis Mobil'),
                validator: (value) =>
                    value == null ? 'Harap pilih jenis mobil' : null,
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _paymentMethod,
                items: ['Cash', 'Credit']
                    .map((method) =>
                        DropdownMenuItem(value: method, child: Text(method)))
                    .toList(),
                onChanged: (value) => setState(() => _paymentMethod = value!),
                decoration:
                    const InputDecoration(labelText: 'Jenis Pembayaran'),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveTransaction,
                      child: const Text('Simpan'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Kembali'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
