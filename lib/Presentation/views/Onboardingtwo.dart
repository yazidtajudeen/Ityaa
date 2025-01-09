import 'package:flutter/material.dart';
import 'package:food/Presentation/views/SelectLocation.dart';
import 'package:food/themes/colors.dart';

class Onboardingtwo extends StatefulWidget {
  const Onboardingtwo({super.key});

  @override
  State<Onboardingtwo> createState() => _OnboardingtwoState();
}

class _OnboardingtwoState extends State<Onboardingtwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(314, 35, 0, 0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectLocation(),
                      ));
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: AppColors.brightBlue,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 55),
            const SizedBox(
              width: 300,
              height: 315,
              child: Image(
                image: AssetImage('images/onboarding.png'),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.brightBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 325,
                height: 57,
                decoration: BoxDecoration(
                  color: AppColors.navyBlue,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: Text(
                    'Allow Location Access',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
