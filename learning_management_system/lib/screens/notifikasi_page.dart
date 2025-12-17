import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifikasi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Daftar notifikasi terbaru.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  NotifikasiCard(
                    judul: 'Tugas Baru',
                    deskripsi: 'Anda memiliki tugas baru yang harus diselesaikan',
                    waktu: '2 jam yang lalu',
                  ),
                  const SizedBox(height: 16),
                  NotifikasiCard(
                    judul: 'Kelas Dimulai',
                    deskripsi: 'Kelas Matematika Dasar akan dimulai dalam 30 menit',
                    waktu: '5 jam yang lalu',
                  ),
                  const SizedBox(height: 16),
                  NotifikasiCard(
                    judul: 'Nilai Telah Diperbarui',
                    deskripsi: 'Nilai ujian tengah semester telah diterbitkan',
                    waktu: '1 hari yang lalu',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotifikasiCard extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final String waktu;

  const NotifikasiCard({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.waktu,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
            shape: BoxShape.circle,
          ),
        ),
        title: Text(
          judul,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(deskripsi),
            const SizedBox(height: 4),
            Text(
              waktu,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}