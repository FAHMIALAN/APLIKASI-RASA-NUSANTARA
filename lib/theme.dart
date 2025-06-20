import 'package:flutter/material.dart';

// Kelas statis untuk menyimpan tema global aplikasi
class AppTheme {
  // Getter untuk tema terang (light mode)
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white, // Warna latar belakang utama
      primaryColor: Colors.red, // Warna utama default

      // Skema warna lengkap menggunakan seedColor (Material 3)
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange, // Warna dasar untuk turunan warna
        primary: Colors.red, // Warna utama
        secondary: Colors.orange, // Warna aksen sekunder
        surface: Colors.white, // Latar permukaan seperti card
        onPrimary: Colors.white, // Warna teks di atas warna primer
        onSecondary: Colors.black, // Warna teks di atas warna sekunder
      ),

      // Tema untuk AppBar (bar atas)
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red, // Warna latar AppBar
        foregroundColor: Colors.white, // Warna teks/icon di AppBar
        elevation: 0, // Tanpa bayangan
      ),

      // Tema default untuk ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange, // Warna tombol
          foregroundColor: Colors.white, // Warna teks tombol
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)), // Tombol melengkung
          ),
        ),
      ),

      // Tema default teks
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black), // Teks utama biasa
        titleLarge: TextStyle(
          color: Colors.red, // Judul besar berwarna merah
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      useMaterial3: true, // Aktifkan Material You (Material 3)
    );
  }
}
