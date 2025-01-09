import 'package:flutter/material.dart';
import 'package:food/Presentation/views/SelectLocation.dart';
import 'package:food/themes/colors.dart';
import 'package:geolocator/geolocator.dart';

class Onboardingtwo extends StatefulWidget {
  const Onboardingtwo({super.key});

  @override
  State<Onboardingtwo> createState() => _OnboardingtwoState();
}

class _OnboardingtwoState extends State<Onboardingtwo> {
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Location services are disabled. Please enable them.')),
        );
      }
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location permissions are denied')),
          );
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Location permissions are permanently denied.')),
        );
      }
      return;
    }

    try {
      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 0,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Location: ${position.latitude}, ${position.longitude}')),
        );
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectLocation(),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching location: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                );
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
              image: AssetImage('images/locator.png'),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(text: 'Locate '),
                      TextSpan(
                        text: 'food ',
                        style: TextStyle(color: AppColors.brightBlue),
                      ),
                      const TextSpan(text: 'vendors'),
                      const TextSpan(text: '\nnear you!'),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "We'll find easy ideas for meals that taste amazing,\nget ready to discover delicious\nthings that you and everyone will love!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
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
            onTap: _getCurrentLocation,
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
          const SizedBox(height: 27),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectLocation(),
                ),
              );
            },
            child: RichText(
              text: TextSpan(
                text: 'Enter Location Manually',
                style: TextStyle(
                    color: AppColors.brightBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
