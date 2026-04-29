import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class SuportService extends StatelessWidget {
  IconData serviceIcon;
  Color serviceIconColor;
  String serviceTitle;
  SuportService({
    super.key,
    required this.serviceIcon,
    required this.serviceTitle,
    required this.serviceIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
