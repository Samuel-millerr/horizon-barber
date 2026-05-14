import "package:flutter/material.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:horizon_barber/core/widgets/body_title.dart";
import "package:horizon_barber/features/user_schedule/widgets/user_appointment_card.dart";

class UserScheduleBody extends StatefulWidget {
  const UserScheduleBody({super.key});

  @override
  State<UserScheduleBody> createState() => _UserScheduleBodyState();
}

class _UserScheduleBodyState extends State<UserScheduleBody> {
  final employees = const ["Carlos Lima", "Rafael Costa", "Marcos Silva"];

  final appointments = const [
    EmployeeAppointment(
      employeeName: "Carlos Lima",
      serviceName: "Corte + Barba Premium",
    ),
    EmployeeAppointment(
      employeeName: "Carlos Lima",
      serviceName: "Barba Completa",
    ),
    EmployeeAppointment(
      employeeName: "Rafael Costa",
      serviceName: "Combo Premium",
    ),
    EmployeeAppointment(
      employeeName: "Marcos Silva",
      serviceName: "Corte Social",
    ),
  ];

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
          ...appointments.map(
            (appointment) => UserAppointmentCard(
              appointment: appointment,
              onCancel: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Cancelamento preparado para integrar"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
