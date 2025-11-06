import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:itya_re/core/constants/app_constants.dart';
import 'package:itya_re/core/DI/injection.dart';
import 'package:itya_re/features/auth/domain/repositories/location_repository.dart';
import 'package:itya_re/router/app_router.dart';
import '../widgets/accept_button.dart';
import '../widgets/cancel_button.dart';

@RoutePage()
class AcceptLocationScreen extends StatefulWidget {
  const AcceptLocationScreen({super.key});

  @override
  State<AcceptLocationScreen> createState() => _AcceptLocationScreenState();
}

class _AcceptLocationScreenState extends State<AcceptLocationScreen> {
  final LocationRepository _repo = getIt<LocationRepository>();
  bool _isLoading = false;

  Future<void> _handleAccept() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    final success = await _repo.requestAndSaveLocation();

    if (mounted) {
      setState(() => _isLoading = false);
      if (success) {
        context.router.replace(const HomeRoute());
      } else {
        _showError();
      }
    }
  }

  void _showError() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Location Error'),
        content: const Text('Could not get location. Please try again.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

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
                  AcceptButton(
                    onPressed: _isLoading ? () {} : () => _handleAccept(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
