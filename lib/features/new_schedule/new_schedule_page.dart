import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/widgets/custom_page_header.dart';
import 'package:horizon_barber/features/new_schedule/widgets/new_schedule_progress_bar.dart';

class NewSchedulePage extends StatelessWidget {
  const NewSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.bg,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomPageHeader(
              title: "Novo Agendamento",
              subTitle: "Escolha o serviço, data e horário desejados",
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 22,
                vertical: 16,
              ),
              child: NewScheduleProgressBar(currentStep: 1),
            ),
          ],
        ),
      ),
    );
  }
}
