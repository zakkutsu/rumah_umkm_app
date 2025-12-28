import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'halaman_utama.dart';
import 'detail_produk.dart';
import 'halaman_keranjang.dart';

void main() {
  runApp(const RumahUMKMApp());
}

// Konfigurasi Routing (Agar URL di browser bersih)
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HalamanUtamaUMKM(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        // Kita ambil data produk yang dikirim lewat 'extra'
        final produkData = state.extra as Map<String, dynamic>; 
        return DetailProdukPage(produk: produkData);
      },
    ),
    GoRoute(
      path: '/keranjang',
      builder: (context, state) => const HalamanKeranjang(),
    ),
  ],
);

class RumahUMKMApp extends StatelessWidget {
  const RumahUMKMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Rumah UMKM Desa',
      debugShowCheckedModeBanner: false, // Menghilangkan banner Debug merah
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), // Tema Hijau Alam
        textTheme: GoogleFonts.poppinsTextTheme(), // Font Modern
      ),
    );
  }
}