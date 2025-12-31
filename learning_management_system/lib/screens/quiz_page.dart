import 'package:flutter/material.dart';
import 'material_detail_page.dart';
import 'full_quiz_page.dart';
import 'task_detail_page.dart';

class QuizPage extends StatefulWidget {
  final String subjectTitle;
  final VoidCallback onProgressUpdate;

  const QuizPage({
    super.key,
    required this.subjectTitle,
    required this.onProgressUpdate,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  // Store the selected answers for each question
  final Map<int, int?> _selectedAnswers = {};
  int score = 0;
  int _currentTabIndex = 1; // Default to Tugas dan Kuis tab (index 1)

  // Sample questions for different subjects (more questions now)
  Map<String, List<Map<String, dynamic>>> getQuestionsBySubject() {
    return {
      'Matematika Dasar': [
        {
          'question': 'Berapa hasil dari 2 + 2?',
          'options': ['3', '4', '5', '6'],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa rumus luas persegi?',
          'options': ['Panjang × Lebar', 'Sisi × Sisi', '½ × Alas × Tinggi', 'π × r²'],
          'correctAnswer': 1,
        },
        {
          'question': 'Berapa nilai π (pi) yang umum digunakan?',
          'options': ['3.14', '2.71', '1.41', '1.73'],
          'correctAnswer': 0,
        },
        {
          'question': 'Berapa hasil dari 15 - 7?',
          'options': ['6', '7', '8', '9'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa hasil dari 6 × 7?',
          'options': ['40', '42', '44', '46'],
          'correctAnswer': 1,
        },
        {
          'question': 'Berapa akar kuadrat dari 64?',
          'options': ['6', '7', '8', '9'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa nama bangun datar yang memiliki 3 sisi?',
          'options': ['Persegi', 'Segitiga', 'Lingkaran', 'Persegi Panjang'],
          'correctAnswer': 1,
        },
        {
          'question': 'Berapa hasil dari 100 ÷ 5?',
          'options': ['15', '20', '25', '30'],
          'correctAnswer': 1,
        },
      ],
      'Bahasa Inggris': [
        {
          'question': 'Apa arti kata "Hello" dalam bahasa Indonesia?',
          'options': ['Terima kasih', 'Halo', 'Maaf', 'Selamat tinggal'],
          'correctAnswer': 1,
        },
        {
          'question': 'Mana yang merupakan bentuk lampau dari kata "go"?',
          'options': ['goes', 'going', 'went', 'gone'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa lawan kata dari "happy"?',
          'options': ['excited', 'joyful', 'sad', 'cheerful'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa arti kata "book" dalam bahasa Indonesia?',
          'options': ['Buku', 'Pensil', 'Penghapus', 'Tas'],
          'correctAnswer': 0,
        },
        {
          'question': 'Mana yang merupakan vokal dalam bahasa Inggris?',
          'options': ['B', 'C', 'D', 'A'],
          'correctAnswer': 3,
        },
        {
          'question': 'Apa bentuk jamak dari "child"?',
          'options': ['childs', 'children', 'childes', 'childies'],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa arti kata "water" dalam bahasa Indonesia?',
          'options': ['Api', 'Tanah', 'Udara', 'Air'],
          'correctAnswer': 3,
        },
        {
          'question': 'Mana yang merupakan kata kerja?',
          'options': ['Beautiful', 'Quickly', 'Run', 'Happiness'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa arti kata "cat" dalam bahasa Indonesia?',
          'options': ['Anjing', 'Kucing', 'Burung', 'Ikan'],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa huruf kelima dalam alfabet Inggris?',
          'options': ['D', 'E', 'F', 'G'],
          'correctAnswer': 1,
        },
      ],
      'Pemrograman Dasar': [
        {
          'question': 'Mana yang bukan bahasa pemrograman?',
          'options': ['Python', 'Java', 'HTML', 'Microsoft'],
          'correctAnswer': 3,
        },
        {
          'question': 'Apa fungsi dari variabel dalam pemrograman?',
          'options': [
            'Menyimpan data',
            'Membuat tampilan',
            'Menghubungkan database',
            'Menjalankan program'
          ],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa singkatan dari OOP?',
          'options': [
            'Object Oriented Programming',
            'Output Oriented Processing',
            'Online Operating Program',
            'Open Office Platform'
          ],
          'correctAnswer': 0,
        },
        {
          'question': 'Mana yang merupakan tipe data numerik?',
          'options': ['String', 'Boolean', 'Integer', 'Character'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa fungsi dari perintah "print()"?',
          'options': [
            'Membaca input',
            'Menampilkan output',
            'Menyimpan data',
            'Menghitung nilai'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa arti dari istilah "loop" dalam pemrograman?',
          'options': [
            'Percabangan',
            'Perulangan',
            'Fungsi',
            'Variabel'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Mana yang merupakan operator perbandingan?',
          'options': ['+', '-', '==', '*'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa kepanjangan dari HTML?',
          'options': [
            'Hyper Text Markup Language',
            'High Tech Modern Language',
            'Home Tool Markup Language',
            'Hyperlink Text Markup Language'
          ],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa fungsi dari komentar dalam kode?',
          'options': [
            'Mengeksekusi program',
            'Menjelaskan kode',
            'Menyimpan data',
            'Menghitung nilai'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Mana yang merupakan struktur kontrol?',
          'options': ['Variable', 'Array', 'If-Else', 'Function'],
          'correctAnswer': 2,
        },
      ],
      'Fisika Dasar': [
        {
          'question': 'Apa satuan SI untuk Gaya?',
          'options': ['Joule', 'Newton', 'Watt', 'Pascal'],
          'correctAnswer': 1,
        },
        {
          'question': 'Siapa ilmuwan yang menemukan hukum gravitasi?',
          'options': [
            'Albert Einstein',
            'Isaac Newton',
            'Galileo Galilei',
            'Nikola Tesla'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa satuan energi dalam SI?',
          'options': ['Volt', 'Ampere', 'Joule', 'Ohm'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa yang dimaksud dengan gerak lurus beraturan?',
          'options': [
            'Kecepatan berubah',
            'Kecepatan tetap',
            'Percepatan tetap',
            'Percepatan berubah'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa satuan untuk mengukur suhu?',
          'options': ['Joule', 'Meter', 'Kelvin', 'Kilogram'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa yang dimaksud dengan massa jenis?',
          'options': [
            'Massa per volume',
            'Volume per massa',
            'Berat per tinggi',
            'Tinggi per berat'
          ],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa bunyi hukum I Newton?',
          'options': [
            'Gaya aksi = Gaya reaksi',
            'Benda diam/moving lurus beraturan jika resultan Gaya = 0',
            'Percepatan berbanding lurus dengan gaya',
            'Energi tidak dapat diciptakan'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa satuan daya dalam SI?',
          'options': ['Newton', 'Joule', 'Watt', 'Pascal'],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa yang dimaksud dengan kalor jenis?',
          'options': [
            'Kalor untuk menaikkan suhu 1°C',
            'Kalor untuk menaikkan suhu 1 kg zat 1°C',
            'Kalor untuk mengubah wujud',
            'Kalor untuk pemanasan'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa prinsip kerja tuas?',
          'options': [
            'Mengurangi gaya',
            'Mengubah arah gaya',
            'Mengalikan gaya',
            'Semua benar'
          ],
          'correctAnswer': 3,
        },
      ],
      'Essay Bahasa Inggris': [
        {
          'question': 'Apa fungsi utama dari paragraf pembuka dalam esai?',
          'options': [
            'Menyimpulkan argumen',
            'Memperkenalkan topik',
            'Memberikan contoh',
            'Menyatakan opini'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Mana yang merupakan struktur esai yang benar?',
          'options': [
            'Pembuka, Isi, Penutup',
            'Isi, Pembuka, Penutup',
            'Penutup, Isi, Pembuka',
            'Pembuka, Penutup, Isi'
          ],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa tujuan utama menulis esai?',
          'options': [
            'Menghibur pembaca',
            'Menampilkan pengetahuan',
            'Meyakinkan pembaca',
            'Semua jawaban benar'
          ],
          'correctAnswer': 3,
        },
        {
          'question': 'Berapa paragraf ideal dalam esai pendek?',
          'options': ['3-5 paragraf', '5-7 paragraf', '7-9 paragraf', '9-11 paragraf'],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa fungsi kalimat penjelas dalam paragraf?',
          'options': [
            'Menyatakan ide pokok',
            'Menutup paragraf',
            'Mendukung ide pokok',
            'Mengalihkan topik'
          ],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa yang dimaksud dengan koherensi dalam esai?',
          'options': [
            'Hubungan logis antar kalimat',
            'Penggunaan kosakata baik',
            'Panjang kalimat seragam',
            'Tata bahasa benar'
          ],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa fungsi dari kalimat transisi?',
          'options': [
            'Memulai esai',
            'Menghubungkan ide',
            'Menutup paragraf',
            'Menyatakan pendapat'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa yang harus dicantumkan dalam daftar pustaka?',
          'options': [
            'Judul esai',
            'Sumber referensi',
            'Nama penulis',
            'Tanggal penulisan'
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa yang dimaksud dengan tesis dalam esai?',
          'options': [
            'Argumen utama',
            'Kesimpulan',
            'Pendahuluan',
            'Referensi'
          ],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa perbedaan antara esai argumentatif dan naratif?',
          'options': [
            'Panjang tulisan',
            'Tujuan dan struktur',
            'Jumlah paragraf',
            'Penggunaan bahasa'
          ],
          'correctAnswer': 1,
        },
      ],
    };
  }

  List<Map<String, dynamic>> getCurrentQuestions() {
    final questionsMap = getQuestionsBySubject();
    return questionsMap[widget.subjectTitle] ?? [];
  }

  void selectAnswer(int questionIndex, int answerIndex) {
    setState(() {
      _selectedAnswers[questionIndex] = answerIndex;
    });
  }

  void submitQuiz() {
    final questions = getCurrentQuestions();
    int newScore = 0;

    for (int i = 0; i < questions.length; i++) {
      if (_selectedAnswers[i] != null && 
          _selectedAnswers[i] == questions[i]['correctAnswer']) {
        newScore++;
      }
    }

    setState(() {
      score = newScore;
    });

    showResult();
  }

  void showResult() {
    final questions = getCurrentQuestions();
    final percentage = (score / questions.length) * 100;

    // Update progress when quiz is completed
    widget.onProgressUpdate();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hasil Kuis'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'Anda menjawab $score dari ${questions.length} pertanyaan dengan benar'),
              const SizedBox(height: 10),
              Text('Nilai: ${percentage.toStringAsFixed(1)}%'),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: percentage / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  percentage >= 75
                      ? Colors.green
                      : percentage >= 50
                          ? Colors.orange
                          : Colors.red,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to home
              },
              child: const Text('Kembali ke Beranda'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final questions = getCurrentQuestions();

    if (questions.isEmpty) {
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
        body: const Center(
          child: Text('Soal tidak tersedia untuk mata pelajaran ini.'),
        ),
      );
    }

    // Initialize the TabController
    TabController tabController = TabController(length: 2, vsync: this, initialIndex: _currentTabIndex);

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
      body: Column(
        children: [
          // Wizard Navigation (Tabs) - Materi, Tugas dan Kuis
          Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: TabBar(
              controller: tabController,
              onTap: (index) {
                setState(() {
                  _currentTabIndex = index;
                });
              },
              tabs: const [
                Tab(text: 'Materi'),
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
              controller: tabController,
              children: [
                // Materi Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Materi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 8, // 8 meetings
                          itemBuilder: (context, index) {
                            // Define specific programming titles for each meeting
                            List<String> programmingTitles = [
                              'Pengenalan Pemrograman',
                              'Struktur Data Dasar',
                              'Fungsi dan Prosedur',
                              'Pengulangan dan Perulangan',
                              'Array dan Matriks',
                              'Konsep Object-Oriented Programming',
                              'Pengenalan Algoritma',
                              'Debugging dan Testing'
                            ];
                            
                            String title = (index < programmingTitles.length) 
                                ? programmingTitles[index] 
                                : 'Materi Pertemuan ${index + 1}';
                            
                            return Card(
                              margin: const EdgeInsets.only(bottom: 16),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Pertemuan ${index + 1}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    const Icon(
                                      Icons.book,
                                      size: 40,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        title,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.arrow_forward_ios, size: 16),
                                      onPressed: () {
                                        // Navigate to material detail page
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MaterialDetailPage(
                                              meetingNumber: index + 1,
                                              meetingTitle: title,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                      const Text(
                        'Pilih aktivitas:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        elevation: 4,
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
                              Icons.assignment,
                              color: Colors.blue,
                            ),
                          ),
                          title: const Text(
                            'Tugas',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text('Kerjakan tugas yang diberikan'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskDetailPage(
                                  subjectTitle: widget.subjectTitle,
                                  taskTitle: 'Tugas ${widget.subjectTitle}',
                                  taskDescription: 'Ini adalah tugas untuk mata pelajaran ${widget.subjectTitle}. Kerjakan dengan teliti dan kumpulkan sebelum batas waktu.',
                                  dueDate: '14 Januari 2025',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        elevation: 4,
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
                              Icons.quiz,
                              color: Colors.green,
                            ),
                          ),
                          title: const Text(
                            'Kuis',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text('Kerjakan kuis untuk menguji pemahaman'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullQuizPage(
                                  subjectTitle: widget.subjectTitle,
                                  onProgressUpdate: widget.onProgressUpdate,
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
    );
  }

}