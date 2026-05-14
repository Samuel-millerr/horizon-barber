import "package:flutter/material.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/widgets/custom_page_header.dart";
import "package:horizon_barber/features/user_schedule/widgets/user_schedule_body.dart";

class UserSchedulePage extends StatelessWidget {
  const UserSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      child: Column(
        children: [
          CustomPageHeader(
            title: "Seus Agendamentos",
            subTitle: "Acompanhe seu histórico e agendamentos futuros",
          ),
          const UserScheduleBody(),
        ],
      ),
    );
  }
}
