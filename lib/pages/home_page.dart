import 'package:flutter/material.dart';
import 'gallery_page.dart'; // Import halaman galeri makanan

// Widget utama untuk halaman beranda aplikasi
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang halaman, krem lembut
      backgroundColor: const Color(0xFFFEECE4),

      // SafeArea untuk memastikan UI tidak terkena area sistem (notch, status bar)
      body: SafeArea(
        // Center agar semua isi berada di tengah halaman secara horizontal
        child: Center(
          // Column untuk menyusun widget secara vertikal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertikal: tengah
            mainAxisSize: MainAxisSize.max, // Gunakan seluruh tinggi layar

            children: [
              // Gambar utama (intro) yang diambil dari lokal (assets)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(
                  'assets/images/intro.png', // Path ke file gambar
                  height: 240, // Tinggi gambar
                ),
              ),

              const SizedBox(height: 24), // Spacer agar ada jarak bawah gambar

              // Baris bulatan indikator (seperti onboarding slider)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  // Loop 4 kali untuk membuat bulatan kecil
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: index == 2 ? 12 : 8, // Bulatan ke-3 lebih besar
                    height: index == 2 ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 2 ? Colors.orange : Colors.grey[400],
                    ),
                  );
                }),
              ),

              const SizedBox(height: 30), // Spacer bawah titik indikator

              // Judul besar aplikasi
              const Text(
                "RASA NUSANTARA", // Teks judul aplikasi
                style: TextStyle(
                  fontSize: 28, // Ukuran font besar
                  fontWeight: FontWeight.bold, // Tebal
                  color: Colors.black87, // Warna teks
                ),
              ),

              const SizedBox(height: 10), // Spacer antara teks dan tombol

              // Tombol navigasi ke halaman galeri
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Warna tombol
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32, // Padding dalam tombol horizontal
                    vertical: 14, // Padding dalam tombol vertikal
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Sudut tombol membulat
                  ),
                ),
                onPressed: () {
                  // Aksi ketika tombol ditekan → buka GalleryPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GalleryPage()),
                  );
                },
                child: const Text(
                  'MULAI', // Teks pada tombol
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white, // Warna teks tombol
                  ),
                ),
              ),

              const SizedBox(height: 16), // Spacer antara tombol dan teks deskripsi

              // Teks deskripsi singkat aplikasi
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Eksplorasi aneka makanan tradisional khas Indonesia dari Sabang sampai Merauke.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54, // Abu-abu soft
                    height: 1.5, // Spasi antar baris teks
                  ),
                  textAlign: TextAlign.center, // Tengah secara horizontal
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
