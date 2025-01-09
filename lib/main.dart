import 'package:flutter/material.dart';
import 'package:food/Presentation/views/SelectLocation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Presentation/views/Onboardingone.dart';
import 'Presentation/views/Onboardingtwo.dart';
import 'Presentation/views/Splash.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  const String supabaseUrl = 'https://bwnyosocxcecojsozqdg.supabase.co';
  const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ3bnlvc29jeGNlY29qc296cWRnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU4NjA2MDEsImV4cCI6MjA1MTQzNjYwMX0.cBg6bJfc3u8uNHrx5kzU6-fEKM08TpCKH_AfQTMPC1E';
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: "/selectlocation",
      routes: {
        "/splash": (context) => Splash(),
        "/onboardingone": (context) => Onboardingone(),
        "/onboardingtwo": (context) => Onboardingtwo(),
        "/selectlocation": (context) => SelectLocation(),
      },
    );
  }
}
