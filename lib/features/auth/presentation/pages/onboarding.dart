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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background brown shape
          Image.asset(
            'images/Rectangle.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Vector2 behind photos
          Positioned(
            top: height * 0.25,
            right: 0,
            child: Image.asset(
              'images/vector2.png',
              width: width * 0.6,
              fit: BoxFit.contain,
            ),
          ),

          // Top-left photo
          Positioned(
            top: height * 0.10,
            left: width * 0.10,
            child: _buildPhoto('images/Top left image.png', width, height),
          ),

          // Top-right photo
          Positioned(
            top: height * 0.22,
            right: width * 0.08,
            child: _buildPhoto('images/Top right image.png', width, height),
          ),

          // Bottom-left photo
          Positioned(
            top: height * 0.34,
            left: width * 0.09,
            child: _buildPhoto('images/Bottom image.png', width, height),
          ),

          // Bottom panel with text and Next button
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
                                style: const TextStyle(
                                  color: Color(0xFFDBAC57),
                                ),
                              ),
                              const TextSpan(text: ', More '),
                              TextSpan(
                                text: 'Satisfaction',
                                style: const TextStyle(
                                  color: Color(0xFFDBAC57),
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
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "We'll find easy ideas for meals that taste amazing,\nget ready to discover delicious\nthings that you and everyone will love!",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),

                  // Next button
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

  Widget _buildPhoto(String path, double width, double height) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Image.asset(
        path,
        width: width * 0.38,
        height: height * 0.21,
        fit: BoxFit.cover,
      ),
    );
  }
}
