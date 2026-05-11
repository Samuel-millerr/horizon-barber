import "package:flutter/material.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:horizon_barber/core/widgets/body_title.dart";
import "package:horizon_barber/interfaces/barber_service_interface.dart";

class SummaryPane extends StatelessWidget {
  final BarberServiceInterface? selectedService;
  final DateTime? selectedDate;

  const SummaryPane({
    super.key,
    required this.selectedService,
    required this.selectedDate,
  });

  static const List<String> monthNames = [
    "Jan",
    "Fev",
    "Mar",
    "Abr",
    "Mai",
    "Jun",
    "Jul",
    "Ago",
    "Set",
    "Out",
    "Nov",
    "Dez",
  ];

  String get formattedDate {
    final date = selectedDate;
    if (date == null) return "Nao selecionada";
    return "${date.day.toString().padLeft(2, "0")} ${monthNames[date.month - 1]} ${date.year}";
  }

  String get formattedPrice {
    final price = selectedService?.price ?? 0;
    return "R\$ ${price.toStringAsFixed(2).replaceAll(".", ",")}";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyTitle(title: "CONFIRMAR AGENDAMENTO"),
          const SizedBox(height: 18),
          SummaryCard(
            selectedService: selectedService,
            formattedDate: formattedDate,
            formattedPrice: formattedPrice,
          ),
          const SizedBox(height: 16),
          const _NotesCard(),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final BarberServiceInterface? selectedService;
  final String formattedDate;
  final String formattedPrice;

  const SummaryCard({
    required this.selectedService,
    required this.formattedDate,
    required this.formattedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "RESUMO DO PEDIDO",
            style: AppFonts.condFont(
              color: AppColors.gold,
              size: 14,
              weight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          SummaryRow(label: "Servico", value: selectedService?.name ?? "-"),
          Divider(color: AppColors.border, height: 18),
          SummaryRow(label: "Data", value: formattedDate),
          Divider(color: AppColors.border, height: 18),
          SummaryRow(
            label: "Duracao",
            value: "${selectedService?.durationMinutes ?? 0} min",
          ),
          Divider(color: AppColors.border, height: 18),
          SummaryRow(label: "Profissional", value: "Carlos Lima"),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: AppFonts.bodyFont(
                  color: AppColors.textMuted,
                  size: 13,
                  weight: FontWeight.w500,
                ),
              ),
              Text(
                formattedPrice,
                style: AppFonts.mainFont(
                  color: AppColors.gold,
                  size: 22,
                  weight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            label,
            style: AppFonts.bodyFont(
              color: AppColors.textMuted,
              size: 13,
              weight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.bodyFont(
                color: AppColors.text,
                size: 14,
                weight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.border, height: 18);
  }
}

class _NotesCard extends StatelessWidget {
  const _NotesCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OBSERVACOES",
            style: AppFonts.condFont(
              color: AppColors.gold,
              size: 14,
              weight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: 3,
            cursorColor: AppColors.gold,
            style: AppFonts.bodyFont(color: AppColors.text, size: 13),
            decoration: InputDecoration(
              hintText: "Ex: prefiro tesoura, deixar franja longa...",
              hintStyle: AppFonts.bodyFont(
                color: AppColors.textMuted,
                size: 13,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
