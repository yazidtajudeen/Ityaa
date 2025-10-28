import 'package:flutter/material.dart';
import 'package:itya_re/shared/theme/colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(32),
        child: Ink(
          decoration: const BoxDecoration(
            color: AppColors.brown,
            shape: BoxShape.circle,
          ),
          width: 72,
          height: 72,
          child: const Center(
            child: Icon(Icons.arrow_forward, color: Colors.white, size: 28),
          ),
        ),
      ),
    );
  }
}
