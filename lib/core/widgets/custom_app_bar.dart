import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horizon_barber/core/session/app_session.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';
import 'package:horizon_barber/core/widgets/avatar.dart';

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
            "Horizon Barber",
            style: AppFonts.mainFont(color: AppColors.gold, size: 22),
          ),
          Text(
            "BARBEARIA CLÁSSICA",
            style: AppFonts.condFont(color: AppColors.textMuted, size: 16),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () => context.push("/profile"),
          child: Avatar(
            username: AppSession.currentUsername,
            size: 42,
            padding: const EdgeInsets.only(right: 16),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
