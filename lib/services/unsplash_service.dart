import 'dart:convert'; // Untuk decoding JSON dari API
import 'package:http/http.dart' as http; // Untuk request HTTP ke Unsplash API

class UnsplashService {
  // Kunci API dari Unsplash (harus disimpan dengan aman untuk produksi)
  static const String _accessKey = 'tGyiacjJ-KUEgcqWmRPgtgeAMjvj-5qnC5svYT3hhxk';

  // Fungsi untuk mengambil gambar dari beberapa query sekaligus
  static Future<List<String>> fetchImagesMultiQuery({
    required List<String> queries, // List query seperti: ['indonesian food', 'makanan indonesia']
    int page = 1, // Nomor halaman (pagination)
    int perPage = 5, // Jumlah gambar per query per halaman
  }) async {
    final List<String> allImages = []; // Menampung semua URL gambar yang berhasil diambil

    // Loop untuk masing-masing query
    for (String query in queries) {
      final url = Uri.parse(
        // Membuat URL endpoint untuk request ke Unsplash
        'https://api.unsplash.com/search/photos?page=$page&per_page=$perPage&query=$query&client_id=$_accessKey',
      );

      final response = await http.get(url); // Mengirim GET request ke Unsplash

      if (response.statusCode == 200) {
        // Jika request sukses
        final data = json.decode(response.body); // Decode JSON response
        final List results = data['results']; // Ambil list hasil pencarian

        // Ambil URL gambar kecil (small) dari setiap item
        allImages.addAll(results
            .map<String>((item) => item['urls']['small'] as String)
            .toList());
      }
    }

    // Kembalikan seluruh URL gambar yang dikumpulkan
    return allImages;
  }
}
