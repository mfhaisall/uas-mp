import 'package:flutter/material.dart';

class FullQuizPage extends StatefulWidget {
  final String subjectTitle;
  final VoidCallback? onProgressUpdate;

  const FullQuizPage({
    Key? key,
    required this.subjectTitle,
    this.onProgressUpdate,
  }) : super(key: key);

  @override
  State<FullQuizPage> createState() => _FullQuizPageState();
}

class _FullQuizPageState extends State<FullQuizPage> {
  // Store the selected answers for each question
  final Map<int, int?> _selectedAnswers = {};
  int _currentQuestionIndex = 0;
  int score = 0;

  // Sample questions for different subjects
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
        {
          'question': 'Apa bentuk sederhana dari 8/12?',
          'options': ['2/3', '3/4', '4/5', '1/2'],
          'correctAnswer': 0,
        },
        {
          'question': 'Berapa derajat sudut siku-siku?',
          'options': ['45°', '90°', '180°', '360°'],
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
          'options': ['if-else', 'String', 'int', 'boolean'],
          'correctAnswer': 0,
        },
      ],
      'Fisika Dasar': [
        {
          'question': 'Apa satuan dari gaya dalam sistem internasional?',
          'options': ['Joule', 'Newton', 'Watt', 'Pascal'],
          'correctAnswer': 1,
        },
        {
          'question': 'Berapa kecepatan cahaya dalam ruang hampa (dalam jutaan m/s)?',
          'options': ['299', '300', '301', '302'],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa hukum pertama Newton menyatakan?',
          'options': [
            'Gaya aksi = gaya reaksi',
            'F = ma',
            'Kelembaman',
            'Energi kekal'
          ],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa satuan dari energi?',
          'options': ['Newton', 'Joule', 'Watt', 'Ampere'],
          'correctAnswer': 1,
        },
        {
          'question': 'Berapa percepatan gravitasi bumi (dalam m/s²)?',
          'options': ['9.8', '10.0', '8.9', '9.6'],
          'correctAnswer': 0,
        },
        {
          'question': 'Apa nama alat untuk mengukur tekanan?',
          'options': ['Termometer', 'Barometer', 'Ammeter', 'Voltmeter'],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa hukum kekekalan energi menyatakan?',
          'options': [
            'Energi bisa diciptakan',
            'Energi bisa dimusnahkan',
            'Energi tidak bisa diciptakan atau dimusnahkan',
            'Energi selalu bertambah'
          ],
          'correctAnswer': 2,
        },
        {
          'question': 'Apa satuan dari daya?',
          'options': ['Joule', 'Watt', 'Newton', 'Volt'],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa nama partikel dasar penyusun atom?',
          'options': ['Molekul', 'Proton, Neutron, Elektron', 'Ion', 'Senyawa'],
          'correctAnswer': 1,
        },
        {
          'question': 'Apa nama hukum yang menyatakan bahwa energi tidak dapat diciptakan atau dimusnahkan?',
          'options': ['Hukum Termodinamika I', 'Hukum Termodinamika II', 'Hukum Newton', 'Hukum Coulomb'],
          'correctAnswer': 0,
        },
      ],
    };
  }

  List<Map<String, dynamic>> get currentQuestions {
    return getQuestionsBySubject()[widget.subjectTitle] ?? [];
  }

  void _selectOption(int questionIndex, int optionIndex) {
    setState(() {
      _selectedAnswers[questionIndex] = optionIndex;
    });
  }

  void _submitQuiz() {
    int correctAnswers = 0;
    for (int i = 0; i < currentQuestions.length; i++) {
      if (_selectedAnswers[i] != null && 
          _selectedAnswers[i] == currentQuestions[i]['correctAnswer']) {
        correctAnswers++;
      }
    }
    
    score = ((correctAnswers / currentQuestions.length) * 100).round();
    
    // Call the progress update callback if provided
    if (widget.onProgressUpdate != null) {
      widget.onProgressUpdate!();
    }
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kuis Selesai!'),
          content: Text(
            'Skor Anda: $score%\n'
            'Jawaban benar: $correctAnswers dari ${currentQuestions.length} soal',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Close the quiz page as well
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Kuis - ${widget.subjectTitle}'),
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
          child: Text('Tidak ada soal tersedia untuk mata pelajaran ini.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis - ${widget.subjectTitle}'),
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
            // Filter buttons (circular number buttons)
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: currentQuestions.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedAnswers[index] != null;
                  bool isCurrent = index == _currentQuestionIndex;
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentQuestionIndex = index;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isCurrent 
                            ? Colors.red 
                            : isSelected 
                              ? Colors.green 
                              : Colors.grey.shade300,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isCurrent ? Colors.white : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: isCurrent 
                                ? Colors.white 
                                : isSelected 
                                  ? Colors.white 
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            
            // Progress indicator
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / currentQuestions.length,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            const SizedBox(height: 8),
            Text(
              'Soal ${_currentQuestionIndex + 1} dari ${currentQuestions.length}',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            
            // Current question
            Text(
              currentQuestions[_currentQuestionIndex]['question'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            
            // Options
            ...List.generate(
              currentQuestions[_currentQuestionIndex]['options'].length,
              (index) {
                bool isSelected = _selectedAnswers[_currentQuestionIndex] == index;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onTap: () => _selectOption(_currentQuestionIndex, index),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected 
                          ? Colors.red.shade50 
                          : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected 
                            ? Colors.red 
                            : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? Colors.red : Colors.grey,
                                width: isSelected ? 2 : 1,
                              ),
                              color: isSelected ? Colors.red : Colors.transparent,
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              currentQuestions[_currentQuestionIndex]['options'][index],
                              style: TextStyle(
                                color: isSelected ? Colors.red : Colors.black,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            
            // Submit button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Check if all questions are answered
                  bool allAnswered = true;
                  for (int i = 0; i < currentQuestions.length; i++) {
                    if (_selectedAnswers[i] == null) {
                      allAnswered = false;
                      break;
                    }
                  }
                  
                  if (allAnswered) {
                    _submitQuiz();
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Peringatan'),
                          content: const Text('Masih ada soal yang belum dijawab. Apakah Anda yakin ingin mengumpulkan kuis?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _submitQuiz();
                              },
                              child: const Text('Lanjutkan'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Kumpulkan Kuis',
                  style: TextStyle(
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
    );
  }
}