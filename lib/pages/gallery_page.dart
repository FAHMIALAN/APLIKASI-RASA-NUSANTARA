import 'package:flutter/material.dart';
import '../services/unsplash_service.dart'; // Import service untuk ambil gambar dari Unsplash

// Halaman galeri makanan Indonesia
class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  // Menyimpan list URL gambar
  final List<String> _images = [];

  // Kontrol scroll agar bisa mendeteksi posisi user
  final ScrollController _scrollController = ScrollController();

  // Untuk pagination (mulai dari halaman 1)
  int _currentPage = 1;

  // Jumlah gambar per halaman
  final int _perPage = 5;

  // Status loading (true saat sedang ambil data)
  bool _isLoading = false;

  // Daftar query pencarian untuk variasi gambar makanan
  final List<String> _queries = [
    'indonesian food',
    'makanan indonesia',
    'masakan nusantara'
  ];

  @override
  void initState() {
    super.initState();
    _fetchImages(); // Ambil gambar pertama kali saat halaman dibuka

    // Deteksi apakah scroll sudah mendekati bawah
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading) {
        _fetchImages(); // Ambil gambar tambahan saat scroll ke bawah
      }
    });
  }

  // Fungsi ambil gambar dari Unsplash (multi-query)
  Future<void> _fetchImages() async {
    setState(() => _isLoading = true); // Set loading true agar bisa tampilkan spinner

    try {
      // Ambil gambar baru dari Unsplash berdasarkan query
      final newImages = await UnsplashService.fetchImagesMultiQuery(
        queries: _queries,
        page: _currentPage,
        perPage: _perPage,
      );

      setState(() {
        _images.addAll(newImages); // Tambahkan ke list
        _currentPage++; // Naikkan halaman
      });
    } catch (e) {
      debugPrint("Error loading images: $e"); // Debug kalau error
    } finally {
      setState(() => _isLoading = false); // Selesai loading
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Buang controller saat widget dihapus
    super.dispose();
  }

  // Fungsi untuk membuka gambar dalam ukuran penuh
  void _showFullImage(String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text("Foto Makanan")),
          backgroundColor: Colors.black,
          body: Center(
            child: Hero(
              tag: imageUrl, // Hero animation dengan tag unik
              child: InteractiveViewer(
                child: Image.network(imageUrl), // Gambar dari URL
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galeri Makanan Indonesia")),

      // GridView menampilkan gambar dalam format grid 2 kolom
      body: GridView.builder(
        controller: _scrollController, // Hubungkan scroll controller
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom = 2
          crossAxisSpacing: 10, // Jarak antar kolom
          mainAxisSpacing: 10, // Jarak antar baris
        ),
        itemCount: _images.length + (_isLoading ? 1 : 0), // Tambah 1 kalau sedang loading
        itemBuilder: (context, index) {
          if (index < _images.length) {
            final imageUrl = _images[index];

            return GestureDetector(
              onTap: () => _showFullImage(imageUrl), // Klik buka gambar besar
              child: Hero(
                tag: imageUrl, // Hero animation
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover, // Biar gambar ngepas kotak
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error), // Kalau gagal load gambar
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator()); // Spinner loading di akhir
          }
        },
      ),
    );
  }
}
