import "package:flutter/material.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:url_launcher/url_launcher.dart";

class RedirectButton extends StatelessWidget {
  final Uri _url = Uri.parse(
    "https://www.google.com/maps/place/Black+Barba+Barbearia/@-22.9142994,-47.0478684,17z/data=!3m1!4b1!4m6!3m5!1s0x94c8cfe71aa532ab:0x5f483fe70fffd610!8m2!3d-22.9142994!4d-47.0478684!16s%2Fg%2F11h4pcp_t6?entry=ttu&g_ep=EgoyMDI2MDQyNy4wIKXMDSoASAFQAw%3D%3D",
  );

  RedirectButton({super.key});

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception("Não foi possível abrir $_url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: WidgetStateColor.transparent,
        side: const BorderSide(color: AppColors.success, width: 0.5),
      ),
      onPressed: _launchUrl,
      child: Row(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.map, color: AppColors.success, size: 18),
          Text(
            "Ver no Mapa",
            style: AppFonts.condFont(
              color: AppColors.success,
              size: 14,
              weight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
