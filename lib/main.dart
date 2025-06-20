// Import library Flutter dan file internal
import 'package:flutter/material.dart'; // UI toolkit utama
import 'theme.dart'; // File custom tema warna (merah, oranye, dll)
import 'pages/home_page.dart'; // Halaman pertama aplikasi

void main() {
  runApp(const RasaNusantaraApp()); // Fungsi utama untuk menjalankan aplikasi
}

// Widget utama aplikasi
class RasaNusantaraApp extends StatelessWidget {
  const RasaNusantaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rasa Nusantara', // Nama aplikasi di task manager Android
      debugShowCheckedModeBanner: false, // Menghilangkan banner "DEBUG"
      theme: AppTheme.lightTheme, // Gunakan tema dari theme.dart
      home: const HomePage(), // Halaman pertama saat app dibuka
    );
  }
}
