import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'routes/app_router.dart';
import 'utils/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize auth service
  final authService = AuthService();
  await authService.initialize();
  
  runApp(RumahUMKMApp(authService: authService));
}

class RumahUMKMApp extends StatelessWidget {
  final AuthService authService;
  
  const RumahUMKMApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authService,
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