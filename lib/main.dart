// lib/main.dart
import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shared/theme/colors.dart';
import 'core/DI/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;

    final poppinsText = GoogleFonts.poppinsTextTheme(baseTextTheme);

    final mergedTextTheme = poppinsText.copyWith(
      displayLarge: GoogleFonts.abhayaLibre(
        textStyle: poppinsText.displayLarge,
      ),
      displayMedium: GoogleFonts.abhayaLibre(
        textStyle: poppinsText.displayMedium,
      ),
      displaySmall: GoogleFonts.abhayaLibre(
        textStyle: poppinsText.displaySmall,
      ),
      headlineLarge: GoogleFonts.abhayaLibre(
        textStyle: poppinsText.headlineLarge,
      ),
      headlineMedium: GoogleFonts.abhayaLibre(
        textStyle: poppinsText.headlineMedium,
      ),
      headlineSmall: GoogleFonts.abhayaLibre(
        textStyle: poppinsText.headlineSmall,
      ),
      titleLarge: GoogleFonts.abhayaLibre(textStyle: poppinsText.titleLarge),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().config(),
      theme: ThemeData(
        useMaterial3: true,
        textTheme: mergedTextTheme,
        scaffoldBackgroundColor: AppColors.gray100,
        colorScheme: const ColorScheme.light(
          primary: AppColors.brown,
          onPrimary: Colors.white,
          secondary: AppColors.amber,
          onSecondary: Colors.black,
          error: Color(0xFFB00020),
          onError: Colors.white,
          surface: AppColors.sand50,
          onSurface: Colors.black,
        ),
      ),
    );
  }
}
