import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final partners = [
      {"name": "Dapur Bu Siti", "category": "Makanan", "since": "2023", "products": 8},
      {"name": "Kopi Tani Sejahtera", "category": "Minuman", "since": "2022", "products": 5},
      {"name": "Butik Desa", "category": "Fashion", "since": "2024", "products": 12},
      {"name": "Kriya Mandiri", "category": "Kerajinan", "since": "2023", "products": 15},
      {"name": "Santri Creative", "category": "Jasa", "since": "2024", "products": 3},
      {"name": "Kue Mama Ina", "category": "Kue & Camilan", "since": "2023", "products": 10},
      {"name": "Kebun Pak Jarwo", "category": "Hasil Bumi", "since": "2022", "products": 6},
      {"name": "Bibit Subur", "category": "Tanaman", "since": "2024", "products": 8},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Mitra UMKM"),
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
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF43A047), Color(0xFF66BB6A)],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Icon(Icons.handshake, size: 60, color: Colors.white),
                  const SizedBox(height: 15),
                  const Text(
                    "Mitra UMKM Kami",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Bergabunglah dengan ${partners.length}+ mitra UMKM yang telah mempercayai platform kami",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            const Text(
              "Mitra Aktif",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            
            // Partner List
            ...partners.map((partner) => _buildPartnerCard(
              name: partner["name"] as String,
              category: partner["category"] as String,
              since: partner["since"] as String,
              products: partner["products"] as int,
            )).toList(),
            
            const SizedBox(height: 30),
            
            // CTA untuk daftar mitra
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: Column(
                children: [
                  const Icon(Icons.store, size: 50, color: Colors.green),
                  const SizedBox(height: 15),
                  const Text(
                    "Ingin Jadi Mitra?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Bergabunglah dengan komunitas UMKM kami dan jangkau lebih banyak pelanggan!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.app_registration),
                    label: const Text("Daftar Sekarang"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPartnerCard({
    required String name,
    required String category,
    required String since,
    required int products,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
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
      child: Row(
        children: [
          // Icon/Avatar
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.store, color: Colors.green, size: 30),
          ),
          const SizedBox(width: 15),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.category, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 5),
                    Text(
                      category,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 15),
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 5),
                    Text(
                      "Sejak $since",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.inventory, size: 14, color: Colors.green[700]),
                    const SizedBox(width: 5),
                    Text(
                      "$products Produk",
                      style: TextStyle(fontSize: 12, color: Colors.green[700], fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Badge/Icon
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Aktif",
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
