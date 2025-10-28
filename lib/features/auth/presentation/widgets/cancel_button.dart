import 'package:flutter/material.dart';
import 'package:itya_re/shared/theme/colors.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.onPressed,
    this.label = 'Cancel',
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 149,
      height: 38,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.cream50,
          foregroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
