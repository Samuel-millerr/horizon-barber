import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';
import 'package:horizon_barber/interfaces/barber_service_interface.dart';

class SchedulingCard extends StatelessWidget {
  final BarberServiceInterface service;
  const SchedulingCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
      elevation: 4,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
        side: const BorderSide(color: AppColors.border, width: 0.5),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 2,
          children: [
            Text(
              service.title,
              style: AppFonts.bodyFont(
                size: 18,
                color: AppColors.text,
                weight: FontWeight.w700,
              ),
            ),
            Text(
              "R\$ ${service.price}",
              style: AppFonts.bodyFont(size: 14, color: AppColors.gold),
            ),
            Text(
              "⏱ ${service.schedulingTime} min",
              style: AppFonts.bodyFont(size: 12, color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
