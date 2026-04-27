import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bg,
      centerTitle: false,
      toolbarHeight: 75,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Barber Horizon",
            style: AppFonts.mainFont(color: AppColors.gold, size: 22),
          ),
          Text(
            "BARBEARIA CLÁSSICA",
            style: AppFonts.condFont(
              color: AppColors.textMuted,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
