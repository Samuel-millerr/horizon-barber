import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';
import 'package:horizon_barber/core/widgets/avatar.dart';
import 'package:horizon_barber/features/profile/widgets/localization_card.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Avatar(
                borderColor: AppColors.gold,
                size: 72,
                photoUrl:
                    "https://avatars.githubusercontent.com/u/196840558?v=4&size=64",
              ),
              Text(
                "Nome",
                style: AppFonts.mainFont(
                  color: AppColors.text,
                  size: 24,
                  weight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "199",
                    style: AppFonts.condFont(
                      size: 16,
                      color: AppColors.textMuted,
                      weight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.horizontal_rule_rounded,
                    color: AppColors.textMuted,
                    size: 16,
                  ),
                  Text(
                    "Cliente desde 2024",
                    style: AppFonts.condFont(
                      size: 16,
                      color: AppColors.textMuted,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          LocalizationCard(),
        ],
      ),
    );
  }
}
