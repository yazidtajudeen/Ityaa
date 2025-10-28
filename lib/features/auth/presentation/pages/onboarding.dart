// lib/features/auth/presentation/pages/onboarding.dart
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:itya_re/router/app_router.dart';
import '../widgets/nextbutton.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background brown shape
          SizedBox(
            child: Image.asset(
              'images/Rectangle.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // Place vector2 BELOW photos by drawing it earlier in the stack
          Positioned(
            top: screenHeight * 0.25,
            right: 0,
            child: Image.asset(
              'images/vector2.png',
              width: screenWidth * 0.6,
              fit: BoxFit.contain,
            ),
          ),

          // Overlay photos above vector2 (approximate layout per mock)
          // Top-left photo
          Positioned(
            top: screenHeight * 0.10,
            left: screenWidth * 0.10,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'images/Top left image.png',
                width: screenWidth * 0.38,
                height: screenHeight * 0.21,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Top-right photo
          Positioned(
            top: screenHeight * 0.22,
            right: screenWidth * 0.08,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.asset(
                'images/Top right image.png',
                width: screenWidth * 0.38,
                height: screenHeight * 0.21,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Bottom-left photo
          Positioned(
            top: screenHeight * 0.34,
            left: screenWidth * 0.09,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.asset(
                'images/Bottom image.png',
                width: screenWidth * 0.38,
                height: screenHeight * 0.21,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Bottom white panel with text and next button (raised slightly)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 24, 56),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'More '),
                              TextSpan(
                                text: 'Taste',
                                style: TextStyle(
                                  color: const Color(0xFFDBAC57),
                                ),
                              ),
                              const TextSpan(text: ', More '),
                              TextSpan(
                                text: 'Satisfaction',
                                style: TextStyle(
                                  color: const Color(0xFFDBAC57),
                                ),
                              ),
                            ],
                          ),
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 28,
                                color: Colors.black,
                                height: 1.2,
                              ),
                          maxLines: 1,
                          softWrap: false,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "We'll find easy ideas for meals that taste amazing,\nget ready to discover delicious\nthings that you and everyone will love!",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      NextButton(
                        onPressed: () {
                          if (context.mounted) {
                            context.router.push(const AcceptLocationRoute());
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
