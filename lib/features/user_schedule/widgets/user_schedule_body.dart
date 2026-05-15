import "package:flutter/material.dart";
import "package:horizon_barber/core/services/api_service.dart";
import "package:horizon_barber/core/session/app_session.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:horizon_barber/core/widgets/body_title.dart";
import "package:horizon_barber/features/user_schedule/widgets/user_appointment_card.dart";
import "package:horizon_barber/interfaces/user_appointment_interface.dart";

class UserScheduleBody extends StatefulWidget {
  const UserScheduleBody({super.key});

  @override
  State<UserScheduleBody> createState() => _UserScheduleBodyState();
}

class _UserScheduleBodyState extends State<UserScheduleBody> {
  List<UserAppointmentInterface> appointments = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final username = AppSession.currentUsername;

      final result = await ApiService.getAppointmentByCurrentUser(username);

      if (!mounted) return;

      setState(() {
        if (result["success"] != true || result["message"] is! List) {
          appointments = [];
          return;
        }

        appointments = (result["message"] as List)
            .map(
              (item) => UserAppointmentInterface.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
      });
    } catch (e) {
      debugPrint("Erro ao carregar agendamentos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyTitle(title: "AGENDAMENTOS"),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  "${appointments.length}",
                  style: AppFonts.bodyFont(
                    color: AppColors.gold,
                    size: 14,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (appointments.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.event_available_outlined,
                    color: AppColors.gold.withAlpha(210),
                    size: 32,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Nenhum agendamento encontrado",
                    textAlign: TextAlign.center,
                    style: AppFonts.condFont(
                      color: AppColors.text,
                      size: 17,
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Seus proximos horarios marcados aparecem aqui.",
                    textAlign: TextAlign.center,
                    style: AppFonts.bodyFont(
                      color: AppColors.textMuted,
                      size: 13,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ...appointments.map(
            (appointment) => UserAppointmentCard(
              appointment: appointment,
              onCancel: () async {
                await ApiService.deleteAppointment(appointment.id);

                if (!mounted) return;

                setState(() {
                  appointments.removeWhere((item) => item.id == appointment.id);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
