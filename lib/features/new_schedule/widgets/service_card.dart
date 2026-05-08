import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';
import 'package:horizon_barber/interfaces/barber_service_interface.dart';

class ServiceCard extends StatelessWidget {
  final BarberServiceInterface interface;
  final bool isSelected;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.interface,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.gold.withAlpha(20) : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.gold : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(interface.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    interface.name,
                    style: AppFonts.condFont(
                      color: isSelected ? AppColors.gold : Colors.white,
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interface.description,
                    style: AppFonts.condFont(
                      color: AppColors.textMuted,
                      size: 13,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "R\$ ${interface.price.toStringAsFixed(2)}",
                  style: AppFonts.condFont(
                    color: AppColors.gold,
                    size: 15,
                    weight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                if (isSelected)
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.gold,
                    size: 20,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
