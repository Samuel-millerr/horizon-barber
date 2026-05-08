import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class NavigationButtons extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onBack;
  final VoidCallback onNext;

  const NavigationButtons({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.onBack,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bg,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: Row(
        children: [
          if (currentStep > 0)
            Expanded(
              flex: 1,
              child: OutlinedButton(
                onPressed: onBack,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.gold),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "VOLTAR",
                  style: AppFonts.condFont(
                    color: AppColors.gold,
                    size: 14,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          if (currentStep > 0) const SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gold,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                currentStep == totalSteps - 1 ? "FINALIZAR" : "PRÓXIMO",
                style: AppFonts.condFont(
                  color: AppColors.bg,
                  size: 14,
                  weight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
