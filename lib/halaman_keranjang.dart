import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class HalamanKeranjang extends StatefulWidget {
  const HalamanKeranjang({super.key});

  @override
  State<HalamanKeranjang> createState() => _HalamanKeranjangState();
}

class _HalamanKeranjangState extends State<HalamanKeranjang> {
  // Data Dummy Keranjang
  final List<Map<String, dynamic>> _keranjang = [
    {"nama": "Keripik Singkong Pedas", "harga": 15000, "qty": 2, "image": Colors.orange[100]},
    {"nama": "Kopi Robusta Lokal", "harga": 45000, "qty": 1, "image": Colors.brown[100]},
  ];

  String formatRupiah(int harga) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(harga);
  }

  int get _totalBelanja {
    int total = 0;
    for (var item in _keranjang) {
      total += (item['harga'] as int) * (item['qty'] as int);
    }
    return total;
  }

  void _hapusItem(int index) {
    setState(() {
      _keranjang.removeAt(index);
    });
  }

  void _checkout() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(25),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Konfirmasi Pembayaran", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Tagihan"),
                Text(formatRupiah(_totalBelanja), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Metode Bayar"),
                Text("COD (Bayar di Tempat)", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx); // Tutup sheet
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pesanan Berhasil Dibuat! Penjual akan segera memproses.")));
                  setState(() {
                    _keranjang.clear(); // Kosongkan keranjang
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  foregroundColor: Colors.white
                ),
                child: const Text("Buat Pesanan"),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      body: _keranjang.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 10),
                  const Text("Keranjang masih kosong", style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(15),
                    itemCount: _keranjang.length,
                    separatorBuilder: (ctx, i) => const Divider(),
                    itemBuilder: (context, index) {
                      final item = _keranjang[index];
                      return ListTile(
                        leading: Container(
                          width: 60, height: 60,
                          decoration: BoxDecoration(color: item['image'], borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.fastfood, color: Colors.white),
                        ),
                        title: Text(item['nama'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("${item['qty']} x ${formatRupiah(item['harga'])}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () => _hapusItem(index),
                        ),
                      );
                    },
                  ),
                ),
                // Bagian Bawah (Total & Checkout)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10, offset: const Offset(0,-5))]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Total Harga", style: TextStyle(color: Colors.grey)),
                          Text(formatRupiah(_totalBelanja), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: _checkout,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12)
                        ),
                        child: const Text("Checkout"),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}