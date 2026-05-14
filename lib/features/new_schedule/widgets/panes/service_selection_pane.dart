import "package:flutter/material.dart";
import "package:horizon_barber/core/services/api_service.dart";
import "package:horizon_barber/core/widgets/body_title.dart";
import "package:horizon_barber/features/new_schedule/widgets/service_card.dart";
import "package:horizon_barber/interfaces/barber_service_interface.dart";

class ServiceSelectionPane extends StatefulWidget {
  final Function(BarberServiceInterface) onServiceSelected;
  final BarberServiceInterface? selectedService;

  const ServiceSelectionPane({
    super.key,
    required this.onServiceSelected,
    this.selectedService,
  });

  @override
  State<ServiceSelectionPane> createState() => _ServiceSelectionPaneState();
}

class _ServiceSelectionPaneState extends State<ServiceSelectionPane> {
  List<BarberServiceInterface> barberServices = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final result = await ApiService.getBarberServices();

      // 2. Convertemos a lista de Maps em uma lista de Objetos BarberServiceInterface
      final List<dynamic> data = result["message"];

      setState(() {
        barberServices = data
            .map((item) => BarberServiceInterface.fromJson(item))
            .toList();
      });
    } catch (e) {
      print("Erro ao carregar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BodyTitle(title: "ESCOLHA O SERVIÇO"),
        const SizedBox(height: 16),

        if (barberServices.isEmpty)
          const Center(child: Text("Nenhum serviço disponível"))
        else
          Expanded(
            child: ListView.builder(
              itemCount: barberServices.length,
              itemBuilder: (context, index) {
                final service = barberServices[index];

                return ServiceCard(
                  interface: service,
                  isSelected: widget.selectedService?.id == service.id,
                  onTap: () => widget.onServiceSelected(service),
                );
              },
            ),
          ),
      ],
    );
  }
}
