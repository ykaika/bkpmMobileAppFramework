import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Pengguna')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/bang windah.jpg"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Papa Brando", // Nama pengguna
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "bocilabsen@gmail.com", // Email pengguna
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
              child: const Text('Edit Profil'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showEmailValidationDialog(context);
              },
              child: const Text('Apakah email valid?'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEmailValidationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Apakah email valid?"),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Tutup pop-up
                _showSnackbar(context, "Yep!");
              },
              child: const Text("Yep!"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Tutup pop-up
                _showSnackbar(context, "Perbarui email Anda!");
              },
              child: const Text("Nope."),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text( '$message')));
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: const Center(
        child: Text(
          "Ini halaman edit profil",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}