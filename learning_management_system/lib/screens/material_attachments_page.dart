import 'package:flutter/material.dart';

class MaterialAttachmentsPage extends StatefulWidget {
  final String subjectTitle;

  const MaterialAttachmentsPage({
    Key? key,
    required this.subjectTitle,
  }) : super(key: key);

  @override
  State<MaterialAttachmentsPage> createState() => _MaterialAttachmentsPageState();
}

class _MaterialAttachmentsPageState extends State<MaterialAttachmentsPage> {
  // Sample data for material attachments
  List<Map<String, dynamic>> getAttachments() {
    return [
      {
        'type': 'video',
        'title': 'Pengenalan Pemrograman',
        'description': 'Video pengenalan konsep dasar pemrograman',
        'url': 'https://example.com/video1',
        'duration': '15:30',
      },
      {
        'type': 'link',
        'title': 'Dokumentasi Python',
        'description': 'Link dokumentasi resmi Python',
        'url': 'https://docs.python.org',
      },
      {
        'type': 'image',
        'title': 'Diagram Alur Program',
        'description': 'Gambar diagram alur program sederhana',
        'url': 'https://example.com/diagram.png',
      },
      {
        'type': 'video',
        'title': 'Struktur Data Array',
        'description': 'Penjelasan tentang struktur data array',
        'url': 'https://example.com/video2',
        'duration': '22:15',
      },
      {
        'type': 'link',
        'title': 'Tutorial JavaScript',
        'description': 'Link tutorial JavaScript untuk pemula',
        'url': 'https://example.com/tutorial-js',
      },
      {
        'type': 'image',
        'title': 'Flowchart Conditional',
        'description': 'Gambar flowchart struktur kondisional',
        'url': 'https://example.com/flowchart.png',
      },
      {
        'type': 'video',
        'title': 'Fungsi dan Prosedur',
        'description': 'Penjelasan tentang fungsi dan prosedur',
        'url': 'https://example.com/video3',
        'duration': '18:45',
      },
      {
        'type': 'link',
        'title': 'Contoh Kode Sederhana',
        'description': 'Kumpulan contoh kode dasar',
        'url': 'https://example.com/code-examples',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> attachments = getAttachments();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lampiran Materi - ${widget.subjectTitle}'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lampiran Materi Tambahan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: attachments.length,
                itemBuilder: (context, index) {
                  final attachment = attachments[index];
                  return _buildAttachmentCard(attachment);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentCard(Map<String, dynamic> attachment) {
    IconData icon;
    Color iconColor;
    
    switch (attachment['type']) {
      case 'video':
        icon = Icons.video_library;
        iconColor = Colors.red;
        break;
      case 'link':
        icon = Icons.link;
        iconColor = Colors.blue;
        break;
      case 'image':
        icon = Icons.image;
        iconColor = Colors.green;
        break;
      default:
        icon = Icons.insert_drive_file;
        iconColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Simulate opening the attachment
          _openAttachment(attachment);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            attachment['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (attachment['duration'] != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              attachment['duration'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      attachment['description'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getTypeColor(attachment['type']).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _getTypeLabel(attachment['type']),
                            style: TextStyle(
                              fontSize: 12,
                              color: _getTypeColor(attachment['type']),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'video':
        return Colors.red;
      case 'link':
        return Colors.blue;
      case 'image':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _getTypeLabel(String type) {
    switch (type) {
      case 'video':
        return 'Video';
      case 'link':
        return 'Link';
      case 'image':
        return 'Gambar';
      default:
        return 'File';
    }
  }

  void _openAttachment(Map<String, dynamic> attachment) {
    // Simulate opening the attachment based on type
    String message = '';
    switch (attachment['type']) {
      case 'video':
        message = 'Memutar video: ${attachment['title']}';
        break;
      case 'link':
        message = 'Membuka link: ${attachment['url']}';
        break;
      case 'image':
        message = 'Menampilkan gambar: ${attachment['title']}';
        break;
      default:
        message = 'Membuka file: ${attachment['title']}';
    }

    // Show a simple dialog to indicate the action
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Membuka Lampiran'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}