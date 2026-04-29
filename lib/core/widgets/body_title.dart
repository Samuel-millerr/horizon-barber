import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class BodyTitle extends StatelessWidget {
  final String title;
  const BodyTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFonts.condFont(size: 16, color: AppColors.textMuted),
      textAlign: TextAlign.center,
    );
  }
}
