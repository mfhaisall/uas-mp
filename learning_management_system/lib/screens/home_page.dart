import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Progress tracking for each subject
  final Map<String, double> _subjectProgress = {
    'Matematika Dasar': 0.75,
    'Bahasa Inggris': 0.45,
    'Pemrograman Dasar': 0.90,
    'Fisika Dasar': 0.30,
  };

  // Update progress for a subject
  void _updateProgress(String subject) {
    setState(() {
      // Increase progress by 10%, capped at 100%
      _subjectProgress[subject] = 
          (_subjectProgress[subject]! + 0.1).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Modern Custom Top Bar with responsive design
          Container(
            // Use flexible height instead of fixed height to prevent overflow
            constraints: const BoxConstraints(minHeight: 70, maxHeight: 100),
            decoration: BoxDecoration(
              color: Colors.red, // Keep the red color
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // Soft shadow for depth
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Welcome text with improved styling
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome,',
                        style: TextStyle(
                          color: Colors.white70, // Slightly lighter for better hierarchy
                          fontSize: 13,
                          fontWeight: FontWeight.w400, // Lighter weight
                        ),
                      ),
                      const SizedBox(height: 2), // Reduced spacing
                      const Text(
                        'Nama User',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Slightly smaller for better fit
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3, // Subtle letter spacing
                        ),
                      ),
                    ],
                  ),
                  // Profile avatar with modern styling
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
                    child: Container(
                      width: 40, // Slightly smaller
                      height: 40, // Slightly smaller
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12), // Slightly smaller radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.red,
                        size: 20, // Slightly smaller icon
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Image/Banner
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: 150,
                        color: Colors.redAccent,
                        child: Stack(
                          children: [
                            // Background gradient
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.red,
                                    Colors.deepOrange,
                                  ],
                                ),
                              ),
                            ),
                            // Decorative circles
                            Positioned(
                              top: -20,
                              right: -20,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withValues(alpha: 0.1),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -30,
                              left: -30,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withValues(alpha: 0.1),
                                ),
                              ),
                            ),
                            // Content
                            const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.school,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Learning Management System',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Upcoming Tasks Section
                    const Text(
                      'Tugas yang Akan Datang',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              subjectTitle: 'Matematika Dasar',
                              onProgressUpdate: () => _updateProgress('Matematika Dasar'),
                            ),
                          ),
                        );
                      },
                      child: TaskCard(
                        title: 'Tugas Matematika',
                        subject: 'Matematika Dasar',
                        dueDate: 'Besok, 10:00 AM',
                        priority: 'Tinggi',
                        imagePath: 'assets/images/banners/cover_satu.jpg',
                        progress: _subjectProgress['Matematika Dasar']!,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              subjectTitle: 'Essay Bahasa Inggris',
                              onProgressUpdate: () => _updateProgress('Bahasa Inggris'),
                            ),
                          ),
                        );
                      },
                      child: TaskCard(
                        title: 'Essay Bahasa Inggris',
                        subject: 'Bahasa Inggris',
                        dueDate: 'Jumat, 14:00 PM',
                        priority: 'Sedang',
                        imagePath: 'assets/images/banners/cover_dua.jpg',
                        progress: _subjectProgress['Bahasa Inggris']!,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Latest Announcements Section
                    const Text(
                      'Pengumuman Terakhir',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AnnouncementCard(
                      title: 'Libur Hari Raya',
                      content: 'Kampus akan libur selama seminggu mulai tanggal 1 Mei 2023',
                      date: '2 hari yang lalu',
                    ),
                    const SizedBox(height: 16),
                    AnnouncementCard(
                      title: 'Jadwal Ujian Akhir',
                      content: 'Jadwal ujian akhir semester telah diumumkan',
                      date: '5 hari yang lalu',
                    ),
                    const SizedBox(height: 32),
                    // Class Progress Section
                    const Text(
                      'Progres Kelas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              subjectTitle: 'Matematika Dasar',
                              onProgressUpdate: () => _updateProgress('Matematika Dasar'),
                            ),
                          ),
                        );
                      },
                      child: ProgressCard(
                        className: 'Matematika Dasar',
                        progress: _subjectProgress['Matematika Dasar']!,
                        teacher: 'Dr. Budi Santoso',
                        imagePath: 'assets/images/banners/cover_tiga.jpg',
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              subjectTitle: 'Bahasa Inggris',
                              onProgressUpdate: () => _updateProgress('Bahasa Inggris'),
                            ),
                          ),
                        );
                      },
                      child: ProgressCard(
                        className: 'Bahasa Inggris',
                        progress: _subjectProgress['Bahasa Inggris']!,
                        teacher: 'Prof. Maria Dewi',
                        imagePath: 'assets/images/banners/cover_empat.jpg',
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              subjectTitle: 'Pemrograman Dasar',
                              onProgressUpdate: () => _updateProgress('Pemrograman Dasar'),
                            ),
                          ),
                        );
                      },
                      child: ProgressCard(
                        className: 'Pemrograman Dasar',
                        progress: _subjectProgress['Pemrograman Dasar']!,
                        teacher: 'Ir. Andi Prasetyo',
                        imagePath: 'assets/images/banners/cover_satu.jpg',
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              subjectTitle: 'Fisika Dasar',
                              onProgressUpdate: () => _updateProgress('Fisika Dasar'),
                            ),
                          ),
                        );
                      },
                      child: ProgressCard(
                        className: 'Fisika Dasar',
                        progress: _subjectProgress['Fisika Dasar']!,
                        teacher: 'Dr. Siti Rahayu',
                        imagePath: 'assets/images/banners/cover_dua.jpg',
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Task Card Widget
class TaskCard extends StatelessWidget {
  final String title;
  final String subject;
  final String dueDate;
  final String priority;
  final String imagePath;
  final double progress;

  const TaskCard({
    super.key,
    required this.title,
    required this.subject,
    required this.dueDate,
    required this.priority,
    required this.imagePath,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  width: 60, // Increased from 40 to 60
                  height: 60, // Increased from 40 to 60
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), // Slightly larger radius
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
                const SizedBox(width: 16), // Increased spacing
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subject,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8), // Added spacing
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            dueDate,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: priority == 'Tinggi' ? Colors.red : Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    priority,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // Increased spacing
            // Progress bar for tasks
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              minHeight: 8, // Increased from 6 to 8
              borderRadius: BorderRadius.circular(4), // Increased from 3 to 4
            ),
            const SizedBox(height: 4),
            Text(
              '${(progress * 100).toInt()}% Completed',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Announcement Card Widget
class AnnouncementCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Progress Card Widget
class ProgressCard extends StatelessWidget {
  final String className;
  final double progress;
  final String teacher;
  final String imagePath;

  const ProgressCard({
    super.key,
    required this.className,
    required this.progress,
    required this.teacher,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  width: 60, // Increased from 40 to 60
                  height: 60, // Increased from 40 to 60
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), // Slightly larger radius
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
                const SizedBox(width: 16), // Increased spacing
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        className,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        teacher,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Progress bar
                      LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                        minHeight: 8, // Increased from 8 to 10
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 4),
                      Text('${(progress * 100).toInt()}% Completed'),
                    ],
                  ),
                ),
              ],
            ),
          ],
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
        Icons.book, // More relevant icon for course materials
        color: Colors.red,
        size: 30, // Increased icon size to match larger container
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      color: Colors.red.withValues(alpha: 0.1),
      child: const Center(
        child: SizedBox(
          width: 24, // Increased size
          height: 24, // Increased size
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      ),
    );
  }
}