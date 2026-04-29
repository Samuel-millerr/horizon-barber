import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';
import 'package:horizon_barber/features/home/widgets/scheduling_card.dart';
import 'package:horizon_barber/interfaces/barber_service_interface.dart';

class HomeBody extends StatelessWidget {
  final List<Map<String, dynamic>> BarberServiceInterfaces = [
    {"id": 1, "title": "Corte Classico", "price": "35.00", "schedulingTime": "30"},
    {"id": 2, "title": "Corte Classico", "price": "35.00", "schedulingTime": "30"},
  ];
  HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "SERVIÇOS POPULARES",
            style: AppFonts.condFont(
              size: 16,
              color: AppColors.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          for (Map<String, dynamic> item in BarberServiceInterfaces)
            SchedulingCard(service: BarberServiceInterface.fromJson(item)),
        ],
      ),
    );
  }
}
