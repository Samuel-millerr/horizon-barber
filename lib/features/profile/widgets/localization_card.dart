import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';
import 'package:horizon_barber/features/profile/widgets/redirect_button.dart';

class LocalizationCard extends StatelessWidget {
  const LocalizationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.success.withAlpha(35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.success, width: 0.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.pin_drop, color: AppColors.danger, size: 18),
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
            const SizedBox(height: 4),
            Text(
              "Av. Monte Castelo, 392 - Jardim Proença, Campinas - SP",
              style: AppFonts.bodyFont(
                color: AppColors.textMuted,
                size: 14,
                weight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            RedirectButton(),
          ],
        ),
      ),
    );
  }
}
