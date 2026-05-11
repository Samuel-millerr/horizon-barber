import "package:flutter/material.dart";
import "package:horizon_barber/features/new_schedule/widgets/panes/calendar_pane.dart";
import "package:horizon_barber/features/new_schedule/widgets/panes/service_selection_pane.dart";
import "package:horizon_barber/features/new_schedule/widgets/panes/summary_pane.dart";
import "package:horizon_barber/features/new_schedule/widgets/progress_bar.dart";
import "package:horizon_barber/interfaces/barber_service_interface.dart";

class NewScheduleBody extends StatelessWidget {
  final int currentStep;
  final PageController pageController;
  final BarberServiceInterface? selectedService;
  final DateTime? selectedDate;
  final Function(BarberServiceInterface) onServiceSelected;
  final ValueChanged<DateTime> onDateSelected;

  const NewScheduleBody({
    super.key,
    required this.currentStep,
    required this.pageController,
    required this.selectedService,
    required this.selectedDate,
    required this.onServiceSelected,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: CalendarPane(
                    selectedDate: selectedDate,
                    onDateSelected: onDateSelected,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: SummaryPane(
                    selectedService: selectedService,
                    selectedDate: selectedDate,
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
