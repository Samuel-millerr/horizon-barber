import "package:flutter/material.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";

class EmployeeAppointment {
  final String employeeName;
  final String serviceName;
  final String? priceLabel;
  final String? durationLabel;
  final String statusLabel;

  const EmployeeAppointment({
    required this.employeeName,
    required this.serviceName,
    this.priceLabel,
    this.durationLabel,
    this.statusLabel = "Agendado",
  });
}

class UserAppointmentCard extends StatelessWidget {
  final EmployeeAppointment appointment;
  final VoidCallback onCancel;

  const UserAppointmentCard({
    super.key,
    required this.appointment,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(28),
            blurRadius: 14,
            offset: const Offset(0, 8),
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
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.gold.withAlpha(18),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.content_cut,
                  color: AppColors.gold,
                  size: 21,
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
                      "Com ${appointment.employeeName}",
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
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
