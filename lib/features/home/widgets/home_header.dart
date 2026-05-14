import 'package:flutter/material.dart';
import 'package:horizon_barber/core/session/app_session.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.border),
          bottom: BorderSide(color: AppColors.border),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0d0d0d), Color(0xFF1a1512)],
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.175,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "BEM-VINDO",
            style: AppFonts.condFont(size: 15, color: AppColors.textMuted),
          ),
          ValueListenableBuilder<String?>(
            valueListenable: AppSession.username,
            builder: (context, userName, _) {
              return Text(
                userName?.isNotEmpty == true ? userName! : "Cliente",
                style: AppFonts.mainFont(
                  size: 29,
                  color: AppColors.text,
                  weight: FontWeight.w700,
                ),
              );
            },
          ),
          Text(
            "Pronto para renovar seu estilo?",
            style: AppFonts.bodyFont(size: 16, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
