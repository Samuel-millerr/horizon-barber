import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class SuportService extends StatelessWidget {
  final IconData serviceIcon;
  final Color serviceIconColor;
  final String serviceTitle;
  final VoidCallback? onTap;

  const SuportService({
    super.key,
    required this.serviceIcon,
    required this.serviceTitle,
    required this.serviceIconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.5),
        child: Row(
          spacing: 5,
          children: [
            Icon(serviceIcon, size: 18, color: serviceIconColor),
            SizedBox(width: 4.5),
            Text(
              serviceTitle,
              style: AppFonts.condFont(
                color: AppColors.text,
                size: 16,
                weight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
