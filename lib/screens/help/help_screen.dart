import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bantuan & FAQ"),
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
            // Header
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.help_outline, size: 60, color: Colors.green),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Pusat Bantuan",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Temukan jawaban untuk pertanyaan umum",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            const Text(
              "Pertanyaan Umum (FAQ)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            
            _buildFAQItem(
              question: "Bagaimana cara mendaftar sebagai penjual?",
              answer: "Klik tombol 'Jual Produk' di halaman utama, lalu isi formulir dengan informasi produk Anda. Produk akan langsung muncul di katalog.",
            ),
            
            _buildFAQItem(
              question: "Apakah ada biaya untuk berjualan?",
              answer: "Tidak ada! Platform Rumah UMKM 100% gratis untuk semua warga RW 05. Kami tidak memungut biaya komisi atau administrasi.",
            ),
            
            _buildFAQItem(
              question: "Bagaimana sistem pembayaran?",
              answer: "Kami mendukung pembayaran COD (Cash on Delivery) saat barang diterima, atau transfer langsung ke penjual. Hubungi penjual untuk detail pembayaran.",
            ),
            
            _buildFAQItem(
              question: "Berapa lama proses pengiriman?",
              answer: "Untuk area RW 05, biasanya 1-2 hari kerja. Untuk luar area, tergantung kesepakatan dengan penjual. Gratis ongkir untuk sesama warga!",
            ),
            
            _buildFAQItem(
              question: "Bagaimana jika produk tidak sesuai?",
              answer: "Hubungi penjual langsung melalui kontak yang tertera. Setiap penjual bertanggung jawab atas kepuasan pelanggan mereka.",
            ),
            
            _buildFAQItem(
              question: "Apakah bisa refund/return?",
              answer: "Kebijakan refund/return tergantung kebijakan masing-masing penjual. Silakan diskusikan langsung dengan penjual sebelum membeli.",
            ),
            
            _buildFAQItem(
              question: "Bagaimana cara menghubungi penjual?",
              answer: "Klik produk untuk melihat detail, di sana ada informasi toko dan kontak penjual yang bisa dihubungi langsung via WhatsApp atau telepon.",
            ),
            
            const SizedBox(height: 30),
            
            // Contact support
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Icon(Icons.support_agent, size: 50, color: Colors.blue),
                  const SizedBox(height: 15),
                  const Text(
                    "Masih Butuh Bantuan?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Tim support kami siap membantu Anda",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildContactButton(
                        icon: Icons.email,
                        label: "Email",
                        onTap: () {},
                      ),
                      const SizedBox(width: 15),
                      _buildContactButton(
                        icon: Icons.phone,
                        label: "Telepon",
                        onTap: () {},
                      ),
                      const SizedBox(width: 15),
                      _buildContactButton(
                        icon: Icons.chat,
                        label: "WhatsApp",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFAQItem({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(top: 10, bottom: 5),
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Text(
            answer,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
