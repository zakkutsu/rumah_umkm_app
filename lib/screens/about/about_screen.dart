import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Kami"),
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
            // Header dengan ikon
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.storefront, size: 80, color: Colors.green),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Rumah UMKM RW 05",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Platform Digital Pemberdayaan UMKM Lokal",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Visi & Misi
            _buildSection(
              "Visi Kami",
              "Menjadi platform digital terdepan yang memberdayakan UMKM lokal untuk meningkatkan kesejahteraan ekonomi warga RW 05.",
            ),
            
            const SizedBox(height: 20),
            
            _buildSection(
              "Misi Kami",
              "• Memfasilitasi UMKM lokal untuk memasarkan produk secara digital\n"
              "• Menghubungkan produsen lokal dengan konsumen di lingkungan sekitar\n"
              "• Meningkatkan literasi digital pelaku UMKM\n"
              "• Mendorong ekonomi sirkular berbasis komunitas",
            ),
            
            const SizedBox(height: 20),
            
            _buildSection(
              "Cerita Kami",
              "Rumah UMKM RW 05 lahir dari semangat gotong royong warga untuk saling mendukung ekonomi lokal. "
              "Dimulai dari pasar tumpah rutin setiap minggu, kini kami hadir dalam bentuk digital agar lebih mudah diakses kapan saja, di mana saja.\n\n"
              "Dari warga, oleh warga, untuk warga.",
            ),
            
            const SizedBox(height: 40),
            
            // Statistics
            Row(
              children: [
                Expanded(child: _buildStatCard("150+", "Produk", Icons.inventory_2)),
                const SizedBox(width: 15),
                Expanded(child: _buildStatCard("50+", "Mitra UMKM", Icons.store)),
                const SizedBox(width: 15),
                Expanded(child: _buildStatCard("2000+", "Transaksi", Icons.shopping_bag)),
              ],
            ),
            
            const SizedBox(height: 40),
            
            // Contact
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    "Hubungi Kami",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  _buildContactRow(Icons.email, "umkm.rw05@gmail.com"),
                  _buildContactRow(Icons.phone, "+62 812-3456-7890"),
                  _buildContactRow(Icons.location_on, "Balai RW 05, Desa Makmur"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: 15, height: 1.6, color: Colors.grey[800]),
        ),
      ],
    );
  }
  
  Widget _buildStatCard(String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.green, size: 30),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
