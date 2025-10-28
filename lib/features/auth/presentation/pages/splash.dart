// lib/features/auth/presentation/pages/splash.dart
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:itya_re/router/app_router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.router.replace(const OnboardingRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png', // Replace with your actual asset path
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
