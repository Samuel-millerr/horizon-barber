import 'package:flutter/material.dart';
import 'package:horizon_barber/core/services/api_service.dart';
import 'package:horizon_barber/core/widgets/body_title.dart';
import 'package:horizon_barber/features/home/widgets/scheduling_card.dart';
import 'package:horizon_barber/interfaces/barber_service_interface.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<dynamic> barberServices = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final result = await ApiService.getBarberServices();
      setState(() {
        barberServices = result["message"];
      });
    } catch (e) {
      print("Erro ao carregar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
