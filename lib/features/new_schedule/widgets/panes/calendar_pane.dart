import "package:flutter/material.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:horizon_barber/core/widgets/body_title.dart";

class CalendarPane extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarPane({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CalendarPane> createState() => CalendarPaneState();
}

class CalendarPaneState extends State<CalendarPane> {
  late DateTime displayedMonth;

  static const List<String> monthNames = [
    "Janeiro",
    "Fevereiro",
    "Marco",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro",
  ];

  static const List<String> weekDays = [
    "Dom",
    "Seg",
    "Ter",
    "Qua",
    "Qui",
    "Sex",
    "Sab",
  ];

  @override
  void initState() {
    super.initState();
    final baseDate = widget.selectedDate ?? DateTime.now();
    displayedMonth = DateTime(baseDate.year, baseDate.month);
  }

  DateTime get today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void goToPreviousMonth() {
    setState(() {
      displayedMonth = DateTime(displayedMonth.year, displayedMonth.month - 1);
    });
  }

  void goToNextMonth() {
    setState(() {
      displayedMonth = DateTime(displayedMonth.year, displayedMonth.month + 1);
    });
  }

  List<Widget> buildDayTiles() {
    final firstDayOfMonth = DateTime(displayedMonth.year, displayedMonth.month);
    final daysInMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month + 1,
      0,
    ).day;
    final leadingEmptyDays = firstDayOfMonth.weekday % 7;

    return [
      for (int index = 0; index < leadingEmptyDays; index++)
        const SizedBox.shrink(),
      for (int day = 1; day <= daysInMonth; day++)
        CalendarDayTile(
          date: DateTime(displayedMonth.year, displayedMonth.month, day),
          selectedDate: widget.selectedDate,
          today: today,
          onTap: widget.onDateSelected,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final monthTitle =
        "${monthNames[displayedMonth.month - 1]} ${displayedMonth.year}";

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyTitle(title: "ESCOLHA A DATA"),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MonthButton(icon: Icons.chevron_left, onTap: goToPreviousMonth),
              Text(
                monthTitle,
                style: AppFonts.mainFont(
                  color: AppColors.text,
                  size: 18,
                  weight: FontWeight.w700,
                ),
              ),
              MonthButton(icon: Icons.chevron_right, onTap: goToNextMonth),
            ],
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 7,
            mainAxisSpacing: 3,
            crossAxisSpacing: 4,
            childAspectRatio: 1.10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (final weekDay in weekDays)
                Center(
                  child: Text(
                    weekDay,
                    style: AppFonts.condFont(
                      color: AppColors.textMuted,
                      size: 12,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ...buildDayTiles(),
            ],
          ),
          const SizedBox(height: 8),
          if (widget.selectedDate != null)
            Center(
              child: Text(
                "Data selecionada: ${widget.selectedDate!.day.toString().padLeft(2, "0")}/${widget.selectedDate!.month.toString().padLeft(2, "0")}/${widget.selectedDate!.year}",
                style: AppFonts.bodyFont(
                  color: AppColors.gold,
                  size: 14,
                  weight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MonthButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const MonthButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 36,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.border),
        ),
        child: Icon(icon, color: AppColors.textMuted, size: 20),
      ),
    );
  }
}

class CalendarDayTile extends StatelessWidget {
  final DateTime date;
  final DateTime? selectedDate;
  final DateTime today;
  final ValueChanged<DateTime> onTap;

  const CalendarDayTile({
    required this.date,
    required this.selectedDate,
    required this.today,
    required this.onTap,
  });

  bool get isSelected {
    final selected = selectedDate;
    return selected != null &&
        selected.year == date.year &&
        selected.month == date.month &&
        selected.day == date.day;
  }

  bool get isToday {
    return today.year == date.year &&
        today.month == date.month &&
        today.day == date.day;
  }

  bool get isPast => date.isBefore(today);

  @override
  Widget build(BuildContext context) {
    final textColor = isPast
        ? AppColors.textMuted.withAlpha(95)
        : isSelected
        ? AppColors.bg
        : isToday
        ? AppColors.gold
        : AppColors.text;

    return InkWell(
      onTap: isPast ? null : () => onTap(date),
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.gold : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isToday && !isSelected ? AppColors.gold : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Center(
          child: Text(
            "${date.day}",
            style: AppFonts.bodyFont(
              color: textColor,
              size: 12,
              weight: isSelected || isToday ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
