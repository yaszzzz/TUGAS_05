import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class TestStorage extends StatefulWidget {
  const TestStorage({super.key});

  @override
  State<TestStorage> createState() => _TestStorageState();
}

class _TestStorageState extends State<TestStorage> {
  final TextEditingController _controller = TextEditingController();
  final GetStorage _box = GetStorage();
  String _hasil = '';
  int _bottomNavIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.save,
    Icons.storage,
    Icons.person,
  ];

  Future<void> _simpanData() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    await _box.write('data_input', text);
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Data berhasil disimpan!')));
  }

  void _tampilkanData() {
    final saved = _box.read('data_input');
    setState(() => _hasil = saved ?? '(Belum ada data)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Storage'), centerTitle: true),

      // ✅ konten utama berganti berdasarkan tab
      body: IndexedStack(
        index: _bottomNavIndex,
        children: [
          _buildMainContent(),
          Center(child: Text('Halaman Simpan')),
          Center(child: Text('Halaman Storage')),
          Center(child: Text('Profil Pengguna')),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _simpanData,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // ✅ bottom navigation bar
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }

  // ✅ Tampilan utama
  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Halo 👋',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan sesuatu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _simpanData, child: const Text('Simpan')),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _tampilkanData,
              child: const Text('Tampilkan'),
            ),
            const SizedBox(height: 20),
            Text(
              'Data tersimpan: $_hasil',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
