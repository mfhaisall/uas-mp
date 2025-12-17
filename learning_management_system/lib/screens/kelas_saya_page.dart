import 'package:flutter/material.dart';
import '../auth/login_screen.dart';

class KelasSayaPage extends StatelessWidget {
  const KelasSayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Saya'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kelas Saya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Daftar kelas yang sedang Anda ikuti.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  KelasCard(
                    judul: 'Matematika Dasar',
                    deskripsi: 'Pengenalan konsep matematika dasar',
                    progress: 0.7,
                  ),
                  const SizedBox(height: 16),
                  KelasCard(
                    judul: 'Bahasa Inggris',
                    deskripsi: 'Meningkatkan kemampuan bahasa inggris',
                    progress: 0.4,
                  ),
                  const SizedBox(height: 16),
                  KelasCard(
                    judul: 'Pemrograman Dasar',
                    deskripsi: 'Dasar-dasar pemrograman komputer',
                    progress: 0.9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to login page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

class KelasCard extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final double progress;

  const KelasCard({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(deskripsi),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            const SizedBox(height: 8),
            Text('${(progress * 100).toInt()}% selesai'),
          ],
        ),
      ),
    );
  }
}