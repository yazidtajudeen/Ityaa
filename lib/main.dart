import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shared/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;
    final poppinsText = GoogleFonts.poppinsTextTheme(baseTextTheme);
    // Use Abhaya Libre for display/heading styles, keep Poppins as body
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
        textTheme: mergedTextTheme,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.brown,
          onPrimary: Colors.white,
          secondary: AppColors.amber,
          onSecondary: Colors.black,
          error: const Color(0xFFB00020),
          onError: Colors.white,
          background: AppColors.cream50,
          onBackground: Colors.black,
          surface: AppColors.sand50,
          onSurface: Colors.black,
        ),
        scaffoldBackgroundColor: AppColors.gray100,
        useMaterial3: true,
      ),
    );
  }
}
