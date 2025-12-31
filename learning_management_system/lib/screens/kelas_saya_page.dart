import 'package:flutter/material.dart';
import 'quiz_page.dart';

class KelasSayaPage extends StatelessWidget {
  const KelasSayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    imagePath: 'assets/images/banners/cover_satu.jpg',
                    subjectTitle: 'Matematika Dasar',
                  ),
                  const SizedBox(height: 16),
                  KelasCard(
                    judul: 'Bahasa Inggris',
                    deskripsi: 'Meningkatkan kemampuan bahasa inggris',
                    progress: 0.4,
                    imagePath: 'assets/images/banners/cover_empat.jpg',
                    subjectTitle: 'Bahasa Inggris',
                  ),
                  const SizedBox(height: 16),
                  KelasCard(
                    judul: 'Pemrograman Dasar',
                    deskripsi: 'Dasar-dasar pemrograman komputer',
                    progress: 0.9,
                    imagePath: 'assets/images/banners/cover_satu.jpg',
                    subjectTitle: 'Pemrograman Dasar',
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

class KelasCard extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final double progress;
  final String imagePath;
  final String subjectTitle;

  const KelasCard({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.progress,
    required this.imagePath,
    required this.subjectTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(
              subjectTitle: subjectTitle,
              onProgressUpdate: () {}, // Empty function since we're not tracking progress here
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Enlarged image moved to the left
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ImageCard(imagePath: imagePath),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          judul,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          deskripsi,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 4),
              Text('${(progress * 100).toInt()}% selesai'),
            ],
          ),
        ),
      ),
    );
  }
}

// Dedicated Image Card Widget for Better Error Handling
class ImageCard extends StatelessWidget {
  final String imagePath;

  const ImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImage(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            // Image loaded successfully
            return snapshot.data!;
          } else {
            // Error loading image, show fallback
            return _buildFallbackIcon();
          }
        } else {
          // Loading state
          return _buildLoadingIndicator();
        }
      },
    );
  }

  Future<Widget?> _loadImage(BuildContext context) async {
    try {
      // Pre-cache the image
      await precacheImage(AssetImage(imagePath), context);
      
      // If successful, return the image widget
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Handle image loading errors
          return _buildFallbackIcon();
        },
      );
    } catch (e) {
      // If any error occurs, return fallback
      return _buildFallbackIcon();
    }
  }

  Widget _buildFallbackIcon() {
    return Container(
      color: Colors.red.withValues(alpha: 0.1),
      child: const Icon(
        Icons.book,
        color: Colors.red,
        size: 30,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      color: Colors.red.withValues(alpha: 0.1),
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      ),
    );
  }
}