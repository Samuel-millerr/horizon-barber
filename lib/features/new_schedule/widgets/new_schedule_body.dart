import "package:flutter/material.dart";
import "package:horizon_barber/features/new_schedule/widgets/panes/service_selection_pane.dart";
import "package:horizon_barber/features/new_schedule/widgets/panes/summary_pane.dart";
import "package:horizon_barber/features/new_schedule/widgets/progress_bar.dart";
import "package:horizon_barber/interfaces/barber_service_interface.dart";

class NewScheduleBody extends StatelessWidget {
  final int currentStep;
  final PageController pageController;
  final BarberServiceInterface? selectedService;
  final TextEditingController observationController;
  final Function(BarberServiceInterface) onServiceSelected;

  const NewScheduleBody({
    super.key,
    required this.currentStep,
    required this.pageController,
    required this.selectedService,
    required this.observationController,
    required this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ProgressBar(currentStep: currentStep),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 16,
                  ),
                  child: ServiceSelectionPane(
                    selectedService: selectedService,
                    onServiceSelected: onServiceSelected,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 16,
                  ),
                  child: SummaryPane(
                    selectedService: selectedService,
                    observationController: observationController,
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
