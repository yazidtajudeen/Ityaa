import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:itya_re/core/constants/app_constants.dart';
import '../widgets/accept_button.dart';
import '../widgets/cancel_button.dart';

@RoutePage()
class AcceptLocationScreen extends StatelessWidget {
  const AcceptLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Container(
          width: 350,
          height: 210,
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Allow Location Access',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 25),
              const Text(
                'To serve you better,please allow access to your location.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CancelButton(onPressed: () => context.router.maybePop()),
                  const SizedBox(width: 8),
                  AcceptButton(onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
