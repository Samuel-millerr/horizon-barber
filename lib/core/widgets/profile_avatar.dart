import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.textMuted, width: 1.5),
        ),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person, color: AppColors.textMuted, size: 25),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                backgroundImage: const NetworkImage(
                  "https://avatars.githubusercontent.com/u/196840558?v=4&size=64",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
