import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:horizon_barber/core/services/api_service.dart";
import "package:horizon_barber/core/session/app_session.dart";
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
  final int totalSteps = 2;
  BarberServiceInterface? selectedService;
  bool isSending = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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

  Future<void> finishAppointment() async {
    final username = AppSession.currentUsername;
    final service = selectedService;

    if (username == null || username.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Faca login antes de agendar")),
      );
      context.go("/login");
      return;
    }

    if (service == null) return;

    setState(() => isSending = true);

    try {
      await ApiService.createAppointment(
        username: username,
        service: service,
        observation: '',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Agendamento enviado com sucesso")),
      );
      context.go("/home");
    } finally {
      if (mounted) setState(() => isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      child: Column(
        children: [
          CustomPageHeader(
            title: "Novo Agendamento",
            subTitle: "Escolha o servico, a data e o horario desejados",
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
          NavigationButtons(
            currentStep: currentStep,
            totalSteps: totalSteps,
            onBack: prevStep,
            onNext: isSending ? () {} : nextStep,
          ),
        ],
      ),
    );
  }
}
