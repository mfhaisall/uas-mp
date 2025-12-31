import 'package:flutter/material.dart';

class TaskDetailPage extends StatefulWidget {
  final String subjectTitle;
  final String taskTitle;
  final String taskDescription;
  final String dueDate;

  const TaskDetailPage({
    Key? key,
    required this.subjectTitle,
    required this.taskTitle,
    required this.taskDescription,
    required this.dueDate,
  }) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  bool _isFileUploaded = false;

  @override
  Widget build(BuildContext context) {
    String taskDetail = _getTaskDetail(widget.subjectTitle);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectTitle),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Title
              Text(
                widget.taskTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Task Description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deskripsi Tugas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.taskDescription,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Perintah Tugas:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      taskDetail,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // Due Date
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Batas Waktu:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.dueDate,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // Upload Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upload Tugas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // File Upload Card
                    Card(
                      elevation: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.insert_drive_file,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _isFileUploaded 
                                        ? 'tugas_siswa.pdf' 
                                        : 'Belum ada file diupload',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  if (_isFileUploaded)
                                    const Text(
                                      'Terakhir diupload: 10 menit yang lalu',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {
                                // Simulate file upload
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Upload Tugas'),
                                      content: const Text('File berhasil diupload!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              _isFileUploaded = true;
                                            });
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                              child: const Text(
                                'Upload',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isFileUploaded
                      ? () {
                          // Show submission confirmation
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Kumpulkan Tugas'),
                                content: const Text('Apakah Anda yakin ingin mengumpulkan tugas ini?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      // Show success message
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Tugas Terkumpulkan'),
                                            content: const Text('Tugas Anda telah berhasil dikumpulkan.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Kumpulkan'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      : null, // Disable if no file uploaded
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFileUploaded ? Colors.green : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Kumpulkan Tugas',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
  
  String _getTaskDetail(String subjectTitle) {
    switch (subjectTitle) {
      case 'Matematika Dasar':
        return 'Kerjakan soal-soal berikut ini dengan langkah-langkah yang jelas:\n1. Hitung luas dan keliling lingkaran dengan jari-jari 7 cm\n2. Selesaikan persamaan kuadrat: x² - 5x + 6 = 0\n3. Buat grafik fungsi linear f(x) = 2x + 3';
      case 'Bahasa Inggris':
        return 'Tulis esai pendek (150-200 kata) tentang:\n1. Pengalaman liburan terbaik Anda\n2. Gunakan minimal 10 kosakata baru yang telah dipelajari\n3. Sertakan struktur esai yang benar (pendahuluan, isi, penutup)';
      case 'Pemrograman Dasar':
        return 'Buat program sederhana menggunakan bahasa pemrograman pilihan Anda:\n1. Program kalkulator sederhana (tambah, kurang, kali, bagi)\n2. Program untuk mengecek bilangan prima\n3. Program untuk menghitung faktorial';
      case 'Fisika Dasar':
        return 'Selesaikan soal-soal berikut:\n1. Hitung kecepatan akhir benda yang jatuh bebas dari ketinggian 20m\n2. Jelaskan hukum Newton I, II, dan III dengan contoh\n3. Hitung energi kinetik mobil dengan massa 1000kg yang bergerak 20m/s';
      default:
        return 'Kerjakan tugas yang diberikan oleh dosen/ guru mata pelajaran ini.\nIkuti petunjuk yang telah diberikan di kelas atau modul pembelajaran.\nPastikan untuk menyelesaikan tugas dengan teliti dan tepat waktu.';
    }
  }
}