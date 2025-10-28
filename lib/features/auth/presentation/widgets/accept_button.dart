import 'package:flutter/material.dart';
import 'package:itya_re/shared/theme/colors.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({
    super.key,
    required this.onPressed,
    this.label = 'Accept',
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
          backgroundColor: AppColors.brown,
          foregroundColor: Colors.white,
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
