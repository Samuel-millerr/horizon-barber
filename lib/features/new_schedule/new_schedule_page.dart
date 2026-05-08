import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/widgets/custom_page_header.dart';
import 'package:horizon_barber/features/new_schedule/widgets/navigation_buttons.dart';
import 'package:horizon_barber/features/new_schedule/widgets/new_schedule_body.dart';
import 'package:horizon_barber/interfaces/barber_service_interface.dart';

class NewSchedulePage extends StatefulWidget {
  const NewSchedulePage({super.key});

  @override
  State<NewSchedulePage> createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  final PageController pageController = PageController();
  int currentStep = 0;
  final int totalSteps = 4;
  BarberServiceInterface? selectedService;
  DateTime? selectedDate;
  String? selectedTime;

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
      "time": selectedTime,
    };
    print("Enviando para API: $body");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      // Dentro do build da NewSchedulePage
      body: Column(
        children: [
          CustomPageHeader(
            title: "Novo Agendamento",
            subTitle: "Escolha o serviço, data e horário desejados",
          ),
          NewScheduleBody(
            currentStep: currentStep,
            pageController: pageController,
            selectedService: selectedService,
            onServiceSelected: (service) {
              setState(() {
                selectedService = service;
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
