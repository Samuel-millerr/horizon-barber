import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';

enum ProgressBarStepStatus { done, current, pending }

class ProgressBarStep {
  final String label;
  final ProgressBarStepStatus status;

  const ProgressBarStep({required this.label, required this.status});
}

class NewScheduleProgressBar extends StatelessWidget {
  final int currentStep;

  const NewScheduleProgressBar({super.key, required this.currentStep});

  static const List<String> _labels = ["SERVIÇO", "DATA", "HORA", "CONFIRMAR"];

  // Retorna o indice específico permitindo a mudança do status
  ProgressBarStepStatus _statusOf(int index) {
    if (index < currentStep) return ProgressBarStepStatus.done;
    if (index == currentStep) return ProgressBarStepStatus.current;
    return ProgressBarStepStatus.pending;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _labels.length; i++) ...[
          _StepDot(index: i, label: _labels[i], status: _statusOf(i)),
          // Condição if para caso o Dot estiver em todas as posições menos a ultima adiconar um StepConnector
          if (i < _labels.length - 1) _StepConnector(done: i < currentStep),
        ],
      ],
    );
  }
}

class _StepDot extends StatelessWidget {
  final int index;
  final String label;
  final ProgressBarStepStatus status;

  const _StepDot({
    required this.index,
    required this.label,
    required this.status,
  });

  Color get _dotColor {
    return switch (status) {
      ProgressBarStepStatus.done => AppColors.gold,
      ProgressBarStepStatus.current => AppColors.gold,
      ProgressBarStepStatus.pending => AppColors.surface2,
    };
  }

  Color get _labelColor {
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
            color: _dotColor.withAlpha(30),
            shape: BoxShape.circle,
            border: Border.all(color: _dotColor, width: 1.5),
          ),
          child: Center(
            child: status == ProgressBarStepStatus.done
                ? Icon(Icons.check, color: AppColors.gold, size: 18)
                : Text(
                    "${index + 1}",
                    style: AppFonts.condFont(
                      color: _dotColor,
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
            color: _labelColor,
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

class _StepConnector extends StatelessWidget {
  final bool done;

  const _StepConnector({required this.done});

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
