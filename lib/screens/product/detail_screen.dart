import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> produk;

  const DetailScreen({super.key, required this.produk});

  String formatRupiah(int harga) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(harga);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar Transparan agar gambar terlihat full di atas (opsional, tapi keren)
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.pop(), // Kembali ke halaman utama
          ),
        ),
      ),
      body: Column(
        children: [
          // --- 1. GAMBAR PRODUK BESAR ---
          Expanded(
            flex: 4, // Mengambil 40% layar
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: produk['image'], // Warna placeholder dari data dummy
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Center(
                child: Icon(Icons.shopping_bag, size: 100, color: Colors.white.withOpacity(0.5)),
              ),
            ),
          ),
          
          // --- 2. INFORMASI PRODUK ---
          Expanded(
            flex: 6, // Mengambil 60% layar
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label Toko
                  Row(
                    children: [
                      const Icon(Icons.store, size: 18, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(produk['toko'], style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  
                  // Nama Produk & Harga
                  Text(produk['nama'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(
                    formatRupiah(produk['harga']), 
                    style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold)
                  ),
                  
                  const SizedBox(height: 25),
                  const Divider(),
                  const SizedBox(height: 15),

                  // Deskripsi
                  const Text("Deskripsi Produk", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "Produk asli buatan warga RW 05. Dibuat dengan bahan berkualitas dan higienis. Dukung produk lokal untuk memajukan ekonomi desa kita.",
                    style: TextStyle(color: Colors.black54, height: 1.5),
                  ),

                  const Spacer(), // Dorong tombol ke bawah

                  // Tombol Beli & Chat
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.chat),
                          label: const Text("Chat Penjual"),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            side: const BorderSide(color: Colors.green),
                            foregroundColor: Colors.green
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Barang berhasil dimasukkan keranjang!")));
                          },
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("Beli Sekarang"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}