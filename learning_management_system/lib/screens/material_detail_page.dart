import 'package:flutter/material.dart';
import 'material_attachments_page.dart';
import 'task_detail_page.dart';
import 'full_quiz_page.dart';

class MaterialDetailPage extends StatefulWidget {
  final int meetingNumber;
  final String meetingTitle;

  const MaterialDetailPage({
    Key? key,
    required this.meetingNumber,
    required this.meetingTitle,
  }) : super(key: key);

  @override
  State<MaterialDetailPage> createState() => _MaterialDetailPageState();
}

class _MaterialDetailPageState extends State<MaterialDetailPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan ${widget.meetingNumber}'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Material description
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.meetingTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Deskripsi materi untuk pertemuan ${widget.meetingNumber}. '
                  'Pada pertemuan ini akan dibahas tentang konsep-konsep dasar dari ${widget.meetingTitle.toLowerCase()}. '
                  'Peserta diharapkan memahami konsep utama dan dapat menerapkannya dalam contoh sederhana.',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Wizard Navigation (Tabs) - Lampiran Materi, Tugas dan Kuis
          Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Lampiran Materi'),
                Tab(text: 'Tugas dan Kuis'),
              ],
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.red,
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          // Main Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Lampiran Materi Tab - Navigate to attachments page
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lampiran Materi',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.video_library,
                                    color: Colors.red,
                                  ),
                                ),
                                title: const Text('Video Materi'),
                                subtitle: const Text('Kumpulan video penjelasan materi'),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MaterialAttachmentsPage(
                                        subjectTitle: widget.meetingTitle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.link,
                                    color: Colors.blue,
                                  ),
                                ),
                                title: const Text('Referensi Online'),
                                subtitle: const Text('Link referensi dan dokumentasi'),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MaterialAttachmentsPage(
                                        subjectTitle: widget.meetingTitle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.image,
                                    color: Colors.green,
                                  ),
                                ),
                                title: const Text('Gambar dan Diagram'),
                                subtitle: const Text('Gambar ilustrasi dan diagram'),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MaterialAttachmentsPage(
                                        subjectTitle: widget.meetingTitle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Tugas dan Kuis Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tugas dan Kuis',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.assignment,
                                    color: Colors.orange,
                                  ),
                                ),
                                title: const Text('Tugas'),
                                subtitle: const Text('Kerjakan tugas yang diberikan'),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  // Navigate to task detail page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskDetailPage(
                                        subjectTitle: widget.meetingTitle,
                                        taskTitle: 'Tugas ${widget.meetingTitle}',
                                        taskDescription: 'Ini adalah tugas untuk pertemuan ${widget.meetingNumber}. Kerjakan dengan teliti dan kumpulkan sebelum batas waktu.',
                                        dueDate: '14 Januari 2025',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.quiz,
                                    color: Colors.purple,
                                  ),
                                ),
                                title: const Text('Kuis'),
                                subtitle: const Text('Kerjakan kuis untuk menguji pemahaman'),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  // Navigate to full quiz page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullQuizPage(
                                        subjectTitle: widget.meetingTitle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




