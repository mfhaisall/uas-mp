import 'package:flutter/material.dart';
import '../main.dart'; // Import main to access MainScreen
import '../auth/login_screen.dart'; // Import login screen

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const AboutMeTab(),
    const KelasTab(),
    const EditProfilTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Top Bar with User Icon and Name (Responsive Height)
            Container(
              // Use flexible height instead of fixed height to prevent overflow
              constraints: const BoxConstraints(minHeight: 80, maxHeight: 150),
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    // Centered user info with responsive icon
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          // Reduced radius for better fit
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.red,
                            // Reduced icon size
                            size: 25,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Nama Pengguna',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'user@example.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    // Spacer to balance the layout
                    const SizedBox(width: 48),
                  ],
                ),
              ),
            ),
            // Wizard Navigation (Tabs) - Centered and responsive
            Container(
              height: 60,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: Center(
                child: Container(
                  // Use constrained width instead of fixed width to prevent overflow
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTabButton('About Me', 0),
                      _buildTabButton('Kelas', 1),
                      _buildTabButton('Edit Profil', 2),
                    ],
                  ),
                ),
              ),
            ),
            // Tab Content
            Expanded(
              child: _tabs[_currentIndex],
            ),
          ],
        ),
      ),
      // Add modern bottom navigation bar to profile page with red background and white icons/text
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.red, // Red background
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined),
                activeIcon: Icon(Icons.school),
                label: 'Kelas Saya',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                activeIcon: Icon(Icons.notifications),
                label: 'Notifikasi',
              ),
            ],
            currentIndex: 0, // Always show as if we're on the home page
            selectedItemColor: Colors.white, // White for selected items
            unselectedItemColor: Colors.white70, // Light white for unselected items
            backgroundColor: Colors.transparent, // Transparent to show container background
            elevation: 0, // Remove default elevation
            onTap: (index) {
              // Navigate back to main screen with selected tab
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (route) => false,
              );
            },
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
      ),
      // Floating Logout Button - only visible when on About Me tab
      floatingActionButton: _currentIndex == 0
          ? Container(
              margin: const EdgeInsets.only(bottom: 20), // Reduced bottom margin to position closer to bottom navigation
              child: FloatingActionButton(
                onPressed: _showLogoutDialog,
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildTabButton(String title, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _currentIndex == index ? Colors.red : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: _currentIndex == index ? FontWeight.bold : FontWeight.normal,
                color: _currentIndex == index ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to login page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

// About Me Tab Content
class AboutMeTab extends StatelessWidget {
  const AboutMeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Reduced padding to prevent overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Pribadi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const _ProfileDetailItem(
                    icon: Icons.person,
                    label: 'Nama Lengkap',
                    value: 'Nama Pengguna',
                  ),
                  const _ProfileDetailItem(
                    icon: Icons.email,
                    label: 'Email',
                    value: 'user@example.com',
                  ),
                  const _ProfileDetailItem(
                    icon: Icons.phone,
                    label: 'Nomor Telepon',
                    value: '+62 812 3456 7890',
                  ),
                  const _ProfileDetailItem(
                    icon: Icons.calendar_today,
                    label: 'Tanggal Lahir',
                    value: '1 Januari 1990',
                  ),
                  const _ProfileDetailItem(
                    icon: Icons.location_on,
                    label: 'Alamat',
                    value: 'Jl. Merdeka No. 123, Jakarta',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Kelas Tab Content
class KelasTab extends StatelessWidget {
  const KelasTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kelas yang Diikuti',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: const [
                _KelasItem(
                  namaKelas: 'Matematika Dasar',
                  progress: 0.75,
                  dosen: 'Dr. Budi Santoso',
                ),
                SizedBox(height: 16),
                _KelasItem(
                  namaKelas: 'Bahasa Inggris',
                  progress: 0.45,
                  dosen: 'Prof. Maria Dewi',
                ),
                SizedBox(height: 16),
                _KelasItem(
                  namaKelas: 'Pemrograman Dasar',
                  progress: 0.90,
                  dosen: 'Ir. Andi Prasetyo',
                ),
                SizedBox(height: 16),
                _KelasItem(
                  namaKelas: 'Fisika Dasar',
                  progress: 0.30,
                  dosen: 'Dr. Siti Rahayu',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Edit Profil Tab Content
class EditProfilTab extends StatefulWidget {
  const EditProfilTab({super.key});

  @override
  State<EditProfilTab> createState() => _EditProfilTabState();
}

class _EditProfilTabState extends State<EditProfilTab> {
  final TextEditingController _nameController = TextEditingController(text: 'Nama Pengguna');
  final TextEditingController _emailController = TextEditingController(text: 'user@example.com');
  final TextEditingController _phoneController = TextEditingController(text: '+62 812 3456 7890');
  final TextEditingController _birthController = TextEditingController(text: '1 Januari 1990');
  final TextEditingController _addressController = TextEditingController(text: 'Jl. Merdeka No. 123, Jakarta');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Reduced padding to prevent overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Edit Profil',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Nomor Telepon',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _birthController,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Lahir',
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _addressController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Alamat',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20), // Space before button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Save profile changes
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Profil berhasil diperbarui'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Simpan Perubahan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Helper Widgets
class _ProfileDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileDetailItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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

class _KelasItem extends StatelessWidget {
  final String namaKelas;
  final double progress;
  final String dosen;

  const _KelasItem({
    required this.namaKelas,
    required this.progress,
    required this.dosen,
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
              namaKelas,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              dosen,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 8),
            Text('${(progress * 100).toInt()}% Selesai'),
          ],
        ),
      ),
    );
  }
}