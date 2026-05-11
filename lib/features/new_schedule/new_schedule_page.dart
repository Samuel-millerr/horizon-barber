import "package:flutter/material.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/widgets/custom_page_header.dart";
import "package:horizon_barber/features/new_schedule/widgets/navigation_buttons.dart";
import "package:horizon_barber/features/new_schedule/widgets/new_schedule_body.dart";
import "package:horizon_barber/interfaces/barber_service_interface.dart";

class NewSchedulePage extends StatefulWidget {
  const NewSchedulePage({super.key});

  @override
  State<NewSchedulePage> createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  final PageController pageController = PageController();
  int currentStep = 0;
  final int totalSteps = 3;
  BarberServiceInterface? selectedService;
  DateTime? selectedDate;

  void prevStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
      pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void nextStep() {
    if (currentStep == 0 && selectedService == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione um serviço para continuar")),
      );
      return;
    }

    if (currentStep == 1 && selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione uma data para continuar")),
      );
      return;
    }

    if (currentStep < totalSteps - 1) {
      setState(() => currentStep++);
      pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      finishAppointment();
    }
  }

  void finishAppointment() {
    final body = {
      "service_id": selectedService?.name,
      "date": selectedDate.toString(),
    };
    print("Enviando para API: $body");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          CustomPageHeader(
            title: "Novo Agendamento",
            subTitle: "Escolha o servico e a data desejada",
          ),
          NewScheduleBody(
            currentStep: currentStep,
            pageController: pageController,
            selectedService: selectedService,
            selectedDate: selectedDate,
            onServiceSelected: (service) {
              setState(() {
                selectedService = service;
              });
            },
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationButtons(
        currentStep: currentStep,
        totalSteps: totalSteps,
        onBack: prevStep,
        onNext: nextStep,
      ),
    );
  }
}
