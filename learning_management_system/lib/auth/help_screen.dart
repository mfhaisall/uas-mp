import 'package:flutter/material.dart';
import 'login_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Bantuan'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Learning Management System adalah aplikasi yang dirancang untuk membantu pengelolaan pembelajaran secara digital. Aplikasi ini menyediakan berbagai fitur yang memudahkan siswa dan pengajar dalam proses belajar mengajar.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Fitur Utama:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.school, color: Colors.red),
                title: Text('Manajemen Kelas'),
                subtitle: Text('Kelola dan ikuti berbagai kelas dengan mudah'),
              ),
              const ListTile(
                leading: Icon(Icons.notifications, color: Colors.red),
                title: Text('Notifikasi'),
                subtitle: Text('Terima pemberitahuan penting tentang kelas dan tugas'),
              ),
              const ListTile(
                leading: Icon(Icons.assignment, color: Colors.red),
                title: Text('Tugas dan Penilaian'),
                subtitle: Text('Kelola tugas dan lihat hasil penilaian'),
              ),
              const ListTile(
                leading: Icon(Icons.forum, color: Colors.red),
                title: Text('Diskusi'),
                subtitle: Text('Berinteraksi dengan sesama peserta kelas'),
              ),
              const SizedBox(height: 30),
              const Text(
                'Cara Menggunakan Aplikasi:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Login menggunakan email dan password yang telah terdaftar',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                '2. Setelah login, Anda akan diarahkan ke halaman beranda',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                '3. Gunakan menu navigasi di bawah untuk berpindah antar halaman',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                '4. Di halaman "Kelas Saya", Anda dapat melihat daftar kelas yang diikuti',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                '5. Di halaman "Notifikasi", Anda dapat melihat pemberitahuan terbaru',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              const Text(
                'Bantuan Tambahan:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Jika Anda mengalami kesulitan dalam menggunakan aplikasi ini, silakan hubungi administrator sistem atau kirim email ke support@lms.example.com',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Kembali ke Login',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}