import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/product/detail_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/about/about_screen.dart';
import '../screens/about/how_to_shop_screen.dart';
import '../screens/about/partners_screen.dart';
import '../screens/help/help_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/orders/orders_screen.dart';
import '../screens/store/store_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/open_store_screen.dart';

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

    // AUTH SCREENS
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/buka-toko',
      name: 'open-store',
      builder: (context, state) => const OpenStoreScreen(),
    ),

    // PROFILE MENU SCREENS
    GoRoute(
      path: '/profil',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/pesanan',
      name: 'orders',
      builder: (context, state) => const OrdersScreen(),
    ),
    GoRoute(
      path: '/toko',
      name: 'store',
      builder: (context, state) => const StoreScreen(),
    ),
    GoRoute(
      path: '/pengaturan',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
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
