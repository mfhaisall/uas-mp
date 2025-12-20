import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  // Language state: true for Indonesian, false for English
  bool isIndonesian = true;

  // Toggle language
  void _toggleLanguage() {
    setState(() {
      isIndonesian = !isIndonesian;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button and language toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Kembali',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Flag icons for language toggle
                  Row(
                    children: [
                      // Indonesia flag button
                      ElevatedButton(
                        onPressed: () {
                          if (!isIndonesian) {
                            _toggleLanguage();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isIndonesian ? Colors.red : Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                              child: const Center(
                                child: Text(
                                  'ID',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Bahasa Indonesia',
                              style: TextStyle(
                                color: isIndonesian ? Colors.white : Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // English flag button
                      ElevatedButton(
                        onPressed: () {
                          if (isIndonesian) {
                            _toggleLanguage();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !isIndonesian ? Colors.red : Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text(
                                  'EN',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'English',
                              style: TextStyle(
                                color: !isIndonesian ? Colors.white : Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                isIndonesian ? 'Tentang Aplikasi' : 'About Application',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                isIndonesian
                    ? 'Learning Management System adalah aplikasi yang dirancang untuk membantu pengelolaan pembelajaran secara digital. Aplikasi ini menyediakan berbagai fitur yang memudahkan siswa dan pengajar dalam proses belajar mengajar.'
                    : 'Learning Management System is an application designed to assist in digital learning management. This application provides various features that make it easier for students and teachers in the teaching and learning process.',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                isIndonesian ? 'Fitur Utama:' : 'Main Features:',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.school, color: Colors.red),
                title: Text(isIndonesian ? 'Manajemen Kelas' : 'Class Management'),
                subtitle: Text(
                    isIndonesian ? 'Kelola dan ikuti berbagai kelas dengan mudah' : 'Manage and follow various classes easily'),
              ),
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.red),
                title: Text(isIndonesian ? 'Notifikasi' : 'Notifications'),
                subtitle: Text(
                    isIndonesian ? 'Terima pemberitahuan penting tentang kelas dan tugas' : 'Receive important notifications about classes and assignments'),
              ),
              ListTile(
                leading: const Icon(Icons.assignment, color: Colors.red),
                title: Text(isIndonesian ? 'Tugas dan Penilaian' : 'Assignments and Grading'),
                subtitle: Text(
                    isIndonesian ? 'Kelola tugas dan lihat hasil penilaian' : 'Manage assignments and view grading results'),
              ),
              ListTile(
                leading: const Icon(Icons.forum, color: Colors.red),
                title: Text(isIndonesian ? 'Diskusi' : 'Discussion'),
                subtitle: Text(
                    isIndonesian ? 'Berinteraksi dengan sesama peserta kelas' : 'Interact with fellow class participants'),
              ),
              const SizedBox(height: 30),
              Text(
                isIndonesian ? 'Cara Menggunakan Aplikasi:' : 'How to Use the Application:',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                isIndonesian
                    ? '1. Login menggunakan email dan password yang telah terdaftar'
                    : '1. Log in using your registered email and password',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                isIndonesian
                    ? '2. Setelah login, Anda akan diarahkan ke halaman beranda'
                    : '2. After logging in, you will be directed to the home page',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                isIndonesian
                    ? '3. Gunakan menu navigasi di bawah untuk berpindah antar halaman'
                    : '3. Use the navigation menu at the bottom to switch between pages',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                isIndonesian
                    ? '4. Di halaman "Kelas Saya", Anda dapat melihat daftar kelas yang diikuti'
                    : '4. On the "My Classes" page, you can view a list of classes you are enrolled in',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                isIndonesian
                    ? '5. Di halaman "Notifikasi", Anda dapat melihat pemberitahuan terbaru'
                    : '5. On the "Notifications" page, you can view the latest notifications',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Text(
                isIndonesian ? 'Bantuan Tambahan:' : 'Additional Help:',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                isIndonesian
                    ? 'Jika Anda mengalami kesulitan dalam menggunakan aplikasi ini, silakan hubungi administrator sistem atau kirim email ke support@lms.example.com'
                    : 'If you experience difficulties using this application, please contact the system administrator or send an email to support@lms.example.com',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}