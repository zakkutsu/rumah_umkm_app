import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HowToShopScreen extends StatelessWidget {
  const HowToShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cara Belanja"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(Icons.shopping_cart, size: 80, color: Colors.green[300]),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Panduan Belanja di Rumah UMKM",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            
            _buildStep(
              number: 1,
              title: "Jelajahi Produk",
              description: "Lihat berbagai produk UMKM lokal dengan memilih kategori yang Anda inginkan. Filter berdasarkan Makanan, Minuman, Fashion, Kerajinan, dan lainnya.",
              icon: Icons.search,
            ),
            
            _buildStep(
              number: 2,
              title: "Pilih Produk",
              description: "Klik produk yang menarik untuk melihat detail lengkap, harga, dan informasi penjual. Pastikan Anda membaca deskripsi dengan teliti.",
              icon: Icons.touch_app,
            ),
            
            _buildStep(
              number: 3,
              title: "Tambah ke Keranjang",
              description: "Tekan tombol 'Tambah ke Keranjang' untuk menyimpan produk pilihan Anda. Anda bisa melanjutkan belanja produk lain.",
              icon: Icons.add_shopping_cart,
            ),
            
            _buildStep(
              number: 4,
              title: "Review Keranjang",
              description: "Buka keranjang belanja untuk melihat semua produk yang sudah dipilih. Anda bisa mengubah jumlah atau menghapus item.",
              icon: Icons.shopping_basket,
            ),
            
            _buildStep(
              number: 5,
              title: "Checkout & Pesan",
              description: "Klik 'Checkout' dan pilih metode pengiriman: COD (Cash on Delivery) atau Ambil Sendiri di lokasi penjual.",
              icon: Icons.payment,
            ),
            
            _buildStep(
              number: 6,
              title: "Konfirmasi & Terima Pesanan",
              description: "Penjual akan menghubungi Anda untuk konfirmasi pesanan. Tunggu produk diantarkan atau ambil sendiri sesuai kesepakatan.",
              icon: Icons.check_circle,
            ),
            
            const SizedBox(height: 30),
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Icon(Icons.local_shipping, size: 40, color: Colors.green),
                  const SizedBox(height: 10),
                  const Text(
                    "Gratis Ongkir Sesama Warga!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Khusus untuk warga RW 05, nikmati gratis ongkir untuk pembelian minimum Rp 50.000",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStep({
    required int number,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number circle
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "$number",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
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
