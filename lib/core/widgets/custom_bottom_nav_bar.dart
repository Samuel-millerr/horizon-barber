import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  static const routes = ["/home", "/new-schedule", "/profile"];

  int locationToIndex(String location) {
    return routes.indexWhere((r) => location.startsWith(r)).clamp(0, 2);
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = locationToIndex(location);

    return BottomNavigationBar(
      selectedLabelStyle: AppFonts.condFont(color: AppColors.gold, size: 12),
      unselectedLabelStyle: AppFonts.condFont(
        color: AppColors.textMuted,
        size: 12,
      ),
      currentIndex: currentIndex,
      onTap: (i) => context.go(routes[i]),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "INÍCIO"),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "AGENDAMENTO",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "PERFIL",
        ),
      ],
      backgroundColor: AppColors.bg,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.textMuted,
      elevation: 5,
    );
  }
}
