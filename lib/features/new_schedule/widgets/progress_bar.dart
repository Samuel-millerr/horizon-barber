import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

enum ProgressBarStepStatus { done, current, pending }

class ProgressBarStep {
  final String label;
  final ProgressBarStepStatus status;

  const ProgressBarStep({required this.label, required this.status});
}

class ProgressBar extends StatelessWidget {
  final int currentStep;

  const ProgressBar({super.key, required this.currentStep});

  static const List<String> labels = ["SERVIÇO", "DATA", "CONFIRMAR"];

  // Retorna o indice específico permitindo a mudança do status
  ProgressBarStepStatus statusOf(int index) {
    if (index < currentStep) return ProgressBarStepStatus.done;
    if (index == currentStep) return ProgressBarStepStatus.current;
    return ProgressBarStepStatus.pending;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < labels.length; i++) ...[
          StepDot(index: i, label: labels[i], status: statusOf(i)),
          if (i < labels.length - 1) StepConnector(done: i < currentStep),
        ],
      ],
    );
  }
}

class StepDot extends StatelessWidget {
  final int index;
  final String label;
  final ProgressBarStepStatus status;

  const StepDot({
    required this.index,
    required this.label,
    required this.status,
  });

  Color get dotColor {
    return switch (status) {
      ProgressBarStepStatus.done => AppColors.gold,
      ProgressBarStepStatus.current => AppColors.gold,
      ProgressBarStepStatus.pending => AppColors.surface2,
    };
  }

  Color get labelColor {
    return switch (status) {
      ProgressBarStepStatus.done => AppColors.gold,
      ProgressBarStepStatus.current => AppColors.gold,
      ProgressBarStepStatus.pending => AppColors.textMuted,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: dotColor.withAlpha(30),
            shape: BoxShape.circle,
            border: Border.all(color: dotColor, width: 1.5),
          ),
          child: Center(
            child: status == ProgressBarStepStatus.done
                ? Icon(Icons.check, color: AppColors.gold, size: 18)
                : Text(
                    "${index + 1}",
                    style: AppFonts.condFont(
                      color: dotColor,
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppFonts.condFont(
            color: labelColor,
            size: 12,
            weight: status == ProgressBarStepStatus.current
                ? FontWeight.w600
                : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class StepConnector extends StatelessWidget {
  final bool done;

  const StepConnector({required this.done});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18, left: 12, right: 14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width * 0.125,
        height: 1.5,
        color: done ? AppColors.gold : AppColors.border,
      ),
    );
  }
}
