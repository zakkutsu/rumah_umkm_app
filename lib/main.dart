import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'routes/app_router.dart';
import 'utils/auth_service.dart';
import 'utils/cart_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize auth service
  final authService = AuthService();
  await authService.initialize();
  
  // Initialize cart service
  final cartService = CartService();
  await cartService.initialize();
  
  runApp(RumahUMKMApp(
    authService: authService,
    cartService: cartService,
  ));
}

class RumahUMKMApp extends StatelessWidget {
  final AuthService authService;
  final CartService cartService;
  
  const RumahUMKMApp({
    super.key, 
    required this.authService,
    required this.cartService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authService),
        ChangeNotifierProvider.value(value: cartService),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.createRouter(authService),
        title: 'Rumah UMKM Desa',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
      ),
    );
  }
}