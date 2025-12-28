import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/product/detail_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/about/about_screen.dart';
import '../screens/about/how_to_shop_screen.dart';
import '../screens/about/partners_screen.dart';
import '../screens/help/help_screen.dart';

/// Konfigurasi routing aplikasi UMKM
/// Semua route terpusat di sini untuk maintenance mudah
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // MAIN SCREENS
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final produkData = state.extra as Map<String, dynamic>;
        return DetailScreen(produk: produkData);
      },
    ),
    GoRoute(
      path: '/keranjang',
      name: 'cart',
      builder: (context, state) => const CartScreen(),
    ),

    // FOOTER MENU SCREENS
    GoRoute(
      path: '/tentang',
      name: 'about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/cara-belanja',
      name: 'how-to-shop',
      builder: (context, state) => const HowToShopScreen(),
    ),
    GoRoute(
      path: '/mitra',
      name: 'partners',
      builder: (context, state) => const PartnersScreen(),
    ),
    GoRoute(
      path: '/bantuan',
      name: 'help',
      builder: (context, state) => const HelpScreen(),
    ),
  ],
);
