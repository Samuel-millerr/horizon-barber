import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) changeIndex;
  const CustomBottomNavBar({
    super.key,
    required this.changeIndex,
    required this.currentIndex,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: AppFonts.condFont(
        color: AppColors.gold,
        size: 12,
      ),

      unselectedLabelStyle: AppFonts.condFont(
        color: AppColors.textMuted,
        size: 12,
      ),

      currentIndex: widget.currentIndex,
      onTap: widget.changeIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "INÍCIO"),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: "AGENDAMENTO"),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "AGENDA",
        ),
      ],
      backgroundColor: AppColors.bg,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.textMuted,
      elevation: 5,
    );
  }
}
