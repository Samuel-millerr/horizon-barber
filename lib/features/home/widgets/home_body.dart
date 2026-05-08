import 'package:flutter/material.dart';
import 'package:horizon_barber/core/widgets/body_title.dart';
import 'package:horizon_barber/features/home/widgets/scheduling_card.dart';
import 'package:horizon_barber/interfaces/barber_service_interface.dart';

class HomeBody extends StatelessWidget {
  final List<Map<String, dynamic>> barberServices = [
    {"id": 1, "name": "Corte Classico", "price": 35.00, "durationMinutes": 30},
    {"id": 2, "name": "Corte Classico", "price": 35.00, "durationMinutes": 30},
  ];
  HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BodyTitle(title: "SERVIÇOS POPULARES"),
          const SizedBox(height: 10),
          for (Map<String, dynamic> item in barberServices)
            SchedulingCard(interface: BarberServiceInterface.fromJson(item)),
        ],
      ),
    );
  }
}
