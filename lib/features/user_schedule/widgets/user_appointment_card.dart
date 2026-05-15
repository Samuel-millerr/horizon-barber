import "package:flutter/material.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:horizon_barber/interfaces/user_appointment_interface.dart";

class UserAppointmentCard extends StatelessWidget {
  final UserAppointmentInterface appointment;
  final VoidCallback onCancel;

  const UserAppointmentCard({
    super.key,
    required this.appointment,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final observation = appointment.observation.trim();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(32),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.gold.withAlpha(18),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.gold.withAlpha(70)),
                ),
                alignment: Alignment.center,
                child: Text(
                  appointment.serviceIcon,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.serviceName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.condFont(
                        color: AppColors.text,
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Com ${appointment.barberName}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.bodyFont(
                        color: AppColors.textMuted,
                        size: 13,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.success.withAlpha(18),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.success.withAlpha(110)),
                ),
                child: Text(
                  "Agendado",
                  style: AppFonts.bodyFont(
                    color: AppColors.success,
                    size: 12,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          if (observation.isNotEmpty) ...[
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surface2,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notes_outlined,
                        color: AppColors.gold.withAlpha(210),
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Observacao",
                        style: AppFonts.condFont(
                          color: AppColors.gold,
                          size: 13,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    observation,
                    style: AppFonts.bodyFont(
                      color: AppColors.text,
                      size: 13,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: OutlinedButton.icon(
              onPressed: onCancel,
              icon: const Icon(Icons.event_busy_outlined, size: 18),
              label: Text(
                "Cancelar agendamento",
                style: AppFonts.bodyFont(
                  color: AppColors.danger,
                  size: 14,
                  weight: FontWeight.w700,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.danger,
                side: BorderSide(color: AppColors.danger.withAlpha(170)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
