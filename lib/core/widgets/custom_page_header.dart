import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class CustomPageHeader extends StatelessWidget {
  String title;
  String subTitle;
  CustomPageHeader({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.border, width: 2),
          bottom: BorderSide(color: AppColors.border, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: AppFonts.mainFont(
              color: AppColors.text,
              size: 26,
              weight: FontWeight.w700,
            ),
          ),
          Text(
            subTitle,
            style: AppFonts.bodyFont(
              color: AppColors.textMuted,
              size: 16,
              weight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
