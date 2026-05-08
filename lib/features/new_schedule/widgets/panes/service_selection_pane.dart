import 'package:flutter/material.dart';
import 'package:horizon_barber/core/widgets/body_title.dart';
import 'package:horizon_barber/features/new_schedule/widgets/service_card.dart';
import 'package:horizon_barber/interfaces/barber_service_interface.dart';

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
  final List<BarberServiceInterface> _services = [
    BarberServiceInterface(
      id: 1,
      name: "Corte Clássico",
      description: "Tesoura ou máquina, acabamento perfeito",
      price: 35.0,
      durationMinutes: 30,
      icon: "✂️",
    ),
    BarberServiceInterface(
      id: 2,
      name: "Barba Completa",
      description: "Navalha quente + modelagem profissional",
      price: 30.0,
      durationMinutes: 25,
      icon: "🪒",
    ),
    BarberServiceInterface(
      id: 3,
      name: "Combo Premium",
      description: "Corte + Barba + Lavagem com produtos",
      price: 59.90,
      durationMinutes: 55,
      icon: "💈",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyTitle(title: "ESCOLHA O SERVIÇO"),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: _services.length,
            itemBuilder: (context, index) {
              final service = _services[index];
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
