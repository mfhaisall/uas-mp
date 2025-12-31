import 'package:flutter/material.dart';

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

class _QuizPageState extends State<QuizPage> {
  // Store the selected answers for each question
  final Map<int, int?> _selectedAnswers = {};
  int score = 0;
  int _currentQuestionIndex = 0; // Track current question index

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question selector buttons (1-10)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (int i = 0; i < questions.length && i < 10; i++)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentQuestionIndex = i;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _currentQuestionIndex == i 
                            ? Colors.red 
                            : _selectedAnswers[i] != null 
                                ? Colors.green 
                                : Colors.grey,
                        padding: const EdgeInsets.all(8), // Smaller padding
                        minimumSize: const Size(32, 32), // Smaller size
                        shape: const CircleBorder(), // Circular shape
                      ),
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12, // Smaller font size
                        ),
                      ),
                    ),
                  // Add more buttons if there are more than 10 questions
                  if (questions.length > 10)
                    ElevatedButton(
                      onPressed: () {
                        // Show dialog for questions beyond 10
                        _showRemainingQuestionsSelector(questions.length);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(8), // Smaller padding
                        minimumSize: const Size(32, 32), // Smaller size
                        shape: const CircleBorder(), // Circular shape
                      ),
                      child: const Text(
                        '...',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12, // Smaller font size
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Progress indicator
            Row(
              children: [
                Text(
                  'Soal ${_currentQuestionIndex + 1}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  'Terjawab: ${_selectedAnswers.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: _selectedAnswers.length / questions.length,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            const SizedBox(height: 20),
            // Single question (current one)
            Expanded(
              child: SingleChildScrollView(
                child: _buildQuestionCard(_currentQuestionIndex, questions[_currentQuestionIndex]),
              ),
            ),
            const SizedBox(height: 20),
            // Submit button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedAnswers.length == questions.length
                    ? submitQuiz
                    : null, // Disable until all questions are answered
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Kumpulkan Jawaban',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show question selection dialog for questions beyond 10
  void _showRemainingQuestionsSelector(int totalQuestions) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Nomor Soal'),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
              itemCount: totalQuestions,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = index == _currentQuestionIndex;
                bool isAnswered = _selectedAnswers[index] != null;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentQuestionIndex = index;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? Colors.red 
                          : isAnswered 
                              ? Colors.green.shade100 
                              : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected 
                            ? Colors.red 
                            : isAnswered 
                                ? Colors.green 
                                : Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isSelected 
                              ? Colors.white 
                              : isAnswered 
                                  ? Colors.green 
                                  : Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildQuestionCard(int index, Map<String, dynamic> question) {
    final isSelected = _selectedAnswers[index];
    final isAnswered = isSelected != null;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soal ${index + 1}: ${question['question']}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(
              question['options'].length,
              (optionIndex) {
                final isOptionSelected = isSelected == optionIndex;
                
                Color? optionColor;

                if (isAnswered) {
                  // Only show selection state, no correct/incorrect feedback
                  optionColor = isOptionSelected ? Colors.red.shade50 : null;
                } else {
                  optionColor = isOptionSelected ? Colors.red.shade50 : null;
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: optionColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isOptionSelected ? Colors.red : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: Text(question['options'][optionIndex]),
                    trailing: isOptionSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.red,
                          )
                        : null,
                    onTap: () => selectAnswer(index, optionIndex),
                    tileColor: optionColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}