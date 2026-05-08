import 'package:flutter/material.dart';
import 'package:horizon_barber/features/new_schedule/widgets/panes/service_selection_pane.dart';
import 'package:horizon_barber/features/new_schedule/widgets/progress_bar.dart';
import 'package:horizon_barber/interfaces/barber_service_interface.dart';

class NewScheduleBody extends StatelessWidget {
  // Pode ser Stateless já que o estado vive no Pai
  final int currentStep;
  final PageController pageController;
  final BarberServiceInterface? selectedService;
  final Function(BarberServiceInterface) onServiceSelected;

  const NewScheduleBody({
    super.key,
    required this.currentStep,
    required this.pageController,
    required this.selectedService,
    required this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Coloquei o Expanded aqui para ocupar o espaço entre header e footer
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: ProgressBar(currentStep: currentStep),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: ServiceSelectionPane(
                    selectedService: selectedService,
                    onServiceSelected: onServiceSelected,
                  ),
                ),
                const Center(
                  child: Text("Data", style: TextStyle(color: Colors.white)),
                ),
                const Center(
                  child: Text(
                    "Confirmação",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
