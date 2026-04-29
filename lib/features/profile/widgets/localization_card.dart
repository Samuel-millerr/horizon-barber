import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';
import 'package:horizon_barber/features/profile/widgets/redirect_button.dart';

class LocalizationCard extends StatelessWidget {
  const LocalizationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      color: AppColors.success.withAlpha(35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.success, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(Icons.pin_drop, color: AppColors.danger, size: 20),
                Text(
                  "Localização da Barbearia",
                  style: AppFonts.condFont(
                    color: AppColors.success,
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Text(
              "Av. Monte Castelo, 392 - Jardim Proença, Campinas - SP",
              style: AppFonts.bodyFont(
                color: AppColors.textMuted,
                size: 14,
                weight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
            RedirectButton(),
          ],
        ),
      ),
    );
  }
}
