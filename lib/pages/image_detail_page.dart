import 'package:flutter/material.dart';

// Halaman untuk menampilkan gambar secara penuh
class ImageDetailPage extends StatelessWidget {
  final String imageUrl; // URL gambar yang dikirim dari halaman sebelumnya

  const ImageDetailPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Gambar"), // Judul di AppBar
      ),
      backgroundColor: Colors.black, // Background hitam untuk tampilan gambar
      body: Center(
        child: InteractiveViewer( // Supaya gambar bisa di zoom dan digeser
          child: Image.network(imageUrl), // Gambar dari internet
        ),
      ),
    );
  }
}
