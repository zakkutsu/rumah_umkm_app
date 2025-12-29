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
import '../utils/auth_service.dart';

/// Konfigurasi routing aplikasi UMKM dengan Route Guards
class AppRouter {
  static GoRouter createRouter(AuthService authService) {
    return GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final user = authService.currentUser;
        final isGuest = user.isGuest;
        
        // Protected routes yang butuh login
        final protectedRoutes = ['/profil', '/pesanan', '/pengaturan', '/keranjang'];
        final sellerOnlyRoutes = ['/toko'];
        final customerOnlyRoutes = ['/buka-toko'];
        
        // Guest tidak bisa akses protected routes
        if (isGuest && protectedRoutes.any((route) => state.matchedLocation.startsWith(route))) {
          return '/login';
        }
        
        // Seller only routes
        if (!user.isSeller && sellerOnlyRoutes.any((route) => state.matchedLocation.startsWith(route))) {
          return '/profil'; // Redirect ke profile jika bukan seller
        }
        
        // Customer only routes (buka toko hanya untuk customer, bukan seller)
        if (user.isSeller && customerOnlyRoutes.any((route) => state.matchedLocation.startsWith(route))) {
          return '/toko'; // Redirect ke toko jika sudah seller
        }
        
        return null; // No redirect
      },
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
  }
}
